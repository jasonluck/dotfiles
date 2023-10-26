#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Hashicorp Tools
choco upgrade packer -y
choco upgrade terraform -y
choco upgrade consul -y 
choco upgrade vault -y

# Container Tools
choco upgrade docker-cli -y

# Kubernetes tools
# microk8s - https://microk8s.io/

# Visual Studio Code
choco upgrade vscode -y
# VS Code Extensions
code --install-extension vscode-icons-team.vscode-icons
code --install-extension equinusocio.vsc-material-theme-icons
code --install-extension pkief.material-icon-theme
code --install-extension hashicorp.terraform
code --install-extension eamodio.gitlens