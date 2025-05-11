# 🔐 SSH Keystore Tools

This folder contains two optional Bash scripts designed to securely manage multiple SSH keys for use in this infrastructure:

- `prepare_ssh_keys.sh` — strips passphrases from private keys and encrypts them with a master password
- `unlock_keys.sh` — decrypts encrypted keys and loads them into `ssh-agent` for a short session (15 minutes)

These scripts are **optional** and are intended for setups where multiple private keys must be handled securely but need temporary unlocking for automated SSH tunneling or deployment tasks.

---

## 🔧 Usage

### 1. Prepare and encrypt keys

Run the script:

```bash
./prepare_ssh_keys.sh
```

- You will be prompted for each key's passphrase
- A single master password will be used to encrypt the unprotected key copies
- The original keys can be shredded securely (optional prompt)

Encrypted files are saved in:
```
~/.ssh/encrypted/
```

---

### 2. Unlock and load keys into ssh-agent

Run:

```bash
./unlock_keys.sh
```

- You will be asked for the master decryption password
- All keys are decrypted in-memory and added to the SSH agent
- They remain loaded for 15 minutes

---

## 📦 Notes

- These scripts do **not** require any Ansible integration
- They are meant as secure local helpers
- All encrypted files use AES-256-CBC with PBKDF2 and salt
- Unlock keys is called in run_playbook.sh, uncomment or remove it if you dont want it. 

Use only if you regularly manage multiple SSH identity files with passphrases and want a cleaner workflow.

📬 bleuocean-ops@proton.me