# Cabline.nvim

<img width="1385" alt="Screen Shot 2022-11-02 at 10 39 00" src="https://user-images.githubusercontent.com/11034778/201411831-118369d6-a595-4e2d-b387-396deed70b39.png">

**C**ustom t**abline** plugin for adding functionality to your projects. Instead of setting 
up buffer tabs, set up custom display elements for your Neovim!

This is a personal project to customize _my own_ tab line preferences. The structure is intended to let 
you add your own methods and displays to fit _your_ workflow.

## How to Install

Packer:
```
plugin { 'andrewjwaggoner/cabline.nvim' }
```

## Options
Default configuration
```
require('cabline').setup({
  convert_selection = true, -- turns on Cabline's hex/decimal/binary converter.
  tabline_override = false -- tabline construction method override. Use this to supply your own.
})
```

## Setup Details
The plugin overrides `vim.g.tabline` with a hook to Cabline's tabline builder.
 If you have a plugin that utilizes this, it will interfere with Cabline.nvim.
