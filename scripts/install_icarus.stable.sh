#!/usr/bin/env bash
set -euo pipefail

# Install Icarus Verilog on Linux/macOS using the native package manager.

need() { command -v "$1" >/dev/null 2>&1 || { echo "[FAIL] missing command: $1"; exit 2; }; }

os_name() {
  uname -s
}

install_macos() {
  echo "== 0) Prerequisites (Homebrew) =="
  need brew

  echo
  echo "== 1) Install Icarus Verilog =="
  brew update
  brew install icarus-verilog || brew upgrade icarus-verilog

  echo
  echo "== 2) Verify =="
  echo "which -a iverilog:"
  which -a iverilog || true
  echo
  echo "iverilog -V:"
  iverilog -V
  echo
  echo "which -a vvp:"
  which -a vvp || true
  echo
  echo "vvp -V:"
  vvp -V

  echo
  echo "[OK] Done."
}

install_linux() {
  echo "== 0) Detect Linux package manager =="

  if command -v apt-get >/dev/null 2>&1; then
    echo "Using apt-get"
    sudo apt-get update
    sudo apt-get install -y iverilog
  else
    echo "[FAIL] No supported Linux package manager found (apt-get)."
    exit 2
  fi

  echo
  echo "== 1) Verify =="
  echo "which -a iverilog:"
  which -a iverilog || true
  echo
  echo "iverilog -V:"
  iverilog -V
  echo
  echo "which -a vvp:"
  which -a vvp || true
  echo
  echo "vvp -V:"
  vvp -V

  echo
  echo "[OK] Done."
}

case "$(os_name)" in
  Linux)
    install_linux
    ;;
  Darwin)
    install_macos
    ;;
  *)
    echo "[FAIL] Unsupported platform: $(os_name)"
    exit 2
    ;;
esac