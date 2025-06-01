# TikTok Nativefier Installer 🎵📦

> **NOTE:** This project is not maintained. Use at your own risk.

This project provides a simple script to install TikTok as a desktop app on Linux using Nativefier.

## 🧰 Requirements

* Node.js (LTS)
* Nativefier (`npm install -g nativefier`)
* A Linux system (tested on Debian and Arch-based distributions)

## 🚀 Installation

1. Clone this repository or download the files into a folder, then navigate into it:

   ```bash
   cd nativefier-tiktok-installer
   ```

2. Make the installer script executable:

   ```bash
   chmod +x install-tiktok.sh
   ```

3. Run it with sudo:

   ```bash
   sudo ./install-tiktok.sh
   ```

This script will:

* Create the TikTok app from `https://www.tiktok.com` using Nativefier.
* Copy the application files into `/opt/tiktok`.
* Create a `.desktop` launcher for the current user.

## 📂 Project Structure

```
nativefier-tiktok-installer/
├── install-tiktok.sh   # The installation script
└── README.md           # This file
```

## 📦 Uninstallation

To remove the TikTok application and its shortcut:

```bash
sudo rm -rf /opt/tiktok
rm ~/.local/share/applications/tiktok.desktop
```

## ⚠️ Notes

* If Nativefier is not installed yet, run:

  ```bash
  npm install -g nativefier
  ```
* The `.desktop` launcher is created in the current user’s `~/.local/share/applications/` directory.
* This project is **no longer maintained**. It may stop working with future updates of TikTok or Nativefier.

## 🙌 Credits

Made by Thibaut Bracquart using [Nativefier](https://github.com/nativefier/nativefier).
Feel free to fork or improve at your own discretion.
