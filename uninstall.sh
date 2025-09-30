#!/bin/bash
# Uninstallation script for cosmic-satty-screenshot

echo "=== COSMIC Satty Screenshot Uninstaller ==="
echo

# Remove script
if [ -f ~/.local/bin/screenshot-satty ]; then
    rm ~/.local/bin/screenshot-satty
    echo "✓ Removed screenshot-satty from ~/.local/bin"
else
    echo "✗ screenshot-satty not found in ~/.local/bin"
fi

# Remove desktop file
if [ -f ~/.local/share/applications/screenshot-satty.desktop ]; then
    rm ~/.local/share/applications/screenshot-satty.desktop
    echo "✓ Removed desktop entry"
else
    echo "✗ Desktop entry not found"
fi

# Update desktop database
if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database ~/.local/share/applications/
    echo "✓ Updated desktop database"
fi

echo
echo "=== Uninstallation Complete! ==="
echo
echo "Note: Screenshots in ~/Screenshots/ have been preserved."
echo "Note: COSMIC keyboard shortcuts need to be removed manually from Settings."
echo