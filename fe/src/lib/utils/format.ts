export function formatNumber(value: number | null | undefined) {
  if (value === null || value === undefined) {
    return 'N/A'
  }
  return new Intl.NumberFormat('vi-VN').format(value)
}

export function formatDate(value: string | null | undefined) {
  if (!value) {
    return 'Đang cập nhật'
  }
  return new Intl.DateTimeFormat('vi-VN', {
    day: '2-digit',
    month: 'short',
    year: 'numeric',
  }).format(new Date(value))
}

export function formatLabel(value: string | null | undefined) {
  if (!value) {
    return 'Đang cập nhật'
  }
  return value
    .replaceAll('_', ' ')
    .replace(/\b\w/g, (char) => char.toUpperCase())
}

export function formatPercent(value: number | null | undefined) {
  if (value === null || value === undefined) {
    return 'N/A'
  }
  return `${Math.round(value)}%`
}
