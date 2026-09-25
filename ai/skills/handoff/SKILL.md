---
name: handoff
description: Write a condensed handoff doc from the current session so a fresh Claude Code session can continue without replaying the full transcript. Use for "hand off this session", "create a handoff", "start a new session with context", "summarize this for a new session", "/handoff", or a long session where the user wants to switch sessions while keeping the thread. Not the same as /compact (same session) or /resume (replays the full transcript).
---

# Session handoff

Write for a reader with zero memory of this session — only what's needed to act.

## Location

Save to `~/.claude/handoffs/<YYYY-MM-DD>-<slug>.md`. **Not** the current workspace, **not** the Claude session scratchpad (per-session, unreachable from the new one).

## Arguments

If invoked with arguments (e.g. `/handoff <text>`), treat them as what the next session should focus on — lead with related context, trim unrelated threads.

## Structure

```markdown
# Session handoff — <slug> — <YYYY-MM-DD>

## Context
Task, why it started, repos/systems involved, plus any background/constraints/preferences the next session must keep in mind. Length follows content, not a fixed cap — stay terse, but don't cut load-bearing context to hit a sentence count.

## Decisions
Bullets: what was decided and why.

## Open questions
Bullets: unresolved items needing a decision or input — distinct from Next steps below.

## Next steps
Bullets, priority order: concrete actions still to do, not blocked on a decision (unlike Open questions) and not yet done (unlike Decisions).

## References
Paths/URLs to specs, plans, ADRs, tickets, commits, PRs, diffs already covering details — link, don't copy their content.

## Suggested skills
Skills (exact name, with plugin prefix, e.g. `myplugin:myskill`) the next session should invoke via the Skill tool, one line why each. Only name skills actually present in this session's available-skills list — never invent one.
```

Omit any section with nothing to say. No filler, no play-by-play of the conversation.

## Rules

- Redact secrets and PII before writing: API keys, tokens, passwords, connection strings, personal data.
- Write in plain, concise prose — clear over clever, no padding.
- Don't create the file speculatively — only when asked (or confirmed after you offer).

## Finish

Print the absolute path and a one-line prompt the user can paste into the new session (e.g. "read `<path>` and continue from there").
