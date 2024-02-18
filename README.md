![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)

## /\\/!n]a's Dotfiles (xrandr)

- Note: Less is More

### To install this configuration

- Clone as non-bare repo and place in arbitrary location(tmp)
``` sh
 git clone \
   --separate-git-dir=$HOME/dotfiles \
   https://github.com/ysxninja/dotfiles.git \
   dotfiles-tmp
```
- copy the snapshot from tmp dir to the correct locations
```sh
 rsync --recursive --verbose --exclude '.git' dotfiles-tmp/ $HOME/
```

- remove the tmp dir
```sh
 rm -rf dotfiles-tmp
```
