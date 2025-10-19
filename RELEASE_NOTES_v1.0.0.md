# PICO-8 Enhanced v1.0.0 - Initial Release 🎉

First public release of PICO-8 Enhanced for VS Code!

## 🌟 Features

### 📚 Comprehensive API Documentation
- **850+ lines** of detailed PICO-8 API documentation
- Hover over any function to see documentation, examples, and tips
- Covers all PICO-8 API functions including graphics, audio, input, math, and more

### 💡 Smart IntelliSense
- Auto-completion for all PICO-8 functions
- Parameter hints as you type
- Function signatures with detailed descriptions
- Code snippets for common patterns

### 🎨 Syntax Highlighting
- Beautiful syntax highlighting tailored for `.p8` files
- PICO-8-specific keywords and functions
- Support for hex and binary number formats
- Proper comment and string highlighting

### 🎯 Language Support
- Automatic `.p8` file association
- Proper indentation (single space, PICO-8 standard)
- Auto-closing brackets and quotes
- Comment toggling support

### 🖼️ Custom Icon
- Beautiful custom icon featuring a retro code editor with PICO-8 code

## 📦 Installation

### Option 1: Install from .vsix
1. Download `pico8-enhanced-1.0.0.vsix` from this release
2. Open VS Code
3. Press **Cmd+Shift+P** (Mac) or **Ctrl+Shift+P** (Windows/Linux)
4. Type: `Extensions: Install from VSIX...`
5. Select the downloaded file

### Option 2: Build from Source
```bash
git clone https://github.com/jaycb3/pico-8-vscode-extension.git
cd pico-8-vscode-extension
npm install -g vsce
vsce package
code --install-extension pico8-enhanced-1.0.0.vsix
```

## 🚀 Quick Start

1. Open or create a `.p8` file
2. Start coding - syntax highlighting activates automatically
3. Use **Ctrl+Space** for IntelliSense
4. **Hover** over functions for documentation

## 📖 Documented APIs

Complete documentation for all PICO-8 functions:
- **Graphics**: pset, pget, cls, spr, sspr, pal, palt, camera, clip, etc.
- **Input**: btn, btnp
- **Audio**: sfx, music
- **Math**: rnd, flr, cos, sin, atan2, mid, etc.
- **Tables**: add, del, count, all, foreach, etc.
- **Map**: mget, mset, map
- **Memory**: peek, poke, memcpy, etc.
- **System**: time, stat, cartdata, etc.

## 🎮 Perfect For

- PICO-8 game development
- Fantasy console programming
- Learning game development
- Pixel art games
- Retro game creation

## 🙏 Acknowledgments

Built with ❤️ for the PICO-8 community!

---

**Happy coding! 🚀🎮**

