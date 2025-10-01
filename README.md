
# FPI-proofs — Phase 1

Ce dépôt démontre le **FPI (Falsifiability Polymorphic Injector)** en **Phase 1**.  
Il fournit un notebook exécuté, des scripts Python et un workflow GitHub Actions produisant des artefacts vérifiables avec hash **SHA256**.  

Les résultats sont transparents :
- ✅ **Prouvés** : métriques calculées et vérifiables immédiatement.
- 🎯 **Objectifs** : preuves jouet, à transformer en benchmarks publics.
- ⚠️ **Subjectifs** : jugements de style ou qualité, non mesurables.

---

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
