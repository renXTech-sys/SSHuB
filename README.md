<div align="center">

# 🚀 SSHUB

**Interactive Terminal Dashboard for VPS & SSH Management**

*Kelola dan pantau seluruh koneksi VPS kamu langsung dari terminal dengan tampilan clean & neon aesthetic.*

---

![Shell Script](https://img.shields.io/badge/Shell_Script-100%25-FF69B4?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Dependencies](https://img.shields.io/badge/Dependencies-jq%20%7C%20openssh-cyan?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-brightgreen?style=for-the-badge)

</div>

<br />

## 🌟 Fitur Utama

- 📊 **Real-time Stats Monitoring**: Pantau nilai **Ping (Latency)**, penggunaan **CPU**, dan **RAM** dari server kamu secara langsung sebelum melakukan koneksi.
- 🎨 **Dynamic ASCII Banner**: Menampilkan *banner/ASCII art* acak setiap kali kamu keluar dari skrip.
- ⚡ **Interactive Quick Actions**:
  - `[1-99]` — Koneksi instan ke server pilihan via SSH.
  - `[A]` — Tambah data server baru (Host/IP, Port, Username, Label).
  - `[D]` — Hapus server dari daftar.
  - `[R]` — Refresh status dan metrics server secara langsung.
  - `[Q]` — Quit dengan tampilan ASCII art estetik.
- 📁 **JSON Data Storage**: Penyimpanan data terstruktur dan aman menggunakan JSON lokal (`~/.vps_list.json`).

---

## 🛠️ Prasyarat (Dependencies)

Sebelum menjalankan skrip, pastikan sistem Linux/macOS kamu sudah terpasang dependensi berikut:

- `bash`
- `jq` (untuk pemrosesan data JSON)
- `openssh-client`
- `ping`

### Cara Install Dependensi:

**Ubuntu / Debian:**
```bash
sudo apt update && sudo apt install -y jq openssh-client iputils-ping

