# My nvim config

I love nvim. I started with [@theprimeagen's nvim 0 to lsp tutorial](https://www.youtube.com/watch?v=w7i4amO_zaE).
Then I switched to [LunarVim](https://www.lunarvim.org/) so I could use all
those cool plugins without having to fight with configuration. After a couple months
I still love LunarVim, but now it feels like too much. 

So here I am with my custom nvim config. It does what I want and thats it. It's
wonderful. I feel like I just built my lightsaber.

### New to nvim and want to try out my preferences?

* [install nvim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
* [install lazygit](https://github.com/jesseduffield/lazygit) - a truly magical git experience
* [install catpuccin terminal colors](https://github.com/catppuccin/catppuccin)
* Install my config
```
cd ~/.config
git clone git@github.com:chdwck/wick-nvim-config.git nvim
```

#### Some of my favorite remaps
Note for the new peeps: `<leader>` means space, `<C-d>` means control key + d

* `<leader>gg` - open lazygit
* `<leader>e` - toggle file tree
* `<leader>u` - toggle undotree
* `<leader>s` - search and replace word under cursor in line
* `<leader>S` - search and replace word under cursor in file
* `<leader>/` - comment line 
* `<C-h>`, `<C-j>`,`<C-k>`, `<C-l>` - navigate panes
