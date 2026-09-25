# AGENTS.md

Instructions for AI coding agents (Claude Code, Codex, Cursor, etc.) working in this dotfiles repo.

## Before pushing to GitHub

This repo is public. Default posture: **assume unsafe until proven otherwise.** If in doubt, don't push — ask the user first. Being overly cautious here is never wrong; leaking something is.

Every push, do all of the following — no exceptions, no "it's probably fine":

- **Read every line of every changed/new file, in full.** Not `git diff --cached --stat`, not filenames, not a skim — the actual content. This applies to files that look boilerplate too (configs, scripts, markdown).
- **Also check full history of new files**, not just the diff: `git log -p -- <file>` for anything newly tracked, in case earlier commits on a branch carry residue.
- **Treat these as hard blockers** — do not push if any are found, no matter how minor they look:
  - API keys, tokens, secrets, passwords, connection strings, private keys (`BEGIN ... PRIVATE KEY`, `ssh-rsa`, `ssh-ed25519`), auth headers.
  - Any employer/company name, internal product name, internal repo/service name, or internal codename.
  - Internal hostnames, internal URLs, internal IPs, Slack/Jira/Confluence channel or project IDs, ticket numbers.
  - Real person names, email addresses, usernames, or handles other than the user's own where clearly needed (e.g. commit author).
  - File paths that embed employer info (e.g. `~/go/src/bitbucket.org/<employer>/...`) — genericize or remove.
  - Anything that reads like it was copy-pasted from a work conversation, ticket, or internal doc, even if scrubbed-looking.
- **When a skill or doc needs an example**, it must use obviously fake placeholders (`myplugin:myskill`, `acme-corp`, `example.com`) — never a real internal name "cleaned up," since cleanup is easy to get wrong.
- **Skill symlinks**: any dir under `~/.claude/skills/<name>` that should be tracked here must be a real symlink pointing into `ai/skills/<name>` in this repo (`ls -la ~/.claude/skills/`). If a skill is company-specific or otherwise private, it must NOT be moved into this repo — leave it as a plain untracked dir in `~/.claude/skills/`.
- **`.gitignore` coverage**: confirm nothing accidentally staged that matches patterns meant to stay local (`*.local`, `*.bak`, etc.), and confirm nothing sensitive is staged that *isn't* covered by an existing pattern.
- **If any check is ambiguous or you're not fully sure**, stop and ask the user rather than deciding it's fine. Do not rationalize a borderline finding as acceptable.

## Layout notes

- `ai/skills/<name>/SKILL.md` — portable, tool-agnostic Agent Skills (SKILL.md is an open standard, read natively by Claude Code, Codex, Cursor, and others). Symlinked from `~/.claude/skills/<name>` (and any other tool's skills dir).
- Skills that reference company-internal systems (Slack channel IDs, internal Jira/repo names, branding assets) stay out of this repo.
