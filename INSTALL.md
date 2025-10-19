# Installation Guide

## 📦 Option 1: Install from VSIX (Recommended)

1. **Package the extension** (from the extension directory):
   ```bash
   npm install -g vsce
   vsce package
   ```

2. **Install in VS Code/Cursor**:
   - Open VS Code or Cursor
   - Press `Cmd+Shift+P` (Mac) or `Ctrl+Shift+P` (Windows/Linux)
   - Type: "Extensions: Install from VSIX..."
   - Select the `pico8-enhanced-1.0.0.vsix` file
   - Reload the editor

## 🔧 Option 2: Install from Source (Development)

1. **Copy to extensions folder**:

   **Mac/Linux:**
   ```bash
   cp -r pico8-vscode-extension ~/.vscode/extensions/pico8-enhanced-1.0.0
   ```

   **For Cursor (Mac):**
   ```bash
   cp -r pico8-vscode-extension ~/Library/Application\ Support/Cursor/User/globalStorage/extensions/pico8-enhanced-1.0.0
   ```

   **Windows:**
   ```cmd
   xcopy pico8-vscode-extension %USERPROFILE%\.vscode\extensions\pico8-enhanced-1.0.0\ /E /I
   ```

2. **Reload the editor**:
   - Press `Cmd+Shift+P` / `Ctrl+Shift+P`
   - Type: "Developer: Reload Window"
   - Press Enter

## ✅ Verify Installation

1. Open a `.p8` file (or create one)
2. Type `btn` and hover over it - you should see documentation
3. Start typing `_update` - you should see auto-completion
4. Check syntax highlighting works

## 🎨 With Lua Language Server

For the best experience, also install the Lua Language Server:

1. Install: **"Lua" by sumneko** extension
2. Open your PICO-8 project folder
3. The extension will automatically use the `pico8_api.lua` definitions

## 🐛 Troubleshooting

### Extension not loading?
- Check the extensions folder path is correct
- Reload VS Code/Cursor
- Check the Output panel (View → Output → select "Extensions")

### No syntax highlighting?
- Make sure the file has `.p8` extension
- Try manually setting language: click language indicator in bottom-right, select "PICO-8"

### No auto-completion?
- Ensure the extension is activated (check Extensions panel)
- Try typing a known function like `btn` or `spr`
- Reload the window

## 📝 Uninstall

**From GUI:**
- Go to Extensions panel
- Find "PICO-8 Enhanced"
- Click uninstall

**Manual:**
- Delete the extension folder from `~/.vscode/extensions/`

## 🔄 Update

To update to a new version:
1. Package the new version: `vsce package`
2. Install the new VSIX file (it will replace the old version)

---

Need help? Check the [README.md](README.md) for more information!

