# Chanakya producer - how to distill the docs

The "producer" turns huge raw sources into small knowledge
files under `.chanakya/knowledge/`. You do NOT run a program - you paste a prompt into a Cursor
chat and let the agent write the files.

## Step 1 - Check your paths are green

In a terminal at the repo root:

```bash
./chanakya status
```

Every source path must show `[ok]`. If any show `[!!]`, fix
`.chanakya/repo-paths.properties` first.

## Step 2 - Open a Cursor chat in Agent mode

Distillation writes files, so it must be Agent mode.

## Step 3 - Copy the prompt below and paste it into that chat

--- copy from here ---

Act as the Chanakya producer. Distill the **SECTION** knowledge completely.

1. Read `.chanakya/manifest.yaml` for the scope of the `SECTION` source, and
   `.chanakya/repo-paths.properties` for where that source lives on disk.
2. Read `.chanakya/knowledge/SECTION/index.md` to see what is already done.
3. For each source item in scope, create ONE file at `.chanakya/knowledge/SECTION/<name>.md` with
   generic YAML frontmatter and a short body: purpose, usage, do/don't, and gotchas.
4. Add a link to every new file in `.chanakya/knowledge/SECTION/index.md`.
5. Only touch files under `.chanakya/knowledge/`.
6. Distill the ENTIRE section. If the reply is too long, stop and wait for `continue`.

--- copy to here ---
