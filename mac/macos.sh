#! /bin/bash
# Script to install development tools onto a MacOS machine

# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Hashicorp Tools
brew install packer
brew install vault
brew install terraform

# Containerization Tools
brew install --cask docker

# Terminal Tools and Shell config
brew install --cask iterm2
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
brew install powerlevel10k
echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# Pre-Commit
brew install pre-commit
git config --global init.templateDir ~/.git-template
pre-commit init-templatedir ~/.git-template

# Go
brew install golang
mkdir -p $HOME/go/{bin,src,pkg}
echo "# Configure Go Environment" >> ~/.zshrc
echo 'export GOPATH=$HOME/go' >> ~/.zshrc
echo 'export GOROOT=$(brew --prefix golang)/libexec' >> ~/.zshrc
echo 'export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"' >> ~/.zshrc

# Visual Studio Code
brew install --cask visual-studio-code
# VS Code Extensions
code --install-extension vscode-icons-team.vscode-icons
code --install-extension equinusocio.vsc-material-theme-icons
code --install-extension pkief.material-icon-theme
code --install-extension hashicorp.terraform
code --install-extension ms-azuretools.vscode-azureterraform
code --install-extension eamodio.gitlens
code --install-extension ms-azuretools.vscode-docker
code --install-extension golang.go