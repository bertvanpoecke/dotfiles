---
name: jira-ticket
description: Write structured Jira tickets from a brief input or description. Use this skill whenever the user asks to create, draft, or write a Jira ticket, story, task, bug report, or issue — even if they just describe a feature or problem and say "make a ticket for this" or "turn this into a ticket". Also trigger when the user pastes a rough idea and asks for it to be formalised as a ticket.
---

# Jira Ticket Skill

Given a brief input (feature idea, bug description, rough notes, or a conversation), produce a structured Jira ticket.

## Output Format

Always output the ticket description inside a markdown code block for easy copy-paste into Jira. Use this structure:

```
# <short, imperative title>

## Story Type
<Frontend only | Backend only | Fullstack | Infrastructure | Design | Other>

## Context
<1–3 sentences explaining the background, why this matters, and any relevant constraints or prior work.>

## Acceptance Criteria / Requirements
- <criterion>
- <criterion>
- ...
```

## Rules

- Title should be short and imperative (e.g. "Add pagination to the user list endpoint").
- Story type should be one of: Frontend only, Backend only, Fullstack, Infrastructure, Design, Other. If unclear, make a reasonable inference and note it.
- Context: no more than 3 sentences. Focus on the "why", not the "how".
- Acceptance criteria: use bullet points (not numbered lists). Be specific and testable where possible. Avoid padding or vague items.
- Do not include sections not listed above (no "out of scope", "notes", "links", etc.) unless the user explicitly asks.
- Keep the overall ticket concise. Prefer fewer, sharper bullets over many vague ones.
- If critical information is missing (e.g. it's unclear what the feature should do), ask a single clarifying question before writing the ticket.
- Wrap the entire ticket body in a single markdown code block.

## Example Output

````
```
# Add email notification when a user is assigned a task

## Story Type
Fullstack

## Context
Currently users have no way of knowing when a task is assigned to them without actively checking the app. Adding email notifications will reduce missed assignments and improve response time.

## Acceptance Criteria / Requirements
- Users receive an email when a task is assigned to them
- Email includes task title, description summary, due date, and a link to the task
- Users can opt out of assignment notifications in their account settings
- Notification is not sent if the assignee is the same as the assigning user
- Email template matches the existing transactional email styling
```
````
