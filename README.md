# rtk-bin

Binaire [rtk](https://github.com/rtk-ai/rtk) (édition Apache-2.0, `--no-default-features`) pour les sessions Claude Code web, qui ne peuvent pas télécharger les releases GitHub.

- `rtk-x86_64-linux.gz` : binaire Linux x86_64 compressé (+ `SHA256SUMS`)
- `template/.claude/hooks/` : hooks installés dans chaque dépôt
- `setup-repo.sh <dossier>` : ajoute la config rtk à un dépôt (idempotent)

## Ajouter rtk à un nouveau dépôt

```bash
git clone --depth 1 https://github.com/chr2l/rtk-bin /tmp/rtk-bin
bash /tmp/rtk-bin/setup-repo.sh .
```

## Mettre à jour le binaire

```bash
git clone --depth 1 --branch vX.Y.Z https://github.com/rtk-ai/rtk && cd rtk
cargo build --release --no-default-features
strip target/release/rtk && gzip -9c target/release/rtk > ../rtk-bin/rtk-x86_64-linux.gz
cd ../rtk-bin && sha256sum rtk-x86_64-linux.gz > SHA256SUMS
```

Licence du binaire : Apache-2.0 (rtk-ai/rtk). Version actuelle : 0.49.0.
