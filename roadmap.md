# 📍 Project Roadmap – Infrastructure Blueprint

This roadmap outlines future directions, improvements and stretch goals for the infrastructure project. It provides a high-level view of where the system is heading and the value it will bring to users.

---

## ✅ Completed

- Core infrastructure setup with Ansible
- Wazuh + Filebeat + Auditbeat integration
- Stealth log server live
- VPN-based SSH tunnels with watchdog services
- Real-time malware and file integrity scanning
- WordPress version of Threat Sensor (early prototype)

---

## 🟡 In Progress

- Threat Sensor (CMS-agnostic web logging agent)
- Public-facing dashboard for Threat Sensor users
  - Threats shown per IP, region, method
  - Basic remediation guidance
- Proxy server design added to infrastructure blueprint
- Clean-up and modularization of Ansible roles and templates

---

## 🔜 Planned

- Web proxy server software:
  - Enforce application isolation
  - Implement request logging, rate-limiting, and filtering logic
- Generalizing web agent to support any CMS or custom framework
- Automatic defensive rule injection (e.g., deny on http.access attempts)
- Metricbeat to monitor critical processes (e.g., Elasticsearch, Wazuh)
  - Trigger alerts if services crash or fail on restart
- Integration of alerting system (e.g., ElastAlert2 or alternative)
  - Slack/Signal notifications for high-severity events
- VPN server for secure remote access to log dashboard and private resources
- Add test environment with Kali tools:
  - Nmap
  - OpenVAS
  - Burp Suite
  - Automated test scenarios
- Build guidance playbooks per alert:
  - E.g., "You received X, here's how to mitigate it"

---

## 💡 Ideas (to explore)

- Build lightweight agent version for shared hosting environments
- Offer the platform as a template for IT consultants or freelancers
- Deployable with Docker/Podman for minimal installations
- Dark theme terminal-style web dashboard for hacker aesthetic

---

*This roadmap will evolve with feedback and use. Feel free to suggest improvements via GitHub Issues or reach out directly.*
📬 You can reach me via email: bleuocean-ops@proton.me