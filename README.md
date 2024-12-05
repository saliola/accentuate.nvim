# accentuate.nvim

**accentuate.nvim** is a Neovim plugin providing mappings to (temporarily)
highlight the word under the cursor.

This plugin expands on a mini-plugin I found a few years ago in 
[Steve Losh's `.vimrc`](https://gist.github.com/sooop/8dc424e13c6fe2e2a663#file-gistfile1-vim-L2291)
and have found very useful ever since. Steve's original comment reads:

> Sometimes you're looking at a hairy piece of code and would like a certain
> word or two to stand out temporarily.  You can search for it, but that only
> gives you one color of highlighting.  Now you can use <leader>N where N is
> a number from 1-6 to highlight the current word in a specific color.

## Mappings

- `<leader>w` - highlight the word under the cursor with the next available color
- `<leader>1`, `<leader>2`, ..., `<leader>9` - highlight the word under the cursor with the i-th color
- `<leader>0` - clear the highlightings

## Installation

Install the plugin with your preferred package manager. For example, with
[lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
return {
    "saliola/accentuate.nvim"
}
```
