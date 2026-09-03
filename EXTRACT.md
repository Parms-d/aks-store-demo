# Extracting to Its Own Repository

This workspace currently lives inside the `aks-store-demo` fork because the agent that built it could not create GitHub repositories. It is self-contained and designed to be lifted out unchanged.

## Option 1 — Copy the folder

```bash
cp -r icm-cloud-engineer ~/icm-cloud-engineer
cd ~/icm-cloud-engineer
git init && git add -A && git commit -m "Initial commit: ICM + Spec Kit cloud engineer workspace"
```

Then create an empty repo on GitHub and push:

```bash
git remote add origin https://github.com/<you>/icm-cloud-engineer.git
git branch -M main
git push -u origin main
```

Or in one step with the GitHub CLI:

```bash
gh repo create <you>/icm-cloud-engineer --public --source=. --remote=origin --push
```

## Option 2 — Preserve history with subtree split

```bash
git subtree split --prefix=icm-cloud-engineer -b icm-standalone
git clone . ~/icm-cloud-engineer -b icm-standalone
cd ~/icm-cloud-engineer && git branch -M main
```

## After extraction

1. Delete `EXTRACT.md` — it no longer applies
2. Install Spec Kit and run `scripts/bootstrap-speckit.sh <integration>`
3. Point `{{PROJECT_PATH}}` at your infrastructure repo, which is now a sibling directory rather than a parent

Nothing in the workspace references `aks-store-demo` except `examples/`, which is illustrative and can be deleted.
