
# Setup vim

## Install [Pathogen](https://github.com/tpope/vim-pathogen):

```
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

add this to ~/.vimrc:

```
execute pathogen#infect()
syntax on
filetype plugin indent on
```

## Install [Syntastic](https://github.com/vim-syntastic/syntastic)

```
cd ~/.vim/bundle && \
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
```

Quit vim and start it back up to reload it, then type:

```
:Helptags
```

### Recommended settings:

```
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
```

## Install [rust.vim](https://github.com/rust-lang/rust.vim)

```
git clone --depth=1 https://github.com/rust-lang/rust.vim.git ~/.vim/bundle/rust.vim
```

