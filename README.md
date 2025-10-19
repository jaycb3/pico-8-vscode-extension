# PICO-8 Enhanced for VS Code

Complete PICO-8 development support for Visual Studio Code with comprehensive API documentation, syntax highlighting, and IntelliSense.

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

## 🚀 Usage

1. **Install the extension**
2. **Open or create a `.p8` file**
3. **Start coding!**

### Example: Hover Documentation

Hover over any PICO-8 function to see rich documentation:

```lua
-- Hover over 'btn' to see:
if btn(0) then x -= 1 end  -- Button documentation appears!
```

### Example: Auto-completion

Type `mid` and you'll see:

```
mid(x, y, z) - Middle value of three (clamp)
Very useful for clamping values to a range
```

### Example: Code Snippets

Type `_update` and press Tab to get:

```lua
function _update()
  
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

Found a bug or have a suggestion? Please open an issue!

## 📜 License

MIT License - feel free to use and modify!

## 🎮 Resources

- [PICO-8 Official Site](https://www.pico-8.com)
- [PICO-8 Wiki](https://pico-8.fandom.com/)
- [PICO-8 BBS](https://www.lexaloffle.com/bbs/?cat=7)

## 🙏 Credits

Created with ❤️ for the PICO-8 community

---

**Happy coding! 🚀**

