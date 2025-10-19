---PICO-8 API Definitions
---This file provides type hints and documentation for the PICO-8 API
---Do not include this file in your cart - it's just for editor support

---@diagnostic disable: lowercase-global

-- ============================================================================
-- PROGRAM CALLBACKS
-- ============================================================================

---Called once when the program starts
---
---Use this to initialize variables, load data, set up game state
---
---Example:
---```lua
---function _init()
---  player = {x=64, y=64, speed=2}
---  score = 0
---end
---```
function _init() end

---Called once per frame at 30fps
---
---Use this for game logic, physics, input handling, AI
---
---Example:
---```lua
---function _update()
---  if btn(0) then player.x -= 1 end
---  if btn(1) then player.x += 1 end
---end
---```
function _update() end

---Called once per frame at 60fps (use instead of _update)
---
---When defined, both _update60() and _draw() run at 60fps
---Each frame has half the CPU budget before dropping to 30fps
---
---Example:
---```lua
---function _update60()
---  -- faster updates for smoother gameplay
---  player.x += player.velocity
---end
---```
function _update60() end

---Called once per visible frame
---
---Use this to render graphics. Don't do game logic here!
---Automatically calls flip() at the end
---
---Example:
---```lua
---function _draw()
---  cls()
---  spr(1, player.x, player.y)
---  print("score: "..score, 2, 2, 7)
---end
---```
function _draw() end

-- ============================================================================
-- INPUT
-- ============================================================================

---Get button state (returns true while held down)
---
---Button indices: 0=left, 1=right, 2=up, 3=down, 4=O, 5=X
---
---Example:
---```lua
---if btn(0) then x -= 1 end  -- move left while held
---if btn(4) then shoot() end -- shoot while O held
---```
---@param b number Button index (0-5: left,right,up,down,O,X)
---@param pl number? Player index (0-7, default 0)
---@return boolean true if button is currently held down
function btn(b, pl) end

---Get button pressed (returns true on press + auto-repeat)
---
---Returns true on initial press, then after 15 frames, then every 4 frames
---Perfect for menu navigation or grid movement
---
---Example:
---```lua
---if btnp(2) then menu_index -= 1 end  -- move up in menu
---if btnp(4) then select_item() end    -- select on press
---```
---@param b number Button index (0-5)
---@param pl number? Player index (0-7)
---@return boolean true on press and repeat intervals
function btnp(b, pl) end

-- ============================================================================
-- GRAPHICS - PRIMITIVES
-- ============================================================================

---Set a pixel to a specific color
---
---The fundamental drawing operation - sets one pixel
---
---Example:
---```lua
---pset(64, 64, 8)  -- red pixel at screen center
---for i=0,127 do pset(i, i, 7) end  -- white diagonal line
---```
---@param x number X coordinate (0-127)
---@param y number Y coordinate (0-127)
---@param col number? Color index (0-15, defaults to current draw color)
function pset(x, y, col) end

---Get the color of a pixel
---
---Returns the color index at the given screen position
---
---Example:
---```lua
---local c = pget(64, 64)
---if c == 8 then print("red pixel!") end
---pset(x, y, pget(x+1, y))  -- copy pixel from right
---```
---@param x number X coordinate (0-127)
---@param y number Y coordinate (0-127)
---@return number color index (0-15), or 0 if out of bounds
function pget(x, y) end

---Clear the screen to a color
---
---Also resets the clipping rectangle
---
---Example:
---```lua
---cls()      -- clear to black
---cls(1)     -- clear to dark blue
---cls(7)     -- clear to white
---```
---@param col number? Color index (0-15, default 0=black)
function cls(col) end

---Draw a filled circle
---
---Example:
---```lua
---circfill(64, 64, 20, 8)  -- red circle at center, radius 20
---circfill(x, y, 3, 7)     -- small white dot
---```
---@param x number Center X coordinate
---@param y number Center Y coordinate
---@param r number Radius in pixels
---@param col number? Color index (0-15)
function circfill(x, y, r, col) end

