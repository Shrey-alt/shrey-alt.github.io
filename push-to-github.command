#!/bin/bash
# ─────────────────────────────────────────────
#  Shreyansh Portfolio → GitHub Publisher
#  Double-click this file to push & go live
# ─────────────────────────────────────────────

cd "$(dirname "$0")"

echo ""
echo "  ┌────────────────────────────────────────────────┐"
echo "  │  Publishing Shreyansh Rathod Portfolio...      │"
echo "  └────────────────────────────────────────────────┘"
echo ""

# ── Clear any stale git lock files ──────────────────
rm -f .git/index.lock .git/HEAD.lock .git/COMMIT_EDITMSG.lock 2>/dev/null
echo "  → Cleared stale git locks"

# ── Stage all changed files ──────────────────────────
git add -A
echo "  → Files staged"

# ── Commit (only if there are staged changes) ────────
if git diff --cached --quiet; then
  echo "  → Nothing new to commit, pushing existing commits..."
else
  git commit -m "Responsive mobile overhaul — fluid layout + hamburger menu

- Separate CSS files per page (index.css, hdfc-case-study.css, tata-mf-case-study.css)
- Breakpoints: 1024px tablet, 768px mobile, 480px small mobile
- Hero + footer text: JS fits each word to full width in mobile column layout
- Work images: fluid aspect-ratio (15/16 portrait, 8/5 landscape) — no fixed heights
- Hamburger menu: full-screen dark overlay with oversized nav links
- Touch device rules: hover animations disabled on mobile
- Tata MF project card linked to case study page

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>"
  echo "  → Committed"
fi

# ── Set remote and push ──────────────────────────────
git remote remove origin 2>/dev/null
git remote add origin https://github.com/Shrey-alt/shrey-alt.github.io.git
git push -u origin main

echo ""
echo "  ✅  Done! Portfolio is live at:"
echo "  🌐  https://shrey-alt.github.io"
echo ""
echo "  (GitHub Pages takes ~60 seconds to deploy)"
echo ""
read -p "  Press Enter to close..."
