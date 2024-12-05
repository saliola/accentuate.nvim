# accentuate.nvim
A Neovim plugin providing mappings to highlight word the word under the cursor.

This is a lua implementation of a mini-plugin I found a few years ago in 
[Steve Losh's `.vimrc`](https://gist.github.com/sooop/8dc424e13c6fe2e2a663#file-gistfile1-vim-L2291),
and have found very useful.

> Sometimes you're looking at a hairy piece of code and would like a certain
> word or two to stand out temporarily.  You can search for it, but that only
> gives you one color of highlighting.  Now you can use <leader>N where N is
> a number from 1-6 to highlight the current word in a specific color. [Steve Losh]

This implementation supports 9 colours and the following mappings:

- `<leader>w` will highlight the word under the cursor with the next available color
- `<leader>1`, `<leader>2`, ..., `<leader>9` will highlight the word with the i-th color
- `<leader>0` will clear the highlighting
