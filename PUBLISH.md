# Publishing Guide

## 📦 Package the Extension

### 1. Install VSCE (VS Code Extension Manager)

```bash
npm install -g vsce
```

### 2. Package the Extension

From the extension directory:

```bash
cd pico8-vscode-extension
vsce package
```

This creates: `pico8-enhanced-1.0.0.vsix`

## 🚀 Install Locally

### Install the VSIX

**In VS Code/Cursor:**
```
Cmd+Shift+P → "Extensions: Install from VSIX..." → select the .vsix file
```

**Or via command line:**
```bash
code --install-extension pico8-enhanced-1.0.0.vsix
```

## 🌐 Publish to VS Code Marketplace (Optional)

### 1. Create Publisher Account

1. Go to: https://marketplace.visualstudio.com/manage
2. Sign in with Microsoft/GitHub account
3. Create a publisher (e.g., "jaybennett")

### 2. Get Personal Access Token

1. Go to: https://dev.azure.com/
2. User Settings → Personal Access Tokens
3. Create new token with **Marketplace (Manage)** scope
4. Copy the token!

### 3. Login to VSCE

```bash
vsce login YOUR-PUBLISHER-NAME
```

Paste your Personal Access Token when prompted.

### 4. Publish

```bash
vsce publish
```

Or publish a specific version:

```bash
vsce publish 1.0.1
vsce publish minor  # 1.0.0 → 1.1.0
vsce publish major  # 1.0.0 → 2.0.0
```

### 5. Update the Extension

1. Make your changes
2. Update version in `package.json`
3. Update `CHANGELOG.md`
4. Package and publish:
   ```bash
   vsce package
   vsce publish
   ```

## 📝 Before Publishing Checklist

- [ ] Create an icon (128x128 PNG) and save to `images/icon.png`
- [ ] Update publisher name in `package.json`
- [ ] Test extension thoroughly
- [ ] Update README with screenshots/GIFs
- [ ] Fill out all package.json metadata
- [ ] Add repository URL
- [ ] Check all dependencies are listed
- [ ] Test in clean VS Code install

## 🎨 Creating an Icon

The extension needs a 128x128 PNG icon. You can:

1. **Create a PICO-8 themed icon** (pixelart style!)
2. **Use a generator**: https://favicon.io/
3. **Design in any tool** and export as 128x128 PNG

Save to: `images/icon.png`

## 📦 Unpublish (if needed)

```bash
vsce unpublish YOUR-PUBLISHER.pico8-enhanced
```

## 🔄 Update Workflow

```bash
# 1. Make changes
# 2. Test locally
# 3. Update version & changelog
git add .
git commit -m "Version 1.0.1: Bug fixes"
git tag v1.0.1
git push && git push --tags

# 4. Package & publish
vsce package
vsce publish
```

## 📊 Analytics

After publishing, view stats at:
https://marketplace.visualstudio.com/manage/publishers/YOUR-PUBLISHER-NAME

## 💡 Tips

- **Semantic Versioning**: MAJOR.MINOR.PATCH
  - MAJOR: Breaking changes
  - MINOR: New features (backwards compatible)
  - PATCH: Bug fixes

- **Test before publishing**: Install VSIX locally and test thoroughly

- **README is important**: Users see it on marketplace - make it good!

- **Keywords**: Help users find your extension

- **Screenshots**: Show features in action

## 🌟 Share Your Extension

After publishing, share on:
- PICO-8 BBS forums
- Reddit: r/pico8
- Twitter/X with #pico8
- Discord PICO-8 communities

---

**Good luck! 🚀**