---Draw a circle outline
---
---Example:
---```lua
---circ(64, 64, 30, 12)  -- blue circle outline
---for r=5,20,5 do circ(64,64,r,8) end  -- concentric circles
---```
---@param x number Center X coordinate
---@param y number Center Y coordinate
---@param r number Radius in pixels
---@param col number? Color index (0-15)
function circ(x, y, r, col) end

---Draw a filled rectangle
---
---Example:
---```lua
---rectfill(10, 10, 50, 50, 8)  -- red square
---rectfill(0, 120, 127, 127, 1)  -- blue bar at bottom
---```
---@param x0 number Top-left X coordinate
---@param y0 number Top-left Y coordinate
---@param x1 number Bottom-right X coordinate
---@param y1 number Bottom-right Y coordinate
---@param col number? Color index (0-15)
function rectfill(x0, y0, x1, y1, col) end

---Draw a rectangle outline
---
---Example:
---```lua
---rect(10, 10, 50, 50, 7)  -- white box outline
---rect(0, 0, 127, 127, 8)  -- red border around screen
---```
---@param x0 number Top-left X coordinate
---@param y0 number Top-left Y coordinate
---@param x1 number Bottom-right X coordinate
---@param y1 number Bottom-right Y coordinate
---@param col number? Color index (0-15)
function rect(x0, y0, x1, y1, col) end

---Draw a line
---
---If x1,y1 not given, continues from previous line endpoint
---
---Example:
---```lua
---line(10, 10, 50, 50, 7)  -- diagonal white line
---line(0, 64, 127, 64, 8)  -- horizontal red line
---```
---@param x0 number Start X coordinate
---@param y0 number Start Y coordinate
---@param x1 number? End X coordinate
---@param y1 number? End Y coordinate
---@param col number? Color index (0-15)
function line(x0, y0, x1, y1, col) end

---Print text to the screen
---
---If x,y not specified, prints to console with newline
---Returns the right-most x position reached
---
---Example:
---```lua
---print("hello", 10, 10, 7)  -- white text at position
---print("score: "..score, 2, 2, 10)  -- yellow score display
---?"hi"  -- shorthand: prints to console
---```
---@param str string Text to print
---@param x number? X position (omit for console print)
---@param y number? Y position
---@param col number? Color index (0-15)
---@return number rightmost X position
function print(str, x, y, col) end

-- ============================================================================
-- GRAPHICS - SPRITES
-- ============================================================================

---Draw a sprite from the sprite sheet
---
---Color 0 is transparent by default (use palt() to change)
---
---Example:
---```lua
---spr(1, 64, 64)           -- draw sprite 1 at center
---spr(2, x, y, 2, 2)       -- draw 2x2 block (16x16 pixels)
---spr(3, x, y, 1, 1, true) -- draw sprite 3 flipped horizontally
---```
---@param n number Sprite index (0-255)
---@param x number X position on screen
---@param y number Y position on screen
---@param w number? Width in sprites (default 1)
---@param h number? Height in sprites (default 1)
---@param flip_x boolean? Flip horizontally
---@param flip_y boolean? Flip vertically
function spr(n, x, y, w, h, flip_x, flip_y) end

---Draw a stretched sprite region from sprite sheet
---
---Allows stretching/scaling and drawing partial sprites
---
---Example:
---```lua
---sspr(0, 0, 8, 8, 60, 60, 16, 16)  -- draw sprite 0 scaled 2x
---sspr(8, 0, 4, 8, x, y)             -- draw left half of sprite 1
---```
---@param sx number Source X on sprite sheet (pixels)
---@param sy number Source Y on sprite sheet (pixels)
---@param sw number Source width (pixels)
---@param sh number Source height (pixels)
---@param dx number Destination X on screen
---@param dy number Destination Y on screen
---@param dw number? Destination width (default=sw)
---@param dh number? Destination height (default=sh)
---@param flip_x boolean? Flip horizontally
---@param flip_y boolean? Flip vertically
function sspr(sx, sy, sw, sh, dx, dy, dw, dh, flip_x, flip_y) end

