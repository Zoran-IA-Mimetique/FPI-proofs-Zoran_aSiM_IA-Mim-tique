
# FPI-proofs — Phase 1
---
# 🔐 ZORAN Trace

![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)
![Python 3.10+](https://img.shields.io/badge/python-3.10%2B-green.svg)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.XXXXX.svg)](https://doi.org/10.5281/zenodo.XXXXX)
[![Made with ❤️ by Zoran](https://img.shields.io/badge/Made%20with-❤️-red)](mailto:tabary01@gmail.com)

ZORAN Trace est un outil **open-source de traçabilité cryptographique** qui vise à rendre
la preuve d’intégrité **simple, automatique et auditable**.

---

## 🚀 Fonctionnalités principales

- ✅ Calcul automatique des **hashes SHA-256** et racines Merkle.
- ✅ Génération d’`audit_log_merkle.json` par dossier ou en lot.
- ✅ Signature HMAC **quotidienne** simple (1 mot de passe/jour → 50+ signatures automatiques).
- ✅ Mode `batch_sign` pour signer en masse plusieurs fichiers.
- ✅ Compatible avec CI/CD, Zenodo, GitHub Actions, Rekor.

---

## 📦 Installation

```bash
git clone https://github.com/Zoran-IA-Mimetique/zoran-trace.git
cd zoran-trace


---

🛠️ Utilisation

1. Générer la clé quotidienne

Une seule fois le matin :

export ZORAN_DAILY_KEY=$(echo "MonMotDePasseSecret-$(date +%Y-%m-%d)" | sha256sum | cut -d' ' -f1)

2. Audit & signature automatique d’un dossier

python3 zoran_trace_autosign.py artefacts/ --auto-sign

➡️ Produit artefacts/audit_log_merkle.json :

{
  "root": "028c91627fb07...",
  "entries": [...],
  "signatures": [
    {
      "method": "hmac_sha256_daily",
      "fingerprint": "sha256:abc123...",
      "value": "49877c1a...",
      "timestamp": "2025-10-01T09:00:00Z"
    }
  ]
}

3. Audit & signature en lot (batch_sign)

python3 zoran_trace_autosign.py batch_sign --artefacts "*.json" --auto-sign

➡️ Produit batch_audit_log.json.


---

📑 Exemple concret

# Créer des fichiers
echo "hello" > file1.txt
echo "budget=12345" > file2.txt
echo '{"key":"value"}' > file3.json

# Audit + signature auto
python3 zoran_trace_autosign.py . --auto-sign


---

🔒 Sécurité

La clé quotidienne (ZORAN_DAILY_KEY) n’est valable que pour 24h → limite l’impact en cas de fuite.

Chaque audit log inclut l’empreinte SHA-256 de la clé → traçabilité totale.

En production, possibilité de migrer vers :

YubiKey / NitroKey (hardware signing)

WebAuthn / TouchID / FaceID

KMS/HSM (sécurité entreprise)




---

📊 Roadmap

v1.3 : intégration directe YubiKey/WebAuthn.

v1.4 : multi-signatures automatiques (ZORAN + Red Team).

v1.5 : interface web légère pour monitoring et validation.



---

📄 Licence

MIT — libre d’utilisation, modification et redistribution.
© 2025 — Frédéric Tabary — Institut IA Mimétique


---

📬 Contact

Auteur : Frédéric Tabary

Email : tabary01@gmail.com

Organisation : Zoran-IA-Mimetique



---

---

⚠️ Remplace dans le badge DOI la partie `XXXXX` par ton vrai DOI une fois généré par Zenodo.  

👉 Veux-tu que je génère aussi la **version courte “README_ZENODO.md”** séparée, pour que tu l’ajoutes sans écraser ton README actuel ?



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
