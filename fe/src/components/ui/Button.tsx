import type { ButtonHTMLAttributes, PropsWithChildren } from 'react'

import { cn } from '../../lib/utils/cn'

type ButtonProps = PropsWithChildren<
  ButtonHTMLAttributes<HTMLButtonElement> & {
    variant?: 'primary' | 'secondary' | 'ghost' | 'danger'
    size?: 'sm' | 'md'
    block?: boolean
  }
>

export function Button({
  children,
  className,
  variant = 'primary',
  size = 'md',
  block = false,
  ...props
}: ButtonProps) {
  return (
    <button
      {...props}
      className={cn(
        'button',
        `button-${variant}`,
        size === 'sm' ? 'button-sm' : 'button-md',
        block && 'button-block',
        className,
      )}
    >
      {children}
    </button>
  )
}
