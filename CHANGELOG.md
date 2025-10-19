# Change Log

All notable changes to the "pico8-enhanced" extension will be documented in this file.

## [1.0.1] - 2025-10-19

### Fixed
- Improved syntax highlighting for PICO-8 compound assignment operators (`+=`, `-=`, `*=`, `/=`, `%=`, `^=`, `..=`)
- Added support for PICO-8 shorthand if statement syntax: `if (condition) statement`
- Added syntax highlighting for `?` as shorthand for `print()`
- Fixed repository URL in package.json to point to correct GitHub repo

### Changed
- Reordered operator patterns for better compound operator detection
- Enhanced operator scoping for more accurate syntax highlighting

## [1.0.0] - 2025-01-19

### Added
- Initial release
- Complete PICO-8 API documentation (850+ lines)
- Syntax highlighting for .p8 files
- IntelliSense and auto-completion for all PICO-8 functions
- Hover documentation with examples
- Code snippets for common patterns
- Language configuration for PICO-8 Lua
- Support for PICO-8 number formats (hex, binary)
- Proper indentation settings (1 space)
- Auto-closing pairs for brackets and quotes

### Features
- Documentation for 100+ PICO-8 API functions
- Examples for every major function
- Type hints and parameter information
- PICO-8-specific syntax highlighting
- Callback function snippets (_init, _update, _draw)
- Support for PICO-8 operators and shortcuts

### Documentation Includes
- Program callbacks
- Graphics (primitives, sprites, palette)
- Input handling
- Map functions
- Audio (sfx, music)
- Table operations
- Math functions (including trig and bitwise)
- Memory operations
- String manipulation
- System functions

