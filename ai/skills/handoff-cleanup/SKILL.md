---
name: handoff-cleanup
description: Delete stale handoff files (older than 30 days) from ~/.claude/handoffs/, the directory the "handoff" skill writes to. Use when the user asks to clean up, prune, or remove old handoffs, or via /handoff-cleanup. Can also be run unattended on a schedule (via /schedule) to auto-prune in the background.
---

# Handoff cleanup

Delete files in `~/.claude/handoffs/` older than 30 days.

## Steps

1. List candidates: `find ~/.claude/handoffs -maxdepth 1 -name '*.md' -mtime +30`
2. If run interactively, show the list and confirm before deleting — this is a destructive action. If run unattended (scheduled/cron), skip confirmation and just delete.
3. Delete: `find ~/.claude/handoffs -maxdepth 1 -name '*.md' -mtime +30 -delete`
4. Report what was removed (count + filenames), or "nothing to clean up" if none matched.

## Scheduling

To run automatically, e.g. weekly: use `/schedule` with `Run /handoff-cleanup every Monday at 09:00`.
