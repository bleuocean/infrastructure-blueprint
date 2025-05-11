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
TEMP_DIR="$HOME/.ssh/tmp_unlocked"

mkdir -p "$ENCRYPTED_DIR"
mkdir -p "$TEMP_DIR"

echo
read -rsp "🔐 Enter your new master encryption password (used for all .enc files): " MASTER_PASS
echo

for KEY in "${KEYS[@]}"; do
  ORIG_KEY="$HOME/.ssh/$KEY"
  TMP_KEY="$TEMP_DIR/$KEY.nopass"
  ENC_KEY="$ENCRYPTED_DIR/$KEY.enc"

  if [[ ! -f "$ORIG_KEY" ]]; then
    echo "❌ Missing key file: $ORIG_KEY"
    continue
  fi

  echo
  echo "🔐 Stripping passphrase from $KEY..."
  read -rsp "  ↪ Enter passphrase for $KEY: " SSH_PASS
  echo

  cp "$ORIG_KEY" "$TMP_KEY"
  chmod 600 "$TMP_KEY"

  ssh-keygen -q -p -P "$SSH_PASS" -N "" -f "$TMP_KEY" || {
    echo "❌ Failed to strip passphrase from $KEY"
    continue
  }

  echo "🔐 Encrypting $KEY.nopass with master password..."
  openssl enc -aes-256-cbc -pbkdf2 -salt -in "$TMP_KEY" -out "$ENC_KEY" -pass pass:"$MASTER_PASS"
  echo "✅ Saved encrypted: $ENC_KEY"
done

echo
read -p "⚠️ Do you want to shred the original unencrypted SSH key files? [y/N] " CONFIRM
if [[ "$CONFIRM" =~ ^[Yy]$ ]]; then
  for KEY in "${KEYS[@]}"; do
    shred -u "$HOME/.ssh/$KEY" || echo "⚠️ Failed to shred $KEY"
  done
  echo "🧹 Originals securely removed."
else
  echo "🛑 Originals left untouched."
fi

rm -rf "$TEMP_DIR"
echo "✅ All done."
