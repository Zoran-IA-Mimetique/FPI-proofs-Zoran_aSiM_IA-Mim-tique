#!/usr/bin/env python3
import shutil, os, hashlib, json
src = 'FPI_proofs_executed.ipynb'
dst = 'FPI_proofs_executed_byCI.ipynb'
shutil.copy(src,dst)
with open(dst,'rb') as f: data=f.read()
sha=hashlib.sha256(data).hexdigest()
report={'_artifact_sha256':sha,'status':'copied'}
with open('report.json','w',encoding='utf-8') as f: json.dump(report,f,indent=2)
print('wrote',dst,'and report.json')
print('sha256:', sha)
