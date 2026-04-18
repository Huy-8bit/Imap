from __future__ import annotations

import json
import logging
import tempfile
import unittest
from contextlib import redirect_stderr
from io import StringIO
from pathlib import Path

from backend.libs.logs import bind_log_context, build_log_formatter, clear_log_context, get_logger, scoped_log_context, setup_logging


def _reset_root_logger() -> None:
    root_logger = logging.getLogger()
    for handler in list(root_logger.handlers):
        root_logger.removeHandler(handler)
        handler.close()
    root_logger.setLevel(logging.NOTSET)


class LoggingLibraryTests(unittest.TestCase):
    def tearDown(self) -> None:
        clear_log_context()
        _reset_root_logger()

    def test_text_logger_includes_context_and_runtime_extra(self) -> None:
        stream = StringIO()

        with redirect_stderr(stream):
            setup_logging(service_name="imap-test", level="INFO", force=True)
            logger = get_logger("tests.text", component="unit")

            bind_log_context(request_id="req-123")
            logger.info("hello logger", extra={"port": 1143})

        output = stream.getvalue()
        self.assertIn("INFO", output)
        self.assertIn("imap-test", output)
        self.assertIn("hello logger", output)
        self.assertIn('component="unit"', output)
        self.assertIn('request_id="req-123"', output)
        self.assertIn("port=1143", output)

    def test_json_logger_emits_structured_payload(self) -> None:
        stream = StringIO()

        with redirect_stderr(stream):
            setup_logging(service_name="imap-test", level="INFO", json_logs=True, force=True)
            logger = get_logger("tests.json")

            with scoped_log_context(trace_id="trace-001"):
                logger.warning("structured message", extra={"attempt": 2})

        payload = json.loads(stream.getvalue().strip())
        self.assertEqual(payload["service"], "imap-test")
        self.assertEqual(payload["level"], "WARNING")
        self.assertEqual(payload["logger"], "tests.json")
        self.assertEqual(payload["message"], "structured message")
        self.assertEqual(payload["context"]["trace_id"], "trace-001")
        self.assertEqual(payload["context"]["attempt"], 2)

    def test_file_handler_writes_log_file(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            log_dir = Path(temp_dir)
            setup_logging(
                service_name="imap-test",
                level="INFO",
                enable_console=False,
                enable_file=True,
                log_dir=log_dir,
                filename="test.log",
                force=True,
            )

            logger = get_logger("tests.file")
            logger.info("file output works")

            log_file = log_dir / "test.log"
            self.assertTrue(log_file.exists())
            self.assertIn("file output works", log_file.read_text(encoding="utf-8"))

    def test_custom_text_format_can_be_defined_via_function(self) -> None:
        stream = StringIO()

        formatter = build_log_formatter(
            service_name="imap-test",
            text_format="[{level}] {message} ({context})",
        )

        with redirect_stderr(stream):
            setup_logging(level="INFO", formatter=formatter, force=True)
            logger = get_logger("tests.custom", component="unit")
            bind_log_context(request_id="req-999")
            logger.info("custom format works")

        output = stream.getvalue().strip()
        self.assertIn("[INFO] custom format works", output)
        self.assertIn('component="unit"', output)
        self.assertIn('request_id="req-999"', output)


if __name__ == "__main__":
    unittest.main(verbosity=2)
