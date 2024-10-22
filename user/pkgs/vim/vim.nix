{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    extraConfig = ''
      " Numbering
      set nu
      set relativenumber
      
      " Tab Stuff
      set tabstop=4
      set softtabstop=4
      set shiftwidth=4
      
      set smartindent
      set scrolloff=8
      
      "Backspace Stuff
      set backspace=indent,eol,start
      
      "Statusline
      set laststatus=2
      
      " Syntax Highlighing and Coloring
      syntax on
      set termguicolors
      colorscheme sorbet
      set nohlsearch
      set incsearch
      
      " Other Settings
      set nowrap
      set noswapfile
      set nobackup
      
      " Remaps
      map " " <nop>
      map Q <nop>
      let mapleader=" "
      nnoremap <silent> J mzJ`z
      nnoremap <silent> <C-d> <C-d>zz
      nnoremap <silent> <C-u> <C-u>zz
      nnoremap <silent> n nzzzv
      nnoremap <silent> N Nzzzv
      vnoremap <silent> J :m '>+1<CR>gv=gv
      vnoremap <silent> K :m '<-2<CR>gv=gv
      vnoremap <silent> < <gv
      vnoremap <silent> > >gv
      
      nnoremap <silent> <leader>e :Ex<CR>
      nnoremap <silent> <leader>c :execute "set colorcolumn=" . (&colorcolumn == "" ? "81" : "")<CR>
      nnoremap <silent> <leader>x :!chmod +x %<CR>
    '';
  };
}
