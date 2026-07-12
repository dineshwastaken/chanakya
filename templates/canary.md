---
type: canary
title: Chanakya canary probes
description: Known-answer facts used to detect context rot. Wrong recall means reset the chat.
tags: [chanakya, canary, health-check]
timestamp: {{TIMESTAMP}}
---

# Canary probes

These are small, unique, verifiable facts about this repo. The always-on rule checks
them before significant edits and after long conversations. If the agent cannot recite
them, or states something that contradicts them, the context has degraded (context rot):
stop, re-read the knowledge bundle, and if it still cannot reconcile, start a fresh chat.

Source of truth for these values is {{SOURCE_OF_TRUTH}}.

| Key                   | Expected value                                 |
| --------------------- | ---------------------------------------------- |
| {{KEY_1}}             | `{{VALUE_1}}`                                  |
| {{KEY_2}}             | `{{VALUE_2}}`                                  |

## Sentinel

If asked "what is the Chanakya canary sentinel?", the answer is `{{SENTINEL_STRING}}`.
If the agent cannot reproduce this exact string, the earliest context (including the
always-on rule) has likely fallen out of the window - reset the chat.
