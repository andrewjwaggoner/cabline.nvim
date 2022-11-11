# cabline.nvim
Custom tabline plugin for adding functionality to your projects. Instead of setting 
up buffer tabs, set up custom display elements for your Neovim!

## How to Install

Packer:
```
plugin { 'andrewjwaggoner/cabline.nvim' }
```

## Options
```
require('cabline').setup({
 -- no options needed at the moment
})
```

## Setup Details
The plugin overrides `vim.g.tabline` with a hook to cabline's tabline builder.
 If you have a plugin that utilizes this, it will interfere with cabline.nvim.
