git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo apt-get install gawk net-tools coreutils tmux

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall
