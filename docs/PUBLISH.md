# Publishing This Workspace

**This branch is the canonical copy.** It contains only the workspace — no application code, and no shared history with any other project.

It is hosted on the `Parms-d/aks-store-demo` branch namespace purely because the agent that built it holds a GitHub App installation token scoped to that one repository and cannot create new repositories. Nothing about the contents is tied to that project.

```
branch: cursor/icm-standalone-edc2
```

## Give it its own repository

```bash
git clone --single-branch --branch cursor/icm-standalone-edc2 \
  https://github.com/Parms-d/aks-store-demo.git icm-cloud-engineer

cd icm-cloud-engineer
git branch -M main
git remote remove origin

gh repo create Parms-d/icm-cloud-engineer --public --source=. --remote=origin --push
```

Prefer creating the empty repository in the GitHub UI first? Replace the last line with:

```bash
git remote add origin https://github.com/Parms-d/icm-cloud-engineer.git
git push -u origin main
```

Commit history is preserved either way.

## After publishing

1. Delete this file — it no longer applies
2. Install the Spec Kit CLI, then run `scripts/bootstrap-speckit.sh <integration>`
3. Say `setup` to fill the `{{PLACEHOLDER}}` values, pointing `{{PROJECT_PATH}}` at your infrastructure repository

## Separation guarantees

Verified on this branch:

| Check | Result |
|-------|--------|
| Application source in the tree | none |
| Application source anywhere in history | none |
| Shared ancestor with the host repository's `main` | none |
| Files referencing the host project | `docs/examples/` only, which is illustrative and safe to delete |

`docs/examples/` documents naming output produced against a public Microsoft sample. It is a worked example of the Lane B stage, not a dependency.
