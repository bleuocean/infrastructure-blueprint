#!/bin/bash
set -euo pipefail

KEYS=(
  "identityfile_01"
  "identityfile_02"
  "identityfile_03"
  "identityfile_04"
  "identityfile_05"
)

ENCRYPTED_DIR="$HOME/.ssh/encrypted"

echo
read -rsp "🔐 Enter master decryption password: " MASTER_PASS
echo

for KEY in "${KEYS[@]}"; do
  ENC_KEY="$ENCRYPTED_DIR/$KEY.enc"

  if [[ ! -f "$ENC_KEY" ]]; then
    echo "❌ Missing encrypted key: $ENC_KEY"
    continue
  fi

  openssl enc -aes-256-cbc -pbkdf2 -d -in "$ENC_KEY" -pass pass:"$MASTER_PASS" | ssh-add -t 900 -
done

echo "✅ All ${#KEYS[@]} keys added to ssh-agent for 15 min."
