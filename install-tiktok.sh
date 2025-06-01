#!/bin/bash

APP_NAME="TikTok"
INSTALL_DIR="/opt/tiktok"

if [ "$SUDO_USER" ]; then
    USER_HOME=$(eval echo "~$SUDO_USER")
else
    USER_HOME="$HOME"
fi

DESKTOP_FILE="$USER_HOME/.local/share/applications/tiktok.desktop"

echo "⚙ Installing $APP_NAME..."

echo "🌐 Creating $APP_NAME with nativefier..."
nativefier --name "$APP_NAME" "https://www.tiktok.com" || { echo "❌ Nativefier build failed!"; exit 1; }

if [ ! -d "${APP_NAME}-linux-x64" ]; then
    echo "❌ Error: '${APP_NAME}-linux-x64' folder not found."
    exit 1
fi

echo "📁 Installing to $INSTALL_DIR..."

sudo rm -rf "$INSTALL_DIR"
sudo cp -r "${APP_NAME}-linux-x64" "$INSTALL_DIR"

echo "🔧 Setting permissions..."
sudo chown -R root:root "$INSTALL_DIR"
sudo chmod -R 755 "$INSTALL_DIR"

echo "🖥 Creating desktop shortcut..."

mkdir -p "$(dirname "$DESKTOP_FILE")"

cat > "$DESKTOP_FILE" <<EOL
[Desktop Entry]
Name=$APP_NAME
Comment=TikTok web app packaged with Nativefier
Exec=$INSTALL_DIR/$APP_NAME
Icon=$INSTALL_DIR/resources/app/icon.png
Terminal=false
Type=Application
Categories=AudioVideo;Player;Multimedia;
EOL

chmod +x "$DESKTOP_FILE"

chown $SUDO_USER:$SUDO_USER "$DESKTOP_FILE" 2>/dev/null || true

echo "✅ $APP_NAME has been installed successfully!"
echo "🎉 You can now launch it from the application menu."
