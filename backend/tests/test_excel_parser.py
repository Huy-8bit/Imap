from __future__ import annotations

import unittest
from pathlib import Path

from backend.domain.organizations.excel_parser import parse_organizations_excel


ROOT_DIR = Path(__file__).resolve().parents[2]
EXCEL_FILE_PATH = ROOT_DIR / "docs" / "iMapVN" / "Data" / "VIE-finaldata" / "[VIEI] Final Data.xlsx"


class ExcelParserTests(unittest.TestCase):
    def test_parse_organizations_excel(self) -> None:
        # Verify the Excel file exists
        self.assertTrue(EXCEL_FILE_PATH.exists(), f"Excel file not found at: {EXCEL_FILE_PATH}")

        # Parse the Excel file
        with open(EXCEL_FILE_PATH, "rb") as f:
            records = parse_organizations_excel(f)

        # Assert total record count matches the parsed 2381 records
        self.assertEqual(len(records), 2381)

        # Assert first record structure and sample values
        first_record = records[0]
        self.assertEqual(first_record["id"], "ROW_3")
        self.assertEqual(first_record["general"]["tradeName"], "TỔNG CÔNG TY CÔNG NGHIỆP MỎ VIỆT BẮC TKV - CTCP")
        self.assertEqual(first_record["general"]["registeredName"], "TỔNG CÔNG TY CÔNG NGHIỆP MỎ VIỆT BẮC TKV - CTCP")
        self.assertEqual(first_record["general"]["foundedYear"], 1998)
        self.assertEqual(first_record["general"]["taxCode"], "0100100015")
        self.assertEqual(first_record["general"]["location"]["province"], "TP. Hà Nội")
        self.assertEqual(first_record["general"]["location"]["ward"], "P. Phương Liệt")
        self.assertEqual(first_record["general"]["contacts"]["phone"], "02436647515")
        self.assertEqual(first_record["general"]["operationalStatus"], "Đang hoạt động")
        self.assertIsNone(first_record["general"]["closedYear"])

        # Classification assertions
        self.assertEqual(first_record["classification"]["organizationType"], "Doanh nghiệp nhà nước")
        self.assertEqual(first_record["classification"]["primaryIndustrySector"], "NÔNG NGHIỆP, LÂM NGHIỆP VÀ THUỶ SẢN")
        self.assertEqual(first_record["classification"]["otherIndustrySectors"], [
            "BÁN BUÔN VÀ BÁN LẺ",
            "XÂY DỰNG",
            "CÔNG NGHIỆP CHẾ BIẾN, CHẾ TẠO"
        ])
        self.assertEqual(first_record["classification"]["environmentalImpactAreas"], [
            "Không có tác động môi trường",
            None,
            None,
            None
        ])
        self.assertTrue(first_record["classification"]["hasPositiveSocialImpact"])
        self.assertEqual(first_record["classification"]["primaryProductType"], "Sản phẩm hữu hình")
        self.assertEqual(first_record["classification"]["otherProductType"], "Sản phẩm dịch vụ")


if __name__ == "__main__":
    unittest.main(verbosity=2)
