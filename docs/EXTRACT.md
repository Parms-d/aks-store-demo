# Publishing to Its Own Repository

This workspace lives inside the `aks-store-demo` fork because the agent that built it holds a GitHub App installation token scoped to that single repository — it cannot create repositories. Everything here is self-contained and designed to be lifted out unchanged.

A ready-to-clone branch is already published where **this workspace is the repository root**, with history preserved:

```
branch: cursor/icm-standalone-edc2
```

## Fastest path

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

## Alternative: copy the folder

Loses history, but works from any checkout of this branch:

```bash
cp -r icm-cloud-engineer ~/icm-cloud-engineer
cd ~/icm-cloud-engineer
git init && git add -A && git commit -m "Initial commit: ICM + Spec Kit cloud engineer workspace"
gh repo create Parms-d/icm-cloud-engineer --public --source=. --remote=origin --push
```

## Regenerating the standalone branch

If you change the workspace and want a refreshed standalone branch:

```bash
git subtree split --prefix=icm-cloud-engineer -b icm-standalone
git push origin icm-standalone
```

## After publishing

1. Delete this file — it no longer applies
2. Install the Spec Kit CLI, then run `scripts/bootstrap-speckit.sh <integration>`
3. Point `{{PROJECT_PATH}}` at your infrastructure repo, now a sibling directory rather than a parent

Nothing references `aks-store-demo` except `docs/examples/`, which is illustrative and safe to delete.