---Get a pixel color from the sprite sheet
---
---Example:
---```lua
---local col = sget(0, 0)  -- get color of top-left pixel
---if sget(x, y) == 8 then print("red!") end
---```
---@param x number X coordinate on sprite sheet (0-127)
---@param y number Y coordinate on sprite sheet (0-127)
---@return number color index (0-15)
function sget(x, y) end

---Set a pixel color on the sprite sheet
---
---Directly modifies sprite data in memory
---
---Example:
---```lua
---sset(0, 0, 8)  -- set top-left pixel to red
---for x=0,7 do sset(x, 0, 7) end  -- white line across sprite
---```
---@param x number X coordinate on sprite sheet (0-127)
---@param y number Y coordinate on sprite sheet (0-127)
---@param col number? Color index (0-15)
function sset(x, y, col) end

---Get sprite flag value
---
---Returns boolean if flag index given, or bitfield if not
---
---Example:
---```lua
---if fget(tile, 0) then -- check if flag 0 is set
---  print("solid tile!")
---end
---local flags = fget(5)  -- get all flags as number
---```
---@param n number Sprite index (0-255)
---@param f number? Flag index (0-7, omit for all flags)
---@return boolean|number flag value or bitfield
function fget(n, f) end

---Set sprite flag value
---
---Example:
---```lua
---fset(1, 0, true)   -- set flag 0 on sprite 1
---fset(2, 1+2+4)     -- set flags 0,1,2 on sprite 2
---```
---@param n number Sprite index (0-255)
---@param f number? Flag index (0-7) or bitfield if val omitted
---@param val boolean|number? Flag value (true/false or number)
function fset(n, f, val) end

-- ============================================================================
-- GRAPHICS - PALETTE & STATE
-- ============================================================================

---Set camera offset for all drawing operations
---
---Adds offset to all draw coordinates. Call with no args to reset
---
---Example:
---```lua
---camera(player.x - 64, player.y - 64)  -- center on player
---camera()  -- reset to 0,0
---```
---@param x number? Camera X offset (negative = shifts view right)
---@param y number? Camera Y offset (negative = shifts view down)
function camera(x, y) end

---Remap a color in the draw palette
---
---Changes how colors appear when drawn. Call with no args to reset
---
---Example:
---```lua
---pal(8, 14)  -- draw red (8) as pink (14)
---spr(1, x, y)  -- sprite draws with pink instead of red
---pal()  -- reset all palette changes
---```
---@param c0 number|table Source color (or table of mappings)
---@param c1 number? Destination color
---@param p number? Palette type (0=draw, 1=screen, 2=secondary)
function pal(c0, c1, p) end

---Set which colors are transparent in sprites
---
---Color 0 is transparent by default. Call with no args to reset
---
---Example:
---```lua
---palt(0, false)  -- make black opaque
---palt(8, true)   -- make red transparent
---spr(1, x, y)
---palt()  -- reset (0 transparent, others opaque)
---```
---@param c number Color index (0-15)
---@param t boolean? Transparent (true) or opaque (false)
function palt(c, t) end

---Set the current drawing color
---
---Used by drawing functions when color not specified
---
---Example:
---```lua
---color(8)
---circfill(64, 64, 10)  -- draws red circle
---color(7)
---print("white text")
---```
---@param col number? Color index (0-15, default 6)
function color(col) end

---Set the clipping rectangle
---
---Only pixels within this rectangle will be drawn. Call with no args to reset
---
---Example:
---```lua
---clip(0, 0, 64, 64)  -- only draw in top-left quarter
---circfill(64, 64, 50, 8)  -- gets clipped
---clip()  -- reset to full screen
---```
---@param x number? Left edge
---@param y number? Top edge
---@param w number? Width
---@param h number? Height
function clip(x, y, w, h) end

