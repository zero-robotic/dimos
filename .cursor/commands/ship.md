# /ship — end-to-end PR workflow (DimOS)

Use when the user runs `/ship <one-line request>`.

## Preconditions

- Remotes: typically `origin` = your fork (e.g. `zero-robotic/dimos`), `upstream` = `dimensionalOS/dimos` (verify with `git remote -v`).
- Base branch for PRs: **`dev`** (not `main`). Confirm with `AGENTS.md` if policy changes.

## Steps

1. **Sync base**: `git fetch upstream` (and `git fetch origin`). Checkout `dev`, merge or rebase `upstream/dev` (or `origin/dev`) so the branch is current.
2. **Branch**: create `feat/…`, `fix/…`, or `chore/…` from updated `dev`.
3. **Implement** the user’s one-line request with minimal scope.
4. **Verify**: `bash scripts/verify.sh` — fix failures before commit.
5. **Commit**: conventional message (`feat:`, `fix:`, `docs:`, …).
6. **Push**: `git push -u origin <branch>` (fork).
7. **Open PR**: base **`dimensionalOS/dimos`** ← **`dev`**, compare `<branch>` from fork. Use `gh pr create` if available; if GraphQL errors right after push, retry or use GitHub REST API for the PR body.
8. **Wait for CI**: upstream checks (e.g. `ci-complete`) are authoritative; `verify.sh` is fast local parity only.
9. **Merge**: follow repo policy (squash/merge by maintainers). Do not enable bypass of required checks.
10. **Cleanup**: delete local feature branch after merge if desired.

## Notes

- ChatGPT Codex / auto-review is optional; this repo does not require it.
- Pushes trigger long self-hosted CI — batch changes when possible (`AGENTS.md`).
