# Terminal Couture

**By Robert Santoré**

Give your macOS Terminal the runway treatment it deserves. This one-click setup script installs everything you need for a modern, elegant, and powerful command-line experience using:

- Homebrew
- Oh My Zsh
- Powerlevel10k
- Fastfetch (for chic system info)
- Meslo Nerd Font (for icons and Unicode glam)

---

## ✨ Features

- ✅ One-command installation
- 🎨 Custom `~/.zshrc` and Powerlevel10k theme
- 🧩 Plugins: `zsh-autosuggestions`, `zsh-syntax-highlighting`
- ⚡ CLI tools: `git`, `fastfetch`, `htop`, `tree`, `fzf`
- 🖋️ Font: `MesloLGS NF` (auto-installed)

---

## 🛠️ Install

### 1. Run This One-Liner

Paste this into Terminal:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/manrabbithouse/install-terminal-couture/main/install_terminal_couture.sh)"
```

### 2. Set the Font

After the script finishes:

- Open **Terminal > Settings > Profiles > Text**
- Set font to **MesloLGS NF**

### 3. Configure Powerlevel10k

Then run:

```
p10k configure
```

Follow the wizard to pick your preferred prompt style (classic, rainbow, lean — whatever suits your flair).

---

## 📸 Screenshots

> Coming soon: before & after glam shots of your Terminal transformation.
> 

---

## 🧼 Extras

- To clean broken links or resolve warnings:
    
    ```
    brew cleanup
    ```
    
- To update everything:
    
    ```
    update
    ```
    
- To flush DNS:
    
    ```
    flushdns
    ```
    

Fastfetch will auto-display system info each time you launch Terminal.

---

## ❤️ Credits

Built by [Robert Santoré](https://github.com/manrabbithouse), inspired by the pursuit of beauty in all things — even your shell prompt.

---

## License

MIT. Couture is meant to be shared.
