# NeoVim's ultimate config files

 This repo contains my configurations for a smooth NeoVim time baby !
 
----------------------------------

#### Things to note before cloning, and building the nvim environment

- Download the "[Hacker Nerd Font](https://www.nerdfonts.com/font-downloads)" or any other nerd font (for the nvim tree icons to display  properly)
- Set a environment variable called HOME, pointing to the home directory for your user (if not already present)
- Make a .nvim/undodir directory under the user's home directory

----------------------------------

### Enabling / Disabling nvim-tree

To enable or disable nvim-tree, either :
- Type `:NvimTreeToggle` when already using nvim
- Go to the first init.lua, and comment (add --) the following line :
`require("nvim-tree").setup()`

To finish, here's a little cheat sheet on Vim basic commands / motions :
![Great cheat sheet](/assets/images/cheat-sheet.png)
