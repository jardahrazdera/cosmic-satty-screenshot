# COSMIC Satty Screenshot

A screenshot tool for COSMIC Desktop that integrates [Satty](https://github.com/gabm/Satty) annotation tool with grim and slurp for a seamless screenshot workflow.

## Features

- 🖱️ **Unified Selection**: Click to capture full monitor, or drag to select a region
- 📝 **Instant Annotation**: Opens captured screenshots directly in Satty for editing
- 💾 **Auto-Save**: Automatically saves to `~/Screenshots/` with timestamps
- 📋 **Clipboard Integration**: Copies screenshots to clipboard automatically
- 🪟 **Minimum Window Size**: Small screenshots are padded to 800x600 for comfortable editing
- ⚡ **Auto-Close**: Satty closes automatically after saving
- 🎯 **COSMIC Desktop Optimized**: Workaround for COSMIC keyboard shortcut issues

## Why This Project?

COSMIC Desktop (currently in Beta) has known issues with custom keyboard shortcuts not properly spawning commands. This tool provides a reliable workaround by using a `.desktop` file launcher, ensuring your screenshot workflow works flawlessly.

## Coexistence with Native COSMIC Screenshot

This tool works **alongside** the native `cosmic-screenshot` tool rather than replacing it, giving you the flexibility to choose the right tool for the job:

- **Native COSMIC Screenshot** (Print key) → Quick, simple screenshots without annotation
- **cosmic-satty-screenshot** (your custom shortcut) → Full annotation workflow with Satty

This dual-tool setup means you can:
- Use the native tool for fast captures when you don't need editing
- Use Satty workflow when you need to annotate, draw, add text, or make edits
- Keep both tools configured simultaneously without conflicts

## Dependencies

Required packages:
- `grim` - Screenshot utility for Wayland
- `slurp` - Region selection tool
- `satty` - Screenshot annotation tool
- `imagemagick` - Image manipulation (for padding small screenshots)
- `wl-clipboard` - Wayland clipboard utilities

### Installation on Arch Linux

```bash
sudo pacman -S grim slurp satty imagemagick wl-clipboard
```

### Installation on other distributions

Refer to your distribution's package manager. All dependencies are available in most Linux distributions.

## Installation

### Automated Installation

```bash
git clone https://github.com/yourusername/cosmic-satty-screenshot.git
cd cosmic-satty-screenshot
./install.sh
```

### Manual Installation

1. Copy the script:
   ```bash
   cp screenshot-satty ~/.local/bin/
   chmod +x ~/.local/bin/screenshot-satty
   ```

2. Copy the desktop file:
   ```bash
   cp screenshot-satty.desktop ~/.local/share/applications/
   update-desktop-database ~/.local/share/applications/
   ```

3. Create screenshots directory:
   ```bash
   mkdir -p ~/Screenshots
   ```

## COSMIC Desktop Setup

1. Open **COSMIC Settings**
2. Navigate to **Keyboard** → **Custom Shortcuts**
3. Click **Add Custom Shortcut**
4. Configure:
   - **Name:** Screenshot Satty
   - **Command:** `gtk-launch screenshot-satty`
   - **Shortcut:** Choose your preferred key combination (e.g., `Super+Shift+S` or `Print`)

**Note:** Using `gtk-launch` is crucial for proper functionality in COSMIC Desktop due to keyboard shortcut handling issues.

## Usage

Once configured, press your assigned keyboard shortcut:

- **Click once** on any monitor → Captures that entire screen
- **Click and drag** → Captures the selected region
- Press **Escape** → Cancels the screenshot

After capture:
1. Satty opens with your screenshot
2. Annotate, draw, or edit as needed
3. Click the **Save** button → Automatically saves to `~/Screenshots/` and closes

## Configuration

You can customize the script by editing `~/.local/bin/screenshot-satty`:

### Minimum Window Size

```bash
MIN_WIDTH=800   # Default: 800
MIN_HEIGHT=600  # Default: 600
```

### Screenshots Directory

```bash
OUTPUT_DIR="$HOME/Screenshots"  # Change to your preferred location
```

## Troubleshooting

### Keyboard shortcut not working

- Make sure you're using `gtk-launch screenshot-satty` and not the direct path
- Try logging out and back in to COSMIC
- Verify the desktop file exists: `ls ~/.local/share/applications/screenshot-satty.desktop`

### "Config file not found" warning

This is harmless - slurp looks for an optional config file. You can suppress it by creating:
```bash
mkdir -p ~/.config/slurp
touch ~/.config/slurp/slurp
```

### Script runs but nothing happens

- Check if all dependencies are installed: `grim`, `slurp`, `satty`, `magick`, `wl-copy`
- Verify you're running on Wayland: `echo $WAYLAND_DISPLAY`
- Check the script is executable: `chmod +x ~/.local/bin/screenshot-satty`

### Screenshots are not being saved

- Verify the output directory exists: `ls ~/Screenshots`
- Check file permissions on the directory
- Run the script manually from terminal to see any error messages

## Uninstallation

```bash
./uninstall.sh
```

Or manually:
```bash
rm ~/.local/bin/screenshot-satty
rm ~/.local/share/applications/screenshot-satty.desktop
update-desktop-database ~/.local/share/applications/
```

**Note:** Screenshots in `~/Screenshots/` are preserved. Remove the COSMIC keyboard shortcut manually from Settings.

## Comparison with Plain Satty

| Feature | Plain Satty | cosmic-satty-screenshot |
|---------|-------------|-------------------------|
| Region selection | Requires piping grim output | Built-in with slurp |
| Monitor selection | Not available | Click to select monitor |
| Auto-save | Manual configuration | Automatic with timestamps |
| Minimum window size | No | Yes (800x600) |
| COSMIC integration | Requires manual setup | One command via gtk-launch |
| Clipboard | Manual configuration | Automatic |

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## License

MIT License - See [LICENSE](LICENSE) file for details.

## Credits

- [Satty](https://github.com/gabm/Satty) - Screenshot annotation tool by gabm
- [grim](https://sr.ht/~emersion/grim/) - Screenshot utility for Wayland
- [slurp](https://github.com/emersion/slurp) - Region selection tool
- COSMIC Desktop by [System76](https://github.com/pop-os/cosmic-epoch)