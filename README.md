# 🧰 Home Server Cloud Support Lab

A self-hosted, production-like home server built on Linux Mint to simulate real-world Cloud Servers.

This project was designed to sharpen hands-on skills in Linux, networking, system troubleshooting, monitoring, and containerized applications — all while reflecting challenges faced by Cloud teams in production.

---

🚀 If you need a full in-depth Step by Step Guide, go to docs... Have a fun night ;)   
👉 [📄 View the **Full Guide PDF**](docs/Home%20Lab%20Project.pdf)

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

## 📄 Steps and Documentatiion

## 🚀 Introduction

This project covers:

* Full setup of **Nextcloud** and **Jellyfin** in Docker containers
* Reverse proxy with **Nginx** and **Let's Encrypt SSL**
* Network security with **UFW firewall**, **Fail2Ban**, and **Tailscale VPN**
* Real-world simulation of monitoring, access control, backup, and recovery

> By the end, you'll be able to deploy and explain every part of the stack — from container orchestration to SSL security, VPN-based isolation, and firewall hardening.

---

## 🔧 What You'll Achieve

* Deploy **Nextcloud** + **MariaDB** inside Docker with persistent volumes
* Secure it using **Nginx**, **HTTPS (Let's Encrypt)**, and custom domain
* Run **Jellyfin** in an isolated environment, accessible only via **Tailscale VPN**
* Automate backups with `rsync` and cron
* Simulate incidents (SSH issues, full disk, service failures) for interview-ready experience

---

## 🔹 Components Explained

### ✨ Nextcloud

* Open-source Dropbox/Google Drive alternative
* Dockerized PHP app with Apache, uses MariaDB
* Includes sync, sharing, calendar, contacts, and extensions
* Nextcloud Dashboard
* <img width="1440" height="829" alt="image" src="https://github.com/user-attachments/assets/4ba9f2c2-aefb-4bbd-bd87-b97c502ac40c" />

### 🎧 Jellyfin

* Media streaming server like Plex
* Uses SQLite internally, no DB setup required
* Streams audio/video to any device
* Jellyfin Dashboard
* <img width="1438" height="826" alt="image" src="https://github.com/user-attachments/assets/7cf0cac3-0514-4dc3-a00b-24fce8baed34" />

### 🎧 Cockpit

* Cockpit is a web-based Linux server management tool available at https://<server-ip>:9090.
* It lets you monitor system resources, manage storage, services, networking, and users — all via a GUI.
* To enable: sudo systemctl enable --now cockpit.socket
* Access from browser & log in with your Linux username/password for real-time control.
* <img width="1434" height="825" alt="image" src="https://github.com/user-attachments/assets/ac0f97c0-39d4-4e64-bc72-6deb55b6773f" />



### 💪 Docker & Compose

* Each service (Nextcloud, DB, Jellyfin, Cockpit) in isolated containers
* Persistent volumes for `/data`, `/config`, `/media`
* `docker-compose.yml` orchestrates startup
* <img width="1086" height="196" alt="image" src="https://github.com/user-attachments/assets/64f7b801-76bb-4120-a441-ecbeae28a11e" />
* <img width="1088" height="238" alt="image" src="https://github.com/user-attachments/assets/4ee19e76-1603-4c73-b21f-137d071bf56f" />


### 🛋 Nginx Reverse Proxy

* TLS termination
* Domain routing
* HTTPS via Let's Encrypt

### 🔒 UFW + Fail2Ban

* UFW enforces network security (allow 80/443/22/tailscale0)
* Fail2Ban protects against brute-force SSH/login attacks

### 🚔 Tailscale VPN

* WireGuard-based mesh VPN
* Securely access Jellyfin & SSH from anywhere
* Optional MagicDNS + Funnel for HTTPS without port forwarding
* Access from anywhere <img width="1170" height="2532" alt="image" src="https://github.com/user-attachments/assets/8daa76cd-d172-4ff3-a971-0579ebacc23b" />

* <img width="1085" height="185" alt="image" src="https://github.com/user-attachments/assets/87addf15-2152-41ce-bb87-6490a0c84558" />

---

## 🛠️ Implementation Plan

1. **Install OS + UFW**: Linux Mint/Ubuntu, enable UFW (deny all, allow 22/80/443)
2. **Install Docker + Compose**: Standard Docker Engine setup
3. **Create Host Folders**: `/mnt/data/{nextcloud,db,jellyfin/config,jellyfin/cache,media}`
4. **Write docker-compose.yml**:

   * Nextcloud (port 8080)
   * MariaDB
   * Netdata (optional monitoring)
5. **Launch Nextcloud & DB**: `docker compose up -d`
6. **Initial Web Setup**: Admin account, DB config (localhost via Docker internal DNS)
7. **Deploy Jellyfin**: Expose only to LAN/Tailscale on port 8096
8. **Add Media Files**: `/mnt/data/media/{movies,music,photos}`
9. **Install Nginx + Configure Proxy**: Point to 127.0.0.1:8080
10. **Get HTTPS Cert via Certbot**: `sudo certbot --nginx -d yourcloud.example.com`
11. **Update Nextcloud trusted\_domains/config.php**
12. **Lock Down UFW**:

    * Allow 80/443 globally
    * Allow SSH only on `tailscale0` or LAN
    * Jellyfin: allow only on LAN or `tailscale0`
13. **Enable Tailscale**: Install + auth + test SSH/media access
14. **Verify + Monitor**: Logs, systemd, Netdata, Docker health
15. **Test Failures**: Simulate crashes, run troubleshooting
16. **Maintain + Document**: `rsync` backups, `docker pull` upgrades, firewall audits

---

## 🏛️ Architecture Overview

```
+---------------------+                  +------------------------+
|  User Devices       | <---VPN/HTTPS-- |  Tailscale / Internet  |
+---------------------+                  +------------------------+
         |                                        |
         | HTTPS                                  |
         v                                        v
+--------------------------+         +--------------------------+
| Nginx Reverse Proxy      | <-----> |  Docker Host (Linux)     |
| (Ports 80/443)           |         | - Nextcloud + MariaDB    |
+--------------------------+         | - Jellyfin (8096)        |
                                     | - Tailscale VPN          |
                                     +--------------------------+
```

---

## 🔺 Skills You Can Demonstrate

* Linux service/network troubleshooting
* Dockerized app deployment
* Nginx reverse proxy and SSL config
* Remote access control (Tailscale)
* System hardening with UFW/Fail2Ban
* Incident response simulation
* Backup & restore strategies

---

## 🚩 Real-World Scenarios Practiced

* SSH lockout and recovery
* Disk full due to logs or uploads
* TLS config & renewal
* Remote VPN access to private services
* Docker restart after host reboot
* User error recovery (e.g., database misconfig)

---

## 🚨 How to Use This Repo

* Copy the `docker-compose.yml`
* Create the `/mnt/data` directory structure
* Adjust domain names & volumes
* Add `backup.sh`, `monitor.sh`, and log rotation if needed
* Run through the full setup step-by-step

---

## 👨‍💻 Author

**Aman P.**  
Software Engineer | Cloud Enthusiast | Living in Kaizen  
[LinkedIn](https://www.linkedin.com/in/amanpratapshee/) | [GitHub](https://github.com/JanabG-HERE/)

