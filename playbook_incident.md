# Incident Playbook - ZORAN Trace

## If a key or artifact is compromised:

1. **Identify** the compromised key/artifact and stop using it immediately.
2. **Revoke**:
   - Add entry in `revocations.json` with root hash and reason.
   - If key: publish revocation on Rekor/keyserver.
3. **Notify** stakeholders:
   - Create GitHub issue and PR referencing revocation.
   - Notify mailing list / org channel.
4. **Replace**:
   - Generate new keys (preferably via KMS/HSM).
   - Update key_fingerprints.json.
5. **Re-release**:
   - Regenerate audit_log_merkle.json with new keys.
   - Anchor new root in Rekor.
6. **Audit**:
   - Independent Red Team verifies new release.
