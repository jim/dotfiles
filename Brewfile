os = Gem::Platform.local.os

tap "homebrew/bundle"
tap "homebrew/core"
tap "homebrew/services"

tap "heroku/brew"

brew "asdf"
brew "bat"
brew "direnv"
brew "entr"
brew "exa"
brew "fish"
brew "git"
brew "httpie"
brew "jq"
brew "neovim"
brew "postgresql"
brew "ripgrep"
brew "stow"
brew "tree"
brew "unzip"
brew "wget"

brew "heroku"

if os == "darwin"
  tap "homebrew/cask"
  tap "homebrew/cask-fonts"
  tap "homebrew/services"
  # tap "mas-cli/tap"
  # brew "mas"

  cask_args appdir: '/Applications'

  cask "bitbar"
  cask "chromedriver"
  cask "iterm2"
  cask "1password"
  cask "visual-studio-code"
end
