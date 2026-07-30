#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
INSTALL_DIR="$HOME/.local/bin"

mkdir -p "$INSTALL_DIR"

echo "[setup] Installing system dependencies"

if command -v apt >/dev/null; then
    sudo apt update
    sudo apt install -y curl unzip git nodejs npm
fi


echo "[setup] Installing Rokit"

if ! command -v rokit >/dev/null; then
    cd /tmp

    curl -LO https://github.com/rojo-rbx/rokit/releases/latest/download/rokit-linux-x86_64.zip

    unzip -o rokit-linux-x86_64.zip

    chmod +x rokit

    mv rokit "$INSTALL_DIR/"

    export PATH="$INSTALL_DIR:$PATH"
fi


echo "[setup] Installing Wally"

if ! command -v wally >/dev/null; then
    cd /tmp

    curl -LO https://github.com/UpliftGames/wally/releases/latest/download/wally-linux-x86_64.zip

    unzip -o wally-linux-x86_64.zip

    chmod +x wally

    mv wally "$INSTALL_DIR/"

    export PATH="$INSTALL_DIR:$PATH"
fi


echo "[setup] Installing project tools"

cd "$ROOT_DIR"

if command -v rokit >/dev/null; then
    rokit add lune || true
    rokit add darklua || true
fi


echo "[setup] Installing npm dependencies"

if [ -f package.json ]; then
    npm install --no-audit --no-fund
fi


echo "[setup] Adding PATH"

if ! grep -q ".local/bin" "$HOME/.bashrc"; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
fi


echo ""
echo "[setup] Installed tools:"
rokit --version 2>/dev/null || true
wally --version 2>/dev/null || true
lune --version 2>/dev/null || true
darklua --version 2>/dev/null || true


echo ""
echo "[setup] Complete"