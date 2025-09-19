#!/bin/bash
# ---------------------------------------------
# Startup script for C++ dev on Google Cloud VM
# ---------------------------------------------

# Update and install packages
sudo apt update
sudo apt install -y clang clangd lldb build-essential cmake git curl wget

# Install code-server extensions
code-server --install-extension llvm-vs-code-extensions.vscode-clangd
code-server --install-extension vadimcn.vscode-lldb
code-server --install-extension ms-vscode.cmake-tools
code-server --install-extension hashicorp.terraform
