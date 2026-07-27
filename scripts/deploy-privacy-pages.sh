#!/usr/bin/env bash
# Deploy the new privacy/support pages added for hook, land, viral, distort, witness.
# These pages already exist locally at moranetz.github.io/{slug}/{privacy,support}.html
# but need to be pushed to GitHub Pages to satisfy the App Store privacy URL contract.
#
# Per memory privacy_url_audit_pre_submit: Apple silently pulls live apps if their
# privacy URL 404s. Five apps are at risk until this script runs.
#
# Run from anywhere:
#   bash ~/Developer/moranetz.github.io/scripts/deploy-privacy-pages.sh

set -euo pipefail
cd "$HOME/Developer/moranetz.github.io"

# Verify the pages exist locally before pushing
MISSING=0
for slug in viral distort hook land witness; do
  for kind in privacy support; do
    [[ -f "$slug/$kind.html" ]] || { echo "✗ missing $slug/$kind.html"; MISSING=1; }
  done
done
[[ $MISSING -eq 0 ]] || { echo "ABORT: pages missing locally. Run /tmp/make_privacy_pages.sh first."; exit 1; }
echo "✓ all 10 pages present locally"

git add viral distort hook land witness 2>/dev/null || true
git status --short

if ! git diff --cached --quiet; then
  git commit -m "Add privacy/support pages for hook, land, viral, distort, witness

Fixes ux-audit PRIV-URL BLOCKER findings.
Pages were missing — fastlane URLs in hook, land, linkedin-optimizer-ios
(Viral), persuasive-copy-ios (Distort), the-witness all pointed to 404s.
Risk per memory privacy_url_audit_pre_submit: Apple silently pulls live
apps for unreachable privacy URLs."
  git push
  echo "✓ deployed. URLs typically propagate within 60s."
else
  echo "(no changes to commit)"
fi

echo ""
echo "Verify (wait ~60s for GitHub Pages to rebuild):"
for slug in viral distort hook land witness; do
  echo "  curl -sI -o /dev/null -w '$slug → %{http_code}\\n' https://moranetz.github.io/$slug/privacy"
done
