# cabline.nvim

<img width="1385" alt="Screen Shot 2022-11-02 at 10 39 00" src="https://user-images.githubusercontent.com/11034778/201411831-118369d6-a595-4e2d-b387-396deed70b39.png">

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
