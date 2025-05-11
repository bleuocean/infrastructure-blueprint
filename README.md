# Infrastructure Blueprint for Secure and Observable Ops

**bleuocean/infrastructure-blueprint** is a production-grade infrastructure template designed for teams that want visibility, security, and automation without unnecessary complexity or vendor lock-in.

This project demonstrates how to combine open-source tooling with solid DevSecOps practices in a clean, reproducible, and professional setup.

---

## 🌐 What It Covers

- 🔐 VPN-based SSH tunneling with failover and stealth modes  
- 🛡️ System hardening using UFW, Fail2Ban, real-time malware scanning (ClamAV), and Lynis audits  
- 📈 Full monitoring stack with Wazuh + Filebeat + Auditbeat + ELK  
- 🧩 Modular Ansible automation for Debian 12 / Ubuntu 22.04  
- 📡 CMS-agnostic **Threat Sensor** agent for detecting login attempts and HTTP probing  
- 🧱 Proxy server design to isolate web applications  
- 🧠 Dashboard plans to visualize incoming data and guide response actions

---

## 🧱 Project Structure

```
infrastructure-blueprint/
├── ansible/
│   ├── config_files/         # OS-specific config templates (e.g., filebeat.yml, clamd.conf)
│   ├── playbooks/            # Infrastructure provisioning and configuration
│   ├── services/             # Custom systemd service files for tunnel/watchdog control
│   └── scripts/              # Bash helper scripts used in tasks or for local actions
├── monitoring/
│   ├── elk-stack.md          # Elasticsearch + Kibana setup and tips
│   └── stealth-logserver.md  # Hidden logging node ("InfraMon")
├── proxy/
│   └── [planned]             # Future proxy server configuration and logic
├── security/
│   ├── wazuh-setup.md
│   └── auditbeat-config.md
├── threat-sensor/
│   ├── agent-code/
│   └── dataflow.md           # Describes API communication to central dashboard
├── roadmap.md
└── README.md
```

---

## 🎯 Target Audience

- Small teams building their first secure infrastructure  
- Freelancers or consultants needing an auditable, explainable baseline  
- Existing IT teams comparing their own stack against a clean, practical implementation  
- Medium-sized organizations seeking to improve visibility, hardening, and automation using open-source tools  
- Recruiters or hiring managers looking for hands-on infra experience with a modern DevSecOps mindset

---

## 🧰 Technologies Used

| Area           | Tools & Components                                     |
|----------------|--------------------------------------------------------|
| OS & Stack     | Debian 12, Ubuntu 22.04, systemd                       |
| Monitoring     | Elasticsearch 8.17.4, Kibana, Filebeat, Auditbeat     |
| Security       | Wazuh, UFW, Fail2Ban, ClamAV, Lynis                   |
| Automation     | Ansible (modular, OS-aware structure)                 |
| Web Agent      | Custom-built "Threat Sensor" to detect abuse patterns |
| Proxy Layer    | Proxy server blueprint for filtered application access|
| Dashboard      | API receiver + actionable threat view (planned)       |

---

## 🛡️ Hardening Strategy

Security starts at the edge: we begin by protecting external access (SSH, firewall policies, strict port filtering), and then turn inward — auditing system state, service configuration, and user behavior.

We use:
- UFW to control inbound/forwarding rules
- Fail2Ban for basic brute force protection
- Lynis for periodic local audits based on CIS and hardening guidelines
- Custom hardening rules enforced via Ansible (e.g., SSH config, file permissions)

The goal is not just to pass a benchmark — but to understand *why* each rule exists, and whether it's relevant to this system’s threat model.

---

## 📌 Project Status

| Component                | Status     |
|--------------------------|------------|
| Main Logserver           | ✔ Complete |
| Real-time Dashboards     | ✔ Complete |
| Stealth tail logging     | ✔ Complete |
| Wazuh manager server     | ✔ Complete |
| Ansible Automation       | ✔ Complete |
| Proxy Server Blueprint   | ✔ Complete     |
| Threat Sensor Agent      | ✔ Prototyping  |
| Dashboard for Users      | 🟡 In Progress |
| Metricbeat + Alerts      | 🔜 Planned  |

---

## 💬 FAQ

**Q: Is this production-ready?**  
Yes, the infrastructure described here is currently in active use and tested across multiple machines.

**Q: Can I copy this into my project?**  
Please read the license section below — feel free to learn from it, but not to reuse it commercially.

**Q: Why this structure?**  
It reflects real-world separation of concerns: security, monitoring, automation, and application-level visibility.

---

## 📄 License & Usage

This repository is part of my personal DevSecOps portfolio.

✔ You may read, explore, and learn from this repository.  
✔ Feel free to share it or get inspired.  

❌ Do not reuse this in production or commercial settings without permission.  
❌ Do not rehost or publish this repository elsewhere.  

If you're interested in using or adapting this setup professionally, feel free to reach out.

---

## 🙋 Contact
If you're building something worth defending, or want to learn how —  
I’m always open for conversation, collaboration, or code.

📬 Reach me via email: bleuocean-ops@proton.me
📫 [GitHub](https://github.com/bleuocean)
