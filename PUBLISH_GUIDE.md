# Publishing Your PICO-8 Extension

## 🚀 VS Code Marketplace Publishing

### Step 1: Create Publisher Account
1. Visit: https://marketplace.visualstudio.com/manage/publishers/
2. Sign in with Microsoft account
3. Click "Create Publisher"
4. Choose ID: `jaybennett`
5. Fill in details

### Step 2: Create Personal Access Token
1. Go to: https://dev.azure.com/
2. Click "Azure DevOps" → "Personal access tokens"
3. Click "New Token"
4. Configure:
   - **Name**: "VS Code Extension Publishing"
   - **Organization**: All accessible organizations
   - **Scopes**: Custom → **Marketplace** (Manage)
5. **Copy the token immediately** (won't show again!)

### Step 3: Login and Publish
```bash
# Login with your token
vsce login jaybennett
# (Enter your Personal Access Token when prompted)

# Publish to marketplace
vsce publish
```

### Step 4: Update Extension
```bash
# Update version in package.json first, then:
vsce publish
```

## 📦 Alternative: Share .vsix File

If you don't want to publish publicly:

### Method 1: Direct Install
```bash
# Install locally
code --install-extension pico8-enhanced-1.0.0.vsix
```

### Method 2: Share File
- Send `pico8-enhanced-1.0.0.vsix` to others
- They install with: `code --install-extension pico8-enhanced-1.0.0.vsix`

### Method 3: GitHub Releases
1. Create GitHub repository
2. Upload `.vsix` file as release asset
3. Share download link

## 🎯 Publishing Checklist

- [ ] Test extension thoroughly
- [ ] Update version in `package.json`
- [ ] Check all files included in `.vscodeignore`
- [ ] Verify icon displays correctly
- [ ] Test on different VS Code versions
- [ ] Write good marketplace description

## 📝 Marketplace Description Template

```markdown
# PICO-8 Enhanced

Complete development support for PICO-8 fantasy console games.

## Features

✨ **Syntax Highlighting** - Full PICO-8 Lua syntax support
🔍 **IntelliSense** - Auto-completion for all PICO-8 API functions
📚 **API Documentation** - Hover help for every function
🎨 **File Association** - `.p8` files recognized as PICO-8 code
⚡ **Performance** - Fast, lightweight, and reliable

## What's Included

- Complete PICO-8 API definitions
- Syntax highlighting for `.p8` files
- IntelliSense and hover documentation
- Proper language configuration
- Beautiful icon design

## Usage

1. Open any `.p8` file
2. Get instant syntax highlighting
3. Use Ctrl+Space for auto-completion
4. Hover over functions for documentation

Perfect for PICO-8 game developers!
```

## 🚨 Important Notes

- **Version numbers**: Must increment for updates
- **Publisher ID**: Must match your Azure DevOps account
- **File size**: Keep under 50MB
- **Testing**: Test on multiple VS Code versions
- **Description**: Write compelling marketplace description

## 🔧 Troubleshooting

**Login Issues:**
- Ensure Personal Access Token has Marketplace permissions
- Check publisher ID matches exactly
- Try creating new token if expired

**Publishing Errors:**
- Check version number is higher than previous
- Verify all required fields in `package.json`
- Ensure no syntax errors in extension code

**File Issues:**
- Check `.vscodeignore` excludes unnecessary files
- Verify icon path is correct
- Ensure all dependencies are included
