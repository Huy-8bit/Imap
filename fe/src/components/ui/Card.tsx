import type { PropsWithChildren } from 'react'

import { cn } from '../../lib/utils/cn'

export function Card({
  children,
  className,
  style,
}: PropsWithChildren<{ className?: string; style?: React.CSSProperties }>) {
  return <section className={cn('card', className)} style={style}>{children}</section>
}
