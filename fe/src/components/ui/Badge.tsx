import type { PropsWithChildren } from 'react'

import { cn } from '../../lib/utils/cn'

export function Badge({
  children,
  tone = 'neutral',
}: PropsWithChildren<{ tone?: 'neutral' | 'green' | 'gold' | 'blue' | 'warning' }>) {
  return <span className={cn('badge', `badge-${tone}`)}>{children}</span>
}
