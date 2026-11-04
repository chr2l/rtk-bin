# Consignes pour Claude — rtk-bin

- Dépôt **public** : rien de personnel (adresses, IP, noms de dépôts privés, secrets).
- Contenu : binaire rtk compressé (`rtk-x86_64-linux.gz` + `SHA256SUMS`), hooks modèles (`template/.claude/hooks/`), `template/CLAUDE.md` (modèle pour un nouveau dépôt), `setup-repo.sh`.
- `setup-repo.sh <dossier>` doit rester idempotent. Le tester sur un dossier jetable (`mktemp -d` + `git init`), deux fois de suite.
- Mettre à jour le binaire : procédure dans README.md ; toujours régénérer `SHA256SUMS`.
