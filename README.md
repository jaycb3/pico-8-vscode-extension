# PICO-8 Enhanced for VS Code

![PICO-8](https://img.shields.io/badge/PICO--8-Fantasy%20Console-ff004d?style=for-the-badge)
![VS Code](https://img.shields.io/badge/VS%20Code-Extension-007acc?style=for-the-badge&logo=visual-studio-code)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

> 🎮 **Complete PICO-8 development support for Visual Studio Code**

Turn VS Code into a powerful PICO-8 IDE with comprehensive API documentation, intelligent code completion, beautiful syntax highlighting, and more!

Perfect for fantasy console game development with PICO-8.

## 🌟 Why This Extension?

- 📚 **850+ lines** of comprehensive PICO-8 API documentation
- 💡 Smart IntelliSense for all PICO-8 functions
- 🎨 Beautiful syntax highlighting tailored for `.p8` files
- ⚡ Instant hover help with examples and tips
- 🔧 Zero configuration - works out of the box
- 🎯 Made specifically for PICO-8 (not generic Lua)

## ✨ Features

### 🎨 **Syntax Highlighting**
- Full syntax highlighting for `.p8` files
- PICO-8-specific keywords and functions highlighted
- Support for PICO-8 number formats (hex, binary)
- Comment and string highlighting

### 📚 **Rich API Documentation**
- **850+ lines** of detailed PICO-8 API documentation
- Hover over any PICO-8 function to see:
  - Function signature
  - Parameter descriptions
  - Return values
  - Code examples
  - Usage tips

### 💡 **IntelliSense & Auto-completion**
- Auto-complete for all PICO-8 functions
- Code snippets for common patterns
- Parameter hints as you type
- Function signatures

### 🎯 **Language Support**
- `.p8` file association with Lua
- Proper indentation for PICO-8 code (single space)
- Auto-closing brackets and quotes
- Comment toggling support

## 📖 Documented Functions

The extension provides comprehensive documentation for all PICO-8 API functions:

### Program Callbacks
- `_init()`, `_update()`, `_update60()`, `_draw()`

### Graphics
- **Primitives**: `pset`, `pget`, `cls`, `circfill`, `circ`, `rectfill`, `rect`, `line`, `print`
- **Sprites**: `spr`, `sspr`, `sget`, `sset`, `fget`, `fset`
- **State**: `camera`, `pal`, `palt`, `color`, `clip`, `fillp`

### Input
- `btn()`, `btnp()`

### Map
- `mget()`, `mset()`, `map()`, `tline()`

### Audio
- `sfx()`, `music()`

### Tables
- `add()`, `del()`, `deli()`, `count()`, `all()`, `foreach()`, `pairs()`

### Math
- `rnd()`, `flr()`, `ceil()`, `cos()`, `sin()`, `atan2()`, `sqrt()`, `abs()`, `sgn()`
- `max()`, `min()`, `mid()`
- Bitwise: `band()`, `bor()`, `bxor()`, `bnot()`, `shl()`, `shr()`, etc.

### Memory
- `peek()`, `poke()`, `peek2/4()`, `poke2/4()`, `memcpy()`, `memset()`, `reload()`, `cstore()`

### Strings
- `tostr()`, `tonum()`, `chr()`, `ord()`, `sub()`

### System
- `time()`, `t()`, `stat()`, `printh()`, `reset()`, `flip()`, `extcmd()`, `menuitem()`
- `cartdata()`, `dget()`, `dset()`

## 🚀 Quick Start

### Installation

#### Option 1: From GitHub Release
1. Download `pico8-enhanced-1.0.0.vsix` from [Releases](https://github.com/jaycb3/pico-8-vscode-extension/releases)
2. Open VS Code
3. Press **Cmd+Shift+P** (Mac) or **Ctrl+Shift+P** (Windows/Linux)
4. Type: `Extensions: Install from VSIX...`
5. Select the downloaded `.vsix` file

#### Option 2: Build from Source
```bash
git clone https://github.com/jaycb3/pico-8-vscode-extension.git
cd pico-8-vscode-extension
npm install -g vsce
vsce package
code --install-extension pico8-enhanced-1.0.0.vsix
```

### Get Started
1. **Open or create a `.p8` file**
2. **Start coding!** - Syntax highlighting activates automatically
3. **Use Ctrl+Space** for IntelliSense suggestions
4. **Hover over functions** to see documentation

## 📸 Screenshots

### Hover Documentation
Hover over any PICO-8 function to see rich documentation:

```lua
-- Hover over 'btn' to see full documentation with examples!
if btn(0) then x -= 1 end
```

### IntelliSense in Action
Type `mid` and get instant suggestions:

```
mid(x, y, z) - Returns the middle value of three numbers
Perfect for clamping values to a range!
```

### Code Snippets
Type `_update` and press Tab:

```lua
function _update()
  -- Your update code here
end
```

## ⚙️ Configuration

The extension automatically configures `.p8` files with:
- **Tab size**: 1 space (PICO-8 standard)
- **Insert spaces**: true
- **Detect indentation**: false

You can override these in your workspace settings if needed.

## 📝 PICO-8 Quick Reference

### Display
- Resolution: 128x128 pixels
- Colors: 16 fixed palette

### Code
- Max tokens: 8,192
- Language: P8 Lua (not standard Lua!)

### Key Differences from Standard Lua
- Fixed-point numbers: -32768 to 32767.99999
- COS/SIN use 0..1 range (not radians)
- SIN() is inverted for screen coordinates
- Arrays are 1-based
- SGN(0) returns 1 (not 0!)

## 🤝 Contributing

Contributions are welcome! Whether it's:
- 🐛 Bug reports
- 💡 Feature suggestions
- 📝 Documentation improvements
- 🔧 Code contributions

Please [open an issue](https://github.com/jaycb3/pico-8-vscode-extension/issues) or submit a pull request!

## 📜 License

MIT License - feel free to use, modify, and distribute!

## 🎮 PICO-8 Resources

- [PICO-8 Official Site](https://www.pico-8.com) - Get PICO-8
- [PICO-8 Wiki](https://pico-8.fandom.com/) - Community wiki
- [PICO-8 BBS](https://www.lexaloffle.com/bbs/?cat=7) - Share your games
- [PICO-8 Manual](https://www.lexaloffle.com/dl/docs/pico-8_manual.html) - Official docs
- [PICO-8 Zine](https://sectordub.itch.io/pico-8-fanzine-1) - Community magazine

## ⭐ Support This Project

If this extension helps your PICO-8 development:
- ⭐ **Star this repository**
- 🐦 **Share it** with the PICO-8 community
- 🎮 **Show us** what you're building!

## 🙏 Acknowledgments

- Built with ❤️ for the PICO-8 community
- Thanks to [Lexaloffle](https://www.lexaloffle.com/) for creating PICO-8
- Inspired by the amazing PICO-8 developer community

---

**Happy coding! 🚀🎮**

## 📌 Keywords

`pico-8` `pico8` `fantasy-console` `gamedev` `game-development` `vscode-extension` `lua` `pixel-art` `retro-gaming` `indie-gamedev`

