#!/bin/bash
# Installation script for cosmic-satty-screenshot

set -e

echo "=== COSMIC Satty Screenshot Installer ==="
echo

# Check dependencies
MISSING_DEPS=()

command -v grim >/dev/null 2>&1 || MISSING_DEPS+=("grim")
command -v slurp >/dev/null 2>&1 || MISSING_DEPS+=("slurp")
command -v satty >/dev/null 2>&1 || MISSING_DEPS+=("satty")
command -v magick >/dev/null 2>&1 || MISSING_DEPS+=("imagemagick")
command -v wl-copy >/dev/null 2>&1 || MISSING_DEPS+=("wl-clipboard")

if [ ${#MISSING_DEPS[@]} -ne 0 ]; then
    echo "ERROR: Missing required dependencies:"
    for dep in "${MISSING_DEPS[@]}"; do
        echo "  - $dep"
    done
    echo
    echo "Please install them using your package manager."
    echo "For Arch Linux: sudo pacman -S grim slurp satty imagemagick wl-clipboard"
    exit 1
fi

echo "✓ All dependencies are installed"
echo

# Create directories
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/applications
mkdir -p ~/Screenshots

echo "✓ Created necessary directories"
echo

# Copy script
cp screenshot-satty ~/.local/bin/screenshot-satty
chmod +x ~/.local/bin/screenshot-satty

echo "✓ Installed screenshot-satty to ~/.local/bin"
echo

# Copy desktop file
cp screenshot-satty.desktop ~/.local/share/applications/screenshot-satty.desktop

echo "✓ Installed desktop entry"
echo

# Update desktop database
if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database ~/.local/share/applications/
    echo "✓ Updated desktop database"
    echo
fi

# Check if ~/.local/bin is in PATH
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo "⚠ WARNING: ~/.local/bin is not in your PATH"
    echo
    echo "Add this line to your ~/.bashrc or ~/.profile:"
    echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo
fi

echo "=== Installation Complete! ==="
echo
echo "To use with COSMIC desktop:"
echo "1. Open COSMIC Settings → Keyboard → Custom Shortcuts"
echo "2. Add a new shortcut with command: gtk-launch screenshot-satty"
echo "3. Bind it to your preferred key (e.g., Super+Shift+S)"
echo
echo "Usage:"
echo "  - Click once on a monitor to capture full screen"
echo "  - Click and drag to capture a region"
echo "  - Screenshots are saved to ~/Screenshots/"
echo