---Set the fill pattern for shapes
---
---Uses a 4x4 binary pattern. 0 = solid color
---
---Example:
---```lua
---fillp(0b0011001111001100)  -- checkerboard pattern
---circfill(64, 64, 20, 8)  -- red checkerboard circle
---fillp()  -- reset to solid
---```
---@param p number? Pattern bitfield (0-65535, 0=solid)
function fillp(p) end

-- ============================================================================
-- MAP
-- ============================================================================

---Get map tile value at tile coordinates
---
---Example:
---```lua
---local tile = mget(5, 3)  -- get tile at position 5,3
---if tile == 1 then print("wall!") end
---```
---@param x number Tile X coordinate (0-127)
---@param y number Tile Y coordinate (0-31 or 0-63)
---@return number tile value (0-255)
function mget(x, y) end

---Set map tile value at tile coordinates
---
---Example:
---```lua
---mset(5, 3, 0)   -- clear tile at position
---mset(10, 10, 1) -- place tile 1 at position
---```
---@param x number Tile X coordinate
---@param y number Tile Y coordinate
---@param val number Tile value (0-255)
function mset(x, y, val) end

---Draw a region of the map
---
---Efficiently draws many tiles at once
---
---Example:
---```lua
---map(0, 0, 0, 0, 16, 16)  -- draw 16x16 tiles from map top-left
---map()  -- draw entire map at 0,0
---```
---@param tile_x number? Source tile X on map (default 0)
---@param tile_y number? Source tile Y on map (default 0)
---@param sx number? Screen X position in pixels (default 0)
---@param sy number? Screen Y position in pixels (default 0)
---@param tile_w number? Width in tiles (default 128)
---@param tile_h number? Height in tiles (default 32)
---@param layers number? Layer flags bitfield (draw only matching sprite flags)
function map(tile_x, tile_y, sx, sy, tile_w, tile_h, layers) end

-- ============================================================================
-- AUDIO
-- ============================================================================

---Play a sound effect
---
---Example:
---```lua
---sfx(0)      -- play sound 0 on any free channel
---sfx(1, 2)   -- play sound 1 on channel 2
---sfx(-1, 0)  -- stop channel 0
---sfx(2, -2)  -- stop sound 2 on all channels
---```
---@param n number SFX index (0-63) or -1 to stop, -2 to release loop
---@param channel number? Channel (0-3, -1=auto, -2=stop this sfx)
---@param offset number? Start offset in notes (0-31)
---@param length number? Length in notes
function sfx(n, channel, offset, length) end

---Play music from patterns
---
---Example:
---```lua
---music(0)        -- play pattern 0
---music(0, 1000)  -- fade in over 1 second
---music(-1)       -- stop music
---```
---@param n number Pattern index (0-63, -1=stop)
---@param fade_len number? Fade length in milliseconds
---@param channel_mask number? Channel mask bitfield
function music(n, fade_len, channel_mask) end

-- ============================================================================
-- TABLES
-- ============================================================================

---Add a value to the end of a table
---
---Example:
---```lua
---bullets = {}
---add(bullets, {x=64, y=64})
---add(bullets, {x=70, y=60}, 1)  -- insert at position 1
---```
---@param tbl table Target table
---@param val any Value to add
---@param index number? Insert at this index (default = append)
function add(tbl, val, index) end

---Delete first matching value from table
---
---Searches for value and removes it, shifting remaining items
---
---Example:
---```lua
---for b in all(bullets) do
---  if b.y < 0 then del(bullets, b) end
---end
---```
---@param tbl table Target table
---@param val any Value to delete (not index!)
---@return any deleted value, or nil if not found
function del(tbl, val) end

---Delete item at index from table
---
---Example:
---```lua
---deli(bullets, 1)  -- delete first bullet
---deli(bullets)     -- delete last bullet
---```
---@param tbl table Target table
---@param i number? Index to delete (default = last item)
---@return any deleted value
function deli(tbl, i) end

