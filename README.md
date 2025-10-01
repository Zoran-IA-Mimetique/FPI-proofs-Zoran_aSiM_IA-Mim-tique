
# FPI-proofs — Phase 1

Ce dépôt démontre le **FPI (Falsifiability Polymorphic Injector)** en **Phase 1**.  
Il fournit un notebook exécuté, des scripts Python et un workflow GitHub Actions produisant des artefacts vérifiables avec hash **SHA256**.  

Les résultats sont transparents :
- ✅ **Prouvés** : métriques calculées et vérifiables immédiatement.
- 🎯 **Objectifs** : preuves jouet, à transformer en benchmarks publics.
- ⚠️ **Subjectifs** : jugements de style ou qualité, non mesurables.

---
# 🔐 ZORAN Trace

![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)
![Python 3.10+](https://img.shields.io/badge/python-3.10%2B-green.svg)
[![Made with ❤️ by Zoran](https://img.shields.io/badge/Made%20with-❤️-red)](mailto:tabary01@gmail.com)

ZORAN Trace est un outil **open-source de traçabilité cryptographique** permettant de :
- Calculer des **racines Merkle** sur vos artefacts (fichiers, JSON, CSV, emails).
- Générer automatiquement des **audit logs** enrichis.
- Ajouter des **signatures quotidiennes automatiques (HMAC)** avec `--auto-sign`.
- Publier vos preuves dans **Rekor** ou tout registre append-only.

---

## 🚀 Fonctionnalités principales

- ✅ Calcul automatique des **hashes SHA-256** et racines Merkle.
- ✅ Génération d’`audit_log_merkle.json` par dossier ou en lot.
- ✅ Signature HMAC **quotidienne** simple (1 mot de passe/jour → 50+ signatures automatiques).
- ✅ Mode `batch_sign` pour signer en masse plusieurs fichiers.
- ✅ Compatible avec CI/CD, Zenodo, GitHub Actions, Rekor.

---

## 📦 Installation

Clonez le dépôt :

```bash
git clone https://github.com/Zoran-IA-Mimetique/zoran-trace.git
cd zoran-trace

## 📂 Contenu

- `FPI_proofs_executed.ipynb` : Notebook Jupyter exécuté avec outputs (preuve Phase 1).  
- `run_proofs.py` : Script CI, copie le notebook, calcule SHA256 et écrit `report.json`.  
- `verify_proofs.py` : Vérification indépendante (compare SHA du notebook et de `report.json`).  
- `.github/workflows/execute-and-sign.yml` : Workflow GitHub Actions → exécution automatique.  
- `README_phase1.md` : Documentation technique Phase 1.  
- `SETUP.md` : Configuration des secrets/signatures (Phase 2).  
- `LICENSE` : Licence MIT.  
- `.gitignore` : Exclusions de sécurité.  
- `Dockerfile` : Exécution containerisée optionnelle.

---

## ⚡ Utilisation locale

```bash
# Exécuter les preuves
python3 run_proofs.py

# Vérifier le hash
python3 verify_proofs.py
