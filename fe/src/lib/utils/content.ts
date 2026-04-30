export function splitParagraphs(value: string | null | undefined) {
  if (!value) {
    return []
  }

  return value
    .split(/\n{2,}/)
    .map((item) => item.trim())
    .filter(Boolean)
}
