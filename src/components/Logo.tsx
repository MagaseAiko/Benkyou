import { useId } from 'react'

type LogoMarkProps = {
  size?: number
  className?: string
}

// Sol nascendo sobre um livro aberto: 勉 + 今日 (estudar hoje).
export function LogoMark({ size = 36, className }: LogoMarkProps) {
  const clipId = useId()

  return (
    <svg
      viewBox="0 0 48 48"
      width={size}
      height={size}
      className={className}
      xmlns="http://www.w3.org/2000/svg"
      aria-hidden="true"
    >
      <defs>
        <clipPath id={clipId}>
          <circle cx="24" cy="24" r="12" />
        </clipPath>
      </defs>
      <rect x="2" y="2" width="44" height="44" rx="12" fill="var(--logo-tile)" stroke="var(--logo-ink)" strokeWidth="2.5" />
      <g clipPath={`url(#${clipId})`} fill="var(--logo-sun)">
        <rect x="10" y="10" width="28" height="15.2" />
        <rect x="10" y="26.6" width="28" height="1.8" />
        <rect x="10" y="29.8" width="28" height="1.4" />
      </g>
      <path
        d="M9 32.2c5-2.2 10.4-2.2 15 .6 4.6-2.8 10-2.8 15-.6v5.6c-5-2.2-10.4-2.2-15 .6-4.6-2.8-10-2.8-15-.6z"
        fill="var(--logo-ink)"
      />
    </svg>
  )
}

type LogoProps = {
  size?: number
  showTagline?: boolean
  className?: string
}

export function Logo({ size = 36, showTagline = true, className }: LogoProps) {
  return (
    <span className={`logo ${className ?? ''}`}>
      <LogoMark size={size} className="logo__mark" />
      <span className="logo__text">
        <span className="logo__name">benkyou</span>
        {showTagline && <span className="logo__tagline">勉今日</span>}
      </span>
    </span>
  )
}

// Ícone de ofensiva desenhado no mesmo traço do logo.
export function StreakFlame({ size = 18, className }: { size?: number; className?: string }) {
  return (
    <svg
      viewBox="0 0 24 24"
      width={size}
      height={size}
      className={className}
      xmlns="http://www.w3.org/2000/svg"
      aria-hidden="true"
    >
      <path
        d="M12 2.5c.6 3-1.2 4.6-2.8 6.3C7.6 10.5 6 12.3 6 15a6 6 0 0 0 12 0c0-2.4-1.1-4.1-2.3-5.4-.3 1.3-1 2.2-2 2.6.4-3.6-.6-7.4-1.7-9.7Z"
        fill="var(--peach)"
        stroke="var(--ink)"
        strokeWidth="1.6"
        strokeLinejoin="round"
      />
      <path
        d="M12 13.2c-1.4 1.1-2.3 2.1-2.3 3.4a2.3 2.3 0 0 0 4.6 0c0-1.3-.9-2.3-2.3-3.4Z"
        fill="var(--butter)"
        stroke="var(--ink)"
        strokeWidth="1.4"
        strokeLinejoin="round"
      />
    </svg>
  )
}
