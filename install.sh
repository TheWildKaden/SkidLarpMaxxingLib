#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR=$(cd "$(dirname "$0")" && pwd)

echo "[setup] Checking environment for SkidLarpMaxxingLib"

command -v git >/dev/null || { echo "git is required. Please install git."; exit 1; }

if ! command -v node >/dev/null; then
  echo "Node.js is not installed. On Debian/Ubuntu: sudo apt update && sudo apt install -y nodejs npm";
  exit 1
fi

if ! command -v npm >/dev/null; then
  echo "npm not found. Please install Node.js with npm included.";
  exit 1
fi

if ! command -v python3 >/dev/null; then
  echo "python3 not found. Installing is recommended for helper scripts.";
fi

echo "[setup] Installing npm dependencies"
npm install --no-audit --no-fund

echo "[setup] Checking for darklua (required for builds)"
if command -v darklua >/dev/null; then
  echo "darklua found: $(command -v darklua)"
else
  if command -v aftman >/dev/null; then
    echo "aftman found. Attempting to install tools defined in aftman.toml"
    aftman install || echo "aftman install failed; please run 'aftman install' manually.";
  else
    echo "darklua not found and aftman not installed."
    echo "Recommended: install Aftman (https://github.com/LPGhatguy/aftman) and run 'aftman install' to obtain darklua, rojo and lune.";
    echo "Alternatively, install darklua manually and ensure it's on your PATH.";
  fi
fi

echo "[setup] Run a test build to verify configuration"
if npm run build --silent; then
  echo "[setup] Build successful. dist/main.lua created.";
else
  echo "[setup] Build failed. Ensure darklua is installed and available on PATH.";
fi

echo "[setup] Done."
