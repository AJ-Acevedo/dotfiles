#!/usr/bin/env bash
# Claude Code status line script
# ~/.claude/statusline-command.sh

input=$(cat)

# --- Extract fields ---
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
model=$(echo "$input" | jq -r '.model.display_name // ""')
effort=$(echo "$input" | jq -r '.effort.level // ""')
total_in=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
total_out=$(echo "$input" | jq -r '.context_window.total_output_tokens // 0')
week_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

# --- ANSI color helpers ---
RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
DIM='\033[2m'
RESET='\033[0m'

# --- 1. Current working directory (basename only) ---
dir_part=$(basename "${cwd}")

# --- 2. Git branch + colored status indicators (matching git-prompt.sh) ---
# Yellow ● = unstaged changes, Green ● = staged changes, Red ● = untracked files
branch=$(git -C "$cwd" --no-optional-locks rev-parse --abbrev-ref HEAD 2>/dev/null)
if [ -n "$branch" ]; then
  w="" i="" u=""
  git -C "$cwd" --no-optional-locks diff --no-ext-diff --quiet 2>/dev/null        || w="${YELLOW}●${RESET}"
  git -C "$cwd" --no-optional-locks diff --no-ext-diff --cached --quiet 2>/dev/null || i="${GREEN}●${RESET}"
  git -C "$cwd" --no-optional-locks ls-files --others --exclude-standard \
      --directory --no-empty-directory --error-unmatch -- ':/*' >/dev/null 2>/dev/null \
    && u="${RED}●${RESET}"
  indicators="${w}${i}${u}"
  if [ -n "$indicators" ]; then
    git_part="(${branch} ${indicators})"
  else
    git_part="(${branch})"
  fi
else
  git_part=""
fi

# --- 3. Model name ---
model_part="${model}"

# --- 4. Effort level ---
if [ -n "$effort" ]; then
  effort_capitalized=$(echo "${effort}" | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}')
  effort_part="Effort: ${effort_capitalized}"
else
  effort_part=""
fi

# --- 5. Total session tokens used ---
total_tokens=$((total_in + total_out))
if [ "$total_tokens" -gt 0 ]; then
  if [ "$total_tokens" -ge 1000000 ]; then
    tokens_fmt=$(awk "BEGIN { printf \"%.1fM\", $total_tokens/1000000 }")
  elif [ "$total_tokens" -ge 1000 ]; then
    tokens_fmt=$(awk "BEGIN { printf \"%.1fK\", $total_tokens/1000 }")
  else
    tokens_fmt="${total_tokens}"
  fi
  tokens_part="Session: ${tokens_fmt}"
else
  tokens_part=""
fi

# --- 6. Tokens remaining this week (7-day rate limit) ---
if [ -n "$week_pct" ]; then
  remaining_pct=$(awk "BEGIN { printf \"%.0f\", 100 - $week_pct }")
  week_part="Week: ${remaining_pct}% Left"
else
  week_part=""
fi

# --- Assemble output ---
# Build segments array, skip empty parts
parts=()
parts+=("${dir_part}")
[ -n "$git_part" ] && parts+=("$git_part")
[ -n "$model_part" ] && parts+=("${model_part}")
[ -n "$effort_part" ] && parts+=("${effort_part}")
[ -n "$tokens_part" ] && parts+=("${tokens_part}")
[ -n "$week_part" ] && parts+=("${week_part}")

# Join with separator
sep=$(printf " ${DIM}|${RESET} ")
result=""
for part in "${parts[@]}"; do
  if [ -z "$result" ]; then
    result="$part"
  else
    result="${result}${sep}${part}"
  fi
done

printf "%b\n" "$result"