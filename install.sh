xcode-select --install
# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install git
brew install node

brew install mongodb
sudo mkdir -p /data/db; sudo chown -R $(whoami) /data/db


brew cask install postgres
brew cask install google-chrome

brew cask install visual-studio-code

code --install-extension bceskavich.theme-dracula-at-night
code --install-extension bungcip.better-toml
code --install-extension chenxsan.vscode-standardjs
code --install-extension dbaeumer.vscode-eslint
code --install-extension dracula-theme.theme-dracula
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension gerane.theme-dark-dracula
code --install-extension ifaxity.onedark
# code --install-extension maptz.camelcasenavigation
code --install-extension mayank-shekhar.dracula-dark-vibrant
code --install-extension mgmcdermott.vscode-language-babel
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension nopjmp.fairyfloss
code --install-extension xabikos.reactsnippets
code --install-extension zhuangtongfa.material-theme
