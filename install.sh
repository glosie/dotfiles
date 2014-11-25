echo 'You might need to change your default shell to zsh: `chsh -s /bin/zsh` (or `sudo vim /etc/passwd`)'

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
dir="$HOME/Projects"
mkdir -p $dir
cd $dir
git clone --recursive git://github.com/glosie/dotfiles.git
# cd dotfiles
# sudo bash bin/symlink-dotfiles.sh
