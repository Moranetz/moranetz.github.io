# ux-audit — moranetz.github.io
Kind: **web**  ·  Swift files: 0  ·  Web files: 89  ·  LoC: 5,765

Findings: 0 BLOCKER · 0 HIGH · 4 MEDIUM · 2 LOW

## Findings

- **[MEDIUM] NO-TOKENS**: No design-token file but 956 hex literals inline
  Create one Colors.swift / tokens.css with named semantic colors. Hardcoded hexes drift and prevent dark-mode / theme swaps.
  Reference: UX/1_DESIGN_SYSTEM_PROMPT §1

- **[MEDIUM] VIBE-1**: Emoji-as-icon (4 occurrences)
  Emoji reads as 'didn't have art.' Replace with bespoke typographic treatment, SF Symbols (semantic), or commissioned illustration.
  - index.html:936 (📋)
  - index.html:941 (💼)
  - index.html:946 (📸)
  - index.html:951 (🎬)
  Reference: UX/vibecoded_ui_smell_test §3 + memory: vibecoded_to_bespoke_10_moves

- **[MEDIUM] VIBE-2**: Color flood — 87 file(s) with 6+ distinct hex literals
  Pinterest-tutorial card kit. Color should be a thin hairline accent, not a flood. Move palette to one Colors.swift / tokens.css file.
  - resume.html (19 distinct hex colors)
  - index.html (46 distinct hex colors)
  - privacy-policy.html (10 distinct hex colors)
  - support.html (10 distinct hex colors)
  - privacy.html (10 distinct hex colors) (+82 more)
  Reference: UX/1_DESIGN_SYSTEM_PROMPT §1 + §11 + UX/8_BIOPHILIA

- **[MEDIUM] VIBE-3**: Marketing-scale headlines in app surfaces (2)
  30pt+ headlines belong on landing pages, not in-app screens. Drop straight into content.
  - apps/caltracker/terms.html:13 (size 32)
  - apps/caltracker/privacy.html:13 (size 32)
  Reference: UX/10_TYPOGRAPHY_DAILY_USE

- **[LOW] UNCAT**: No .ux-audit.yml in repo — running uncategorized audit
  Declare audience/trust/moment in a .ux-audit.yml at repo root to skip register-incompatible checks. See research/06_decision_framework.md.
  Reference: UX/research/06_decision_framework.md

- **[LOW] VIBE-4**: Monospace+caps treatment in 3 file(s)
  Design-system tic. Use one kicker per screen max. Replace remaining instances with sentence-case body.
  - resume.html
  - index.html
  - persuasion-max.html
  Reference: UX/vibecoded_ui_smell_test §4
