# 🧰 Tools & Components Overview

This document provides a short explanation of each key component used in the infrastructure blueprint.  
Each tool is selected for reliability, transparency, and ability to integrate into a secure, observable stack.

---

## Ansible
**Infrastructure automation and configuration management tool.**  
Used for: provisioning systems, deploying configurations, managing services (e.g., Filebeat, ClamAV), and enforcing security policies.  
Ansible roles and templates ensure consistency across Debian/Ubuntu-based environments and allow repeatable, version-controlled infrastructure setup.

## Wazuh
**Open source SIEM and host-based intrusion detection system (HIDS).**  
Used for: log correlation, file integrity monitoring, rootkit detection, and security alerts.

## Filebeat
**Lightweight shipper for forwarding and centralizing log data.**  
Used for: sending system logs and application logs to Elasticsearch.

## Auditbeat
**Audit framework data collector and file integrity monitor.**  
Used for: tracking commands, logins, process activity, and file changes.

## Fail2Ban
**Log-based intrusion prevention tool.**  
Used for: detecting brute-force attacks (e.g., SSH) and banning offending IPs using the firewall.

## ClamAV
**Open source antivirus engine.**  
Used for: scanning files in real-time and on schedule, with quarantine support for infected files.

## Lynis
**Unix security auditing and compliance tool.**  
Used for: local system audits, hardening suggestions, and benchmarking against standards like CIS.

## UFW (Uncomplicated Firewall)
**Frontend for iptables to manage host-based firewall rules.**  
Used for: restricting inbound/outbound traffic and enforcing default-deny policies.

## Chrony
**Time synchronization service for Linux systems.**  
Used for: accurate and secure timekeeping, critical for log correlation and forensic integrity.

---

Each tool is integrated and configured via Ansible, and where possible monitored for health and activity.