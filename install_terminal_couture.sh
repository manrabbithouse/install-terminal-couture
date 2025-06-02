#!/bin/bash
set -e

echo "Backing up and prepping Terminal couture..."
mv -v "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%s)" 2>/dev/null || true
rm -rf "$HOME/.oh-my-zsh" "$HOME/.p10k.zsh"

# Install Homebrew if not found
if ! command -v brew &>/dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Add brew to shell environment (Intel Mac safe)
eval "$($(brew --prefix)/bin/brew shellenv)"

# Run brew doctor (non-blocking)
echo "�� Running brew doctor..."
brew doctor || true

# Install essential CLI tools and font
echo "📦 Installing tools and fonts..."
brew install git fastfetch htop tree fzf
brew install --cask font-meslo-lg-nerd-font

# Install Oh My Zsh
echo "💅 Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k
echo "✨ Installing Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# Install Zsh plugins
echo "🔌 Installing Zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# Create new .zshrc
echo "📝 Writing .zshrc..."
cat > "$HOME/.zshrc" <<EOF
export ZSH="\$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source \$ZSH/oh-my-zsh.sh

alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias update="brew update && brew upgrade && brew cleanup"
[[ -f \$HOME/.p10k.zsh ]] && source \$HOME/.p10k.zsh

# Show system info at launch
if command -v fastfetch &>/dev/null; then
  fastfetch
fi
EOF

# Download preset Powerlevel10k config
echo "🎨 Downloading Powerlevel10k theme preset..."
curl -fsSL https://raw.githubusercontent.com/romkatv/powerlevel10k-media/master/config/p10k-classic.zsh -o "$HOME/.p10k.zsh"

# Final message
clear
echo -e "\n🎉 Terminal Couture installed!\n"
echo "👉 Open Terminal > Settings > Profiles > Text and set your font to 'MesloLGS NF'"
echo "👉 Then run: p10k configure"
exec zsh

