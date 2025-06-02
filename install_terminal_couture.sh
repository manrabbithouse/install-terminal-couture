#!/bin/bash
set -e

echo "Backing up and prepping Terminal couture..."
mv -v ~/.zshrc ~/.zshrc.backup.$(date +%s) 2>/dev/null || true
rm -rf ~/.oh-my-zsh ~/.p10k.zsh

# Install Homebrew
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

brew install git neofetch htop tree fzf
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cat > ~/.zshrc <<EOF
export ZSH="\$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source \$ZSH/oh-my-zsh.sh

alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias update="brew update && brew upgrade && brew cleanup"
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
EOF

curl -fsSL https://raw.githubusercontent.com/romkatv/powerlevel10k-media/master/config/p10k-classic.zsh -o ~/.p10k.zsh

clear
echo "🎉 Terminal Couture installed! Set your font to MesloLGS NF and run: p10k configure"
exec zsh

