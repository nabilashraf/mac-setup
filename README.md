# My Front End Web Development Setup for macOS

This document describes how I set up front end web development environment on my MacBook Air with macOS High Sierra 10.13.3.

- [System Preferences](#system-preferences)
- [Terminal](#terminal)
- [Bash](#bash)
- [Homebrew](#homebrew)
- [Git](#git)
- [Node.js](#nodejs)
- [Node Package Manager](#node-package-manager)
- [Visual Studio Code](#visual-studio-code)

## System Preferences

After "clean" install of operating system, there are a couple tweaks I like to make to the System Preferences. Feel free to follow these, or to ignore them, depending on your personal preferences.

- General > User dark menu bar and Dock
- General > Ask to keep changes when closing documents
- General > Close windows when quitting an app
- General > Recent itemss > none?
- Dock > Automatically hide and show the Dock
- Desktop & Screen Saver > Screen Saver > Start after > Never
- Keyboard > Key Repeat > Fast (all the way to the right)
- Keyboard > Delay Until Repeat > Short (all the way to the right)


### Set Dock size

```shell
defaults write com.apple.dock tilesize -int 35; killall Dock
```

### Disable "Press and hold"

```shell
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
```

### Reset icons in Launchpad

```shell
defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock
```

### Show hidden files

This can also be done by pressing `Command ⌘` + `Shift ⇧` + `.`.

```shell
defaults write com.apple.finder AppleShowAllFiles YES
```

### Show path bar in Finder

```shell
defaults write com.apple.finder ShowPathbar -bool true
```

### Show status bar in finder

```shell
defaults write com.apple.finder ShowStatusBar -bool true
```

## Terminal

I use my custom profile called "Flat".

```shell
$ curl -O https://raw.githubusercontent.com/appalaszynski/mac-setup/master/Custom.terminal
```

To use it as default profile just open downloaded `Custom.terminal` file and click **Shell** > **Use settings as default**.

## Bash

In my `.bash_profile` file I create a simple script to keep Homebrew (which we are going to install in a second) up to date, remove bash history, color scheme for `ls` command output and custom prompt which contains username, computer name, working directory and current Git branch.

```shell
cd ~
$ curl -O https://raw.githubusercontent.com/appalaszynski/mac-setup/master/.bash_profile
source ~/.bash_profile
```

## Homebrew

Installing the [Homebrew](http://brew.sh/) package manager will allow you to install almost any app from the command line.

### Installation

```shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Usage

To install a package (or **Formula** in Homebrew vocabulary) simply type

```shell
brew install <formula>
```

### Brewfile

Installing each package separately may take some time. That's why I use [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle), which allows You to automatically install all packages and applications listed in the `Brewfile` file.

To download my `Brewfile` file simply type

```shell
$ curl -O https://raw.githubusercontent.com/appalaszynski/mac-setup/master/Brewfile
```

Here are all the programs I install with a brief description. You can choose to add or subtract any programs you’d like. They’re all free.

- [Cask](https://caskroom.github.io) - an extension to Homebrew that will allow you to install almost any program that exists for a Mac.
- [Git](https://git-scm.com) - for version control
- [mas-cli](https://github.com/mas-cli/mas) - Mac App Store command line interface will allow you to install from the App Store.
- [AppCleaner](https://freemacsoft.net/appcleaner/) - uninstall unwanted apps
- [Filezilla](https://filezilla-project.org) - FTP client
- [Firefox](https://www.mozilla.org/firefox/new/) - web browser
- [Flux](https://justgetflux.com) - better (in my opinion) Night Shift for your Mac
- [Google Chrome](https://www.google.pl/chrome/browser/desktop/index.html) - web browser
- [KeepingYouAwake](https://github.com/newmarcel/KeepingYouAwake) - prevent your Mac from entering sleep mode
- [Keka](http://www.kekaosx.com) - file archiver
- [MAMP](https://www.mamp.info/en/) - Apache, MySQL and PHP package
- [Opera](http://www.opera.com) - web browser
- [Sequel Pro](http://www.sequelpro.com) - excellent free GUI for MySQL databases
- [Spectacle](https://www.spectacleapp.com) - easily move and resize windows
- [Transmission](https://transmissionbt.com) - BitTorrent client
- [Visual Studio Code](https://code.visualstudio.com) - code editor
- [VLC](https://www.videolan.org/vlc/) - media player
- [iMovie](https://www.apple.com/imovie/) - video editor
- [Pages](https://www.apple.com/pages/) - text editor
- [Numbers](https://www.apple.com/numbers/) - spreadsheet

Below are the entire contents of my `Brewfile`, which will install all the above programs with a single command.

```ruby
tap 'caskroom/cask'

brew 'git'
brew 'mas'

cask 'appcleaner'
cask 'filezilla'
cask 'firefox'
cask 'flux'
cask 'google-chrome'
cask 'keepingyouawake'
cask 'keka'
cask 'mamp'
cask 'opera'
cask 'sequel-pro'
cask 'spectacle'
cask 'transmission'
cask 'visual-studio-code'
cask 'vlc'

mas "iMovie", id: 408981434
mas "Numbers", id: 409203825
mas "Pages", id: 409201541
```

To install all programs, all You have to do is simply type

```shell
brew bundle
```

## Git

To set Git global configuration You can run commands which will update the Git configuration file, e.g.

```shell
git config --global user.name "First Last"
```

You can do it faster by creating the Git configuration file and input it all ourselves.

```shell
cd ~
$ curl -O https://raw.githubusercontent.com/appalaszynski/mac-setup/master/.gitconfig
open .gitconfig
```

Here I set my name, email, GitHub username, core editor and connect Git to the OS X Keychain so I don’t have to type my username and password every time I want to push to GitHub.

```properties
[user]
  name = First Last
  email = email@email.com
[github]
  user = username
[core]
  editor = editor
[credential]
  helper = osxkeychain
```

## Node.js

To install  Node.js i like to use [Node Version Manager](https://github.com/creationix/nvm).

```shell
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
```

List all available versions on Node.js

```shell
nvm list-remote
```

Install chosen version

```shell
nvm install <version>
```

## Node Package Manager

I mostly use npm locally for projects. The only thing I use globally at the moment is [Gulp](https://gulpjs.com).

### Gulp

Install Gulp globally

```shell
npm install --global gulp-cli
```

## Visual Studio Code

```shell
cd /Users/Your Username/Library/Application Support/Code/User
$ curl -O https://raw.githubusercontent.com/appalaszynski/mac-setup/master/settings.json
```

```json
{
  "workbench.startupEditor": "newUntitledFile",
  "workbench.colorTheme": "Monokai",
  "editor.fontSize": 12,
  "editor.tabSize": 2,
  "editor.multiCursorModifier": "ctrlCmd",
  "editor.minimap.enabled": false,
  "workbench.activityBar.visible": false,
  "explorer.openEditors.visible": 0,
  "files.insertFinalNewline": true
}
```

### Extensions

For now I only use [SCSS IntelliSense](https://marketplace.visualstudio.com/items?itemName=mrmlnc.vscode-scss) extension.
