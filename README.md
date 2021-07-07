cd tmp
git clone https://github.com/vim/vim.git
cd ./vim/src
./configure --with-features=huge --enable-python3interp --enable-rubyinterp --enable-luainterp --enable-perlinterp --with-python3-config-dir=/usr/lib/python3.7/config-3.7m-x86_64-linux-gnu/ --enable-multibyte --enable-cscope      --prefix=/usr/local
make VIMRUNTIMEDIR=/usr/local/share/vim/vim82
sudo make install
