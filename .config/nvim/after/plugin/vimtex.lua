-- Enable filetype detection, plugins, and indentation
vim.cmd('filetype plugin indent on')

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Configure the viewer method for VimTeX
vim.g.tex_flavor='latex'
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_view_skim_sync = 1
vim.g.vimtex_view_skim_activate = 1

vim.g.maplocalleader = ','
