#!/bin/bash

set -e # Fail fast

ZSH_ROOT=$HOME/zsh
ZSH_DIR=$ZSH_ROOT/zsh
OH_MY_ZSH_DIR=$ZSH_ROOT/omz
P10K_DIR=$OH_MY_ZSH_DIR/themes/powerlevel10k
ZSH_AUTO_S_DIR=$OH_MY_ZSH_DIR/plugins/zsh-autosuggestions

# Download ZSH
if [ ! -d $ZSH_DIR ]; then
  curl -fsSL https://raw.githubusercontent.com/romkatv/zsh-bin/master/install | bash -s -- -d $ZSH_DIR
fi

# Add zsh to path
export PATH="$ZSH_DIR/bin:$PATH"

# Download Oh My Zsh
if [ ! -d $OH_MY_ZSH_DIR ]; then
  # If we're running in replit, set CHSH=no
  # [[ $REPL_SLUG ]] && export CHSH=no
  ZSH=$OH_MY_ZSH_DIR CHSH=no KEEP_ZSHRC=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  # unset CHSH
fi

# Download powerlevel10k
if [ ! -d $P10K_DIR ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $P10K_DIR
fi

# Download zsh-autosuggestions
if [ ! -d $ZSH_AUTO_S_DIR ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTO_S_DIR
fi

cp .zshrc ~
cp .p10k.zsh ~

# ~/zsh/zsh/bin/zsh -i
