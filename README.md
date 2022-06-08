# Installation

```
git clone --bare git@github.com:Spazholio/env.git $HOME/.cfg
alias dotfiles="$(which git) --git-dir=$HOME/.cfg/ --work-tree=$HOME"
dotfiles config --local status.showUntrackedFiles no
dotfiles config pull.rebase false
dotfiles checkout
dotfiles submodule update --init --recursive
```
After that, open `vim` and run `:PlugInstall` to get everything set up.

# Switching to root
Normally, you can just run `sudo -s` and you'll get all the same bells and whistles while having elevated privileges.  However, some distros lock that down so you're not able to persist `$HOME` when running `sudo`.  To get around that, run `visudo` and add these 2 lines:
```
Defaults:[YOUR_USERNAME_HERE]   env_keep += "HOME"
Defaults:[YOUR_USERNAME_HERE]   !always_set_home
```
There are security implications to this, so be aware when implementing.
