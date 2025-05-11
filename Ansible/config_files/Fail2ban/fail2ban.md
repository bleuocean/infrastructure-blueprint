# 🛡️ Fail2Ban Configuration Notes

This file documents the use of custom Fail2Ban configurations used in this infrastructure blueprint.  
Fail2Ban protects against brute-force attacks and other abuse by monitoring log files and applying firewall bans.

---

## 📁 File: `ssh.local`

Path: `/etc/fail2ban/jail.d/ssh.local`

This file overrides the default SSH jail settings with hardened values:

```ini
[sshd]
enabled  = true
port     = xxxx                # Custom SSH port (defined elsewhere)
filter   = sshd
logpath  = /var/log/auth.log
maxretry = 2                   # Allow 2 failed attempts max
findtime = 600                 # Time window: 10 minutes
bantime  = 14400               # Ban duration: 4 hours
backend  = systemd             # Faster parsing via journald
```

---

## 🧭 File: `fail2ban.local`

Path: `/etc/fail2ban/fail2ban.local`

```ini
[DEFAULT]
ignoretimezone = true
```

This setting is used to avoid issues with timezone parsing in log files.  
It's especially useful if:

- Fail2Ban is installed before time synchronization (e.g. chrony)
- You switch all servers to UTC (as in this project)
- Logs are written with inconsistent or system-specific timezone info

It prevents parsing warnings or bans being skipped due to timezone mismatches.

---

## 📦 Deployment Notes

These files are stored under `config_files/fail2ban/` and deployed via Ansible.  
No jails are modified in-place; all overrides are structured and traceable.
