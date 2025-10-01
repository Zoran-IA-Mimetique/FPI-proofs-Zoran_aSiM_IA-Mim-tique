#!/usr/bin/env python3
import json,hashlib,os,sys
report='report.json'; nb='FPI_proofs_executed_byCI.ipynb'
if not os.path.exists(report): print('report.json missing'); sys.exit(2)
with open(report) as f: rep=json.load(f)
sha=rep.get('_artifact_sha256')
if not sha: print('no sha in report'); sys.exit(2)
if not os.path.exists(nb): print('notebook missing'); sys.exit(2)
with open(nb,'rb') as f: data=f.read()
h=hashlib.sha256(data).hexdigest()
print('reported:',sha); print('computed:',h)
if h==sha: print('OK'); sys.exit(0)
else: print('MISMATCH'); sys.exit(3)
