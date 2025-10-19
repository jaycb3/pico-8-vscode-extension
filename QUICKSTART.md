# Quick Start Guide

## 🚀 Installation (2 minutes)

### Option A: Install from VSIX (Easiest)

1. **Package the extension**:
   ```bash
   cd pico8-vscode-extension
   npm install -g vsce
   vsce package
   ```

2. **Install in Cursor/VS Code**:
   - Press `Cmd+Shift+P`
   - Type: "Extensions: Install from VSIX..."
   - Select `pico8-enhanced-1.0.0.vsix`
   - Reload window

### Option B: Copy to Extensions Folder

**For Cursor (Mac):**
```bash
cp -r pico8-vscode-extension ~/.cursor/extensions/pico8-enhanced-1.0.0
```

**For VS Code (Mac):**
```bash
cp -r pico8-vscode-extension ~/.vscode/extensions/pico8-enhanced-1.0.0
```

Then reload the editor.

## ✅ Test It Works

1. Create a test file: `test.p8`

2. Type this code:
   ```lua
   function _init()
     x = 64
   end

   function _update()
     if btn(0) then x -= 1 end
   end

   function _draw()
     cls()
     circfill(x, 64, 10, 8)
   end
   ```

3. **Hover over `btn`** - you should see documentation!

4. **Type `mid`** - you should see auto-completion!

5. **Notice syntax highlighting** - keywords, functions, strings all colored!

## 🎨 What You Get

### Hover Documentation
Hover over ANY PICO-8 function to see:
- What it does
- Parameters
- Return values
- Code examples

### Auto-completion
Type a few letters and press `Ctrl+Space` to see suggestions.

### Snippets
Type these and press Tab:
- `_init` → full _init() function
- `_update` → full _update() function
- `_draw` → full _draw() function

### Syntax Highlighting
- Keywords: purple/pink
- Functions: yellow
- Strings: orange/red
- Numbers: light blue
- Comments: gray/green

## 📚 Tips

1. **Use Lua Language Server too**: Install "Lua" by sumneko for even better support

2. **Customize colors**: Adjust syntax colors in your theme settings

3. **Check the docs**: Hover over functions you're unsure about!

## 🐛 Not Working?

1. **Reload the window**: `Cmd+Shift+P` → "Developer: Reload Window"

2. **Check file extension**: Make sure file ends in `.p8`

3. **Manual language mode**: Click bottom-right language indicator → select "PICO-8"

4. **Check extension is active**: View → Extensions → search "PICO-8"

## 📖 Learn More

- See [README.md](README.md) for full feature list
- See [INSTALL.md](INSTALL.md) for detailed installation
- See [PUBLISH.md](PUBLISH.md) to publish to marketplace

---

**You're all set! Start coding! 🎮**