---Count items in table
---
---With no second arg, returns table length (#tbl)
---With value arg, counts occurrences of that value
---
---Example:
---```lua
---print(count(bullets))      -- how many bullets?
---print(count(tiles, 1))     -- how many walls?
---```
---@param tbl table Table to count
---@param val any? Count occurrences of this value
---@return number count
function count(tbl, val) end

---Iterate over table items
---
---For use in FOR loops with 1-indexed tables
---
---Example:
---```lua
---for b in all(bullets) do
---  b.y -= b.speed
---end
---```
---@param tbl table Table to iterate
---@return function iterator
function all(tbl) end

---Apply function to each table item
---
---Example:
---```lua
---foreach(bullets, update_bullet)
---foreach({1,2,3}, print)  -- prints 1, 2, 3
---```
---@param tbl table Target table
---@param func function Function to apply to each item
function foreach(tbl, func) end

---Iterate over all table entries (including non-integer keys)
---
---Example:
---```lua
---for key, value in pairs(player) do
---  print(key.." = "..value)
---end
---```
---@param tbl table Table to iterate
---@return function iterator
function pairs(tbl) end

-- ============================================================================
-- MATH
-- ============================================================================

---Generate random number
---
---Returns number from 0 to x (exclusive)
---If x is a table, returns random element
---
---Example:
---```lua
---local r = rnd(100)  -- 0 to 99.99...
---local coin = rnd(2) < 1  -- true or false
---local dir = rnd({0,1,2,3})  -- random element
---```
---@param x number|table Upper bound (exclusive) or table
---@return number|any random number or table element
function rnd(x) end

---Set random seed
---
---Use same seed for reproducible randomness
---
---Example:
---```lua
---srand(1234)  -- always generates same sequence
---```
---@param x number Seed value
function srand(x) end

---Floor (round down)
---
---Example:
---```lua
---print(flr(4.7))  -- 4
---print(flr(-2.3)) -- -3
---local tile_x = flr(player.x / 8)
---```
---@param x number Value to floor
---@return number floored value
function flr(x) end

---Ceiling (round up)
---
---Example:
---```lua
---print(ceil(4.1))  -- 5
---print(ceil(-2.7)) -- -2
---```
---@param x number Value to ceil
---@return number ceiling value
function ceil(x) end

---Cosine (0..1 range, not radians!)
---
---Input: 0=right, 0.25=down, 0.5=left, 0.75=up, 1=right again
---
---Example:
---```lua
---x = 64 + cos(t()) * 20  -- circle horizontally
---```
---@param x number Angle (0 to 1 = full rotation)
---@return number cosine value (-1 to 1)
function cos(x) end

---Sine (0..1 range, inverted for screen coordinates!)
---
---Returns negative values for "up" in screen space
---
---Example:
---```lua
---y = 64 + sin(t()) * 20  -- circle vertically
---```
---@param x number Angle (0 to 1 = full rotation)
---@return number sine value (-1 to 1)
function sin(x) end

---Arctangent (returns angle from dx, dy)
---
---Returns angle in 0..1 range
---
---Example:
---```lua
---local angle = atan2(target.x - x, target.y - y)
---vx = cos(angle) * speed
---vy = sin(angle) * speed
---```
---@param dx number Delta X
---@param dy number Delta Y
---@return number angle (0 to 1)
function atan2(dx, dy) end

---Square root
---
---Example:
---```lua
---local dist = sqrt(dx*dx + dy*dy)
---```
---@param x number Value
---@return number square root
function sqrt(x) end

---Absolute value
---
---Example:
---```lua
---local distance = abs(x2 - x1)
---```
---@param x number Value
---@return number absolute value
function abs(x) end

---Sign of value (-1, 0, or 1)
---
---Note: sgn(0) returns 1 in PICO-8!
---
---Example:
---```lua
---vx = sgn(target.x - x) * speed  -- move toward target
---```
---@param x number Value
---@return number -1, 0, or 1 (0 returns 1!)
function sgn(x) end

---Maximum of two values
---
---Example:
---```lua
---health = max(health, 0)  -- clamp to minimum 0
---```
---@param x number First value
---@param y number Second value
---@return number larger value
function max(x, y) end

---Minimum of two values
---
---Example:
---```lua
---speed = min(speed, max_speed)
---```
---@param x number First value
---@param y number Second value
---@return number smaller value
function min(x, y) end

---Middle value of three (clamp)
---
---Very useful for clamping values to a range
---
---Example:
---```lua
---x = mid(0, x, 120)  -- keep x between 0 and 120
---health = mid(0, health, 100)
---```
---@param x number First value
---@param y number Second value
---@param z number Third value
---@return number middle value
function mid(x, y, z) end

-- ============================================================================
-- BITWISE OPERATIONS
-- ============================================================================

---Bitwise AND
---@param x number First value
---@param y number Second value
---@return number result
function band(x, y) end

---Bitwise OR
---@param x number First value
---@param y number Second value
---@return number result
function bor(x, y) end

---Bitwise XOR
---@param x number First value
---@param y number Second value
---@return number result
function bxor(x, y) end

---Bitwise NOT
---@param x number Value
---@return number result
function bnot(x) end

---Shift left
---@param x number Value to shift
---@param n number Bits to shift
---@return number result
function shl(x, n) end

---Arithmetic shift right
---@param x number Value to shift
---@param n number Bits to shift
---@return number result
function shr(x, n) end

---Logical shift right
---@param x number Value to shift
---@param n number Bits to shift
---@return number result
function lshr(x, n) end

---Rotate left
---@param x number Value to rotate
---@param n number Bits to rotate
---@return number result
function rotl(x, n) end

---Rotate right
---@param x number Value to rotate
---@param n number Bits to rotate
---@return number result
function rotr(x, n) end

-- ============================================================================
-- MEMORY
-- ============================================================================

---Read byte from memory
---
---Example:
---```lua
---local col = peek(0x5f00)  -- read draw color
---local a, b = peek(0x6000, 2)  -- read 2 bytes
---```
---@param addr number Memory address (0x0000-0xffff)
---@param n number? Number of bytes to read (max 8192)
---@return number byte value(s)
function peek(addr, n) end

---Write byte(s) to memory
---
---Example:
---```lua
---poke(0x5f00, 8)  -- set draw color to red
---poke(0x6000, 1, 2, 3)  -- write multiple bytes
---```
---@param addr number Memory address
---@param val number Value to write (0-255)
function poke(addr, val) end

---Read 16-bit value from memory
---@param addr number Memory address
---@return number 16-bit value
function peek2(addr) end

---Write 16-bit value to memory
---@param addr number Memory address
---@param val number 16-bit value
function poke2(addr, val) end

---Read 32-bit value from memory
---@param addr number Memory address
---@return number 32-bit value
function peek4(addr) end

---Write 32-bit value to memory
---@param addr number Memory address
---@param val number 32-bit value
function poke4(addr, val) end

---Copy memory region
---
---Example:
---```lua
---memcpy(0x6000, 0x0, 0x2000)  -- copy sprite sheet to screen
---```
---@param dest number Destination address
---@param src number Source address
---@param len number Length in bytes
function memcpy(dest, src, len) end

---Set memory region to value
---
---Example:
---```lua
---memset(0x6000, 0, 0x2000)  -- clear screen to black
---```
---@param dest number Destination address
---@param val number Value to write (0-255)
---@param len number Length in bytes
function memset(dest, val, len) end

---Reload data from cartridge
---@param dest number Destination address in RAM
---@param src number Source address in ROM
---@param len number Length in bytes
---@param filename string? External cart to load from
function reload(dest, src, len, filename) end

---Store data to cartridge
---@param dest number Destination address in ROM
---@param src number Source address in RAM
---@param len number Length in bytes
---@param filename string? External cart to save to
function cstore(dest, src, len, filename) end

-- ============================================================================
-- STRINGS
-- ============================================================================

---Convert value to string
---
---Example:
---```lua
---print("score: "..tostr(score))
---```
---@param val any Value to convert
---@param flags number? Format flags (0x1=hex)
---@return string string representation
function tostr(val, flags) end

---Convert string to number
---
---Example:
---```lua
---local n = tonum("42")  -- 42
---local h = tonum("ff", 0x1)  -- 255
---```
---@param val string String to convert
---@param flags number? Format flags (0x1=hex)
---@return number? number or nil if conversion fails
function tonum(val, flags) end

---Convert character codes to string
---
---Example:
---```lua
---local s = chr(72, 73)  -- "HI"
---```
---@param ... number Character codes
---@return string resulting string
function chr(...) end

---Get character code(s) from string
---
---Example:
---```lua
---local code = ord("A")  -- 65
---local c1, c2 = ord("HI", 1, 2)
---```
---@param str string Source string
---@param index number? Starting index (1-based)
---@param num number? Number of codes to return
---@return number character code(s)
function ord(str, index, num) end

---Get substring
---
---Example:
---```lua
---local first = sub("hello", 1, 1)  -- "h"
---local rest = sub("hello", 2)      -- "ello"
---```
---@param str string Source string
---@param pos0 number Start position (1-based)
---@param pos1 number? End position (default = end of string)
---@return string substring
function sub(str, pos0, pos1) end

-- ============================================================================
-- SYSTEM
-- ============================================================================

---Get elapsed time in seconds
---
---Based on _update()/_update60() calls, not real time
---
---Example:
---```lua
---local angle = t() * 0.5  -- rotate over time
---if t() > 10 then next_level() end
---```
---@return number seconds since cart started
function time() end

---Get elapsed time (short form)
---@return number seconds since cart started
function t() end

---Get system status
---
---Common values: 0=memory, 1=cpu, 7=fps, 46-49=sfx channels
---
---Example:
---```lua
---local cpu = stat(1)  -- CPU usage (1.0 = 100%)
---local fps = stat(7)  -- current framerate
---```
---@param x number Status index
---@return any status value
function stat(x) end

---Print to host console (for debugging)
---
---Example:
---```lua
---printh("debug: player.x = "..player.x)
---printh("log entry", "debug.txt")  -- append to file
---```
---@param str string Text to print
---@param filename string? File to append to
---@param overwrite boolean? Overwrite file instead of append
function printh(str, filename, overwrite) end

---Reset draw state to defaults
---
---Resets palette, camera, clip, fill pattern, color
function reset() end

---Flip screen buffer and wait for next frame
---
---Only needed if not using _draw()
function flip() end

---Execute system command
---
---Example:
---```lua
---extcmd("pause")  -- open pause menu
---extcmd("reset")  -- reset cart
---```
---@param cmd string Command string
function extcmd(cmd) end

---Set custom menu item
---
---Example:
---```lua
---menuitem(1, "restart", function() reset_game() end)
---```
---@param index number Menu slot (1-5)
---@param label string? Menu text (nil to remove)
---@param callback function? Function to call when selected
function menuitem(index, label, callback) end

---Open persistent cart data
---
---Must be called before dget/dset
---
---Example:
---```lua
---cartdata("mygame_save")
---local highscore = dget(0)
---```
---@param id string Cart data ID (must be unique)
---@return boolean success
function cartdata(id) end

---Get persistent data value
---
---Example:
---```lua
---local level = dget(0)
---local coins = dget(1)
---```
---@param index number Index (0-63)
---@return number value
function dget(index) end

---Set persistent data value
---
---Example:
---```lua
---dset(0, current_level)
---dset(1, coins_collected)
---```
---@param index number Index (0-63)
---@param val number Value to store
function dset(index, val) end
