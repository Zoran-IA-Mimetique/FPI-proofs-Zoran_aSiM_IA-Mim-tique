# FPI Phase1 package

Ce dépôt contient les artefacts Phase1 du projet FPI (Falsifiability Polymorphic Injector).

## Contenu
- FPI_proofs_executed.ipynb : notebook exécuté avec outputs
- run_proofs.py : copie notebook + calcule SHA256 + écrit report.json
- verify_proofs.py : vérifie cohérence du hash
- .github/workflows/execute-and-sign.yml : workflow GitHub Actions

## Usage local
```bash
python3 run_proofs.py
python3 verify_proofs.py
```

## CI
À chaque `git push`, GitHub Actions exécute `run_proofs.py` et publie les artefacts.
