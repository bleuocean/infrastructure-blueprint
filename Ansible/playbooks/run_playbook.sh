#!/bin/bash
set -euo pipefail

# Unlock SSH keys once
~/Ansible/ssh_keystore/unlock_keys.sh

# Run Ansible with vault prompt
ansible-playbook "$@" --ask-vault-pass -i ../inventory.yml


