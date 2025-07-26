# 🧰 Home Server Cloud Support Lab

A self-hosted, production-like home server built on Linux Mint to simulate real-world Cloud Servers.

This project was designed to sharpen hands-on skills in Linux, networking, system troubleshooting, monitoring, and containerized applications — all while reflecting challenges faced by Cloud teams in production.

---

## 🛠️ Setup Overview

| Tool / Service | Purpose |
|----------------|---------|
| **Linux Mint** | Base OS for server |
| **Cockpit** | Web-based server manager |
| **Docker** | Containerized apps (Nextcloud, Jellyfin) |
| **Tailscale** | Secure remote access (VPN-like) |
| **Netdata / Glances** | Real-time system monitoring |
| **Fail2Ban + UFW** | Firewall and brute force protection |
| **rsync + cron** | Scheduled backups |
| **SSH (hardened)** | CLI access, production-like debugging |

---

## 🧪 Simulated Production Scenarios

- Disk space full due to logs → resolved via `logrotate`, `du`, and LVM extension
- Service crash (Nextcloud) → container restart + volume diagnosis
- Network unreachable → diagnosed DNS + routing issues
- SSH access blocked → fail2ban recovery and log analysis
- Cockpit GUI access issues → systemd + port conflict debugging

---

## 📂 Key Project Files

| File | Description |
|------|-------------|
| `docker-compose.yml` | Multi-container setup for Nextcloud, DB, monitoring |
| `scripts/backup.sh` | Daily backup of Nextcloud data using rsync |
| `scripts/monitor.sh` | Service health check and alert script |
| `log_samples/` | Collected `/var/log` examples for debugging practice |

---

## 🎯 Learning Outcomes

✅ Hands-on Linux troubleshooting  
✅ Container management using Docker + Cockpit  
✅ Secure remote access and firewall hardening  
✅ Real production-like service diagnostics  
✅ Monitoring system metrics and automating tasks  
✅ Story-ready project for Cloud interviews

---

## 🔒 Next Steps (Optional)

- Add Tailscale Funnel to expose a public dashboard securely  
- Setup Grafana + Prometheus for advanced metrics  
- Integrate Ansible for config management

---

## 👨‍💻 Author

**Aman P.**  
Software Engineer | Cloud Enthusiast | Living in Kaizen  
[LinkedIn](https://www.linkedin.com/in/amanpratapshee/) | [GitHub](https://github.com/JanabG-HERE/)

