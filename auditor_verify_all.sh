#!/bin/bash
set -e

echo "Verifying audit_log_merkle.json integrity..."

if [ ! -f audit_log_merkle.json ]; then
  echo "audit_log_merkle.json missing"
  exit 1
fi

ROOT=$(jq -r .root audit_log_merkle.json)
echo "Root from audit log: $ROOT"

# Recompute root via zoran_trace.py (verify mode)
python3 zoran_trace.py artifacts > verify_output.txt
ROOT2=$(grep "Merkle root" verify_output.txt | awk '{print $3}')

if [ "$ROOT" != "$ROOT2" ]; then
  echo "Root mismatch! $ROOT vs $ROOT2"
  exit 1
fi

# Check for signatures
SIGS=$(jq -r .signatures[] audit_log_merkle.json 2>/dev/null || true)
COUNT=$(echo "$SIGS" | grep -c . || true)
if [ "$COUNT" -lt 2 ]; then
  echo "Need at least 2 signatures. Found $COUNT"
  exit 1
fi

# Check external proof (Rekor UUID present)
UUID=$(jq -r .external_proof.uuid audit_log_merkle.json 2>/dev/null || true)
if [ -z "$UUID" ] || [ "$UUID" = "null" ]; then
  echo "Missing Rekor UUID in audit log"
  exit 1
fi

echo "Verification successful: root match, $COUNT signatures, Rekor UUID present."
