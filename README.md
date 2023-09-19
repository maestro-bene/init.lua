# 🚄 ⚡ NeoVim's ultimate config files 

 This repo contains my configurations for a smooth NeoVim time baby !

 It has been mostly created by ThePrimeagen, you can find his init.lua [here](https://github.com/ThePrimeagen/init.lua).
 
 I simply customized it, removed some things that were'nt useful to me, and added nvim-tree 🌲
 > Be careful about nvim-tree : I do not disable netrw because I like to use it, even with nvim-tree  (not recommended)...
> 
 > I just think nvim-tree is better when you don't know your way around the structure of a project yet
>
> But you can disable netrw in the init.lua file by uncommenting these lines :
> ```lua
>   --vim.g.loaded_netrw = 1
>   --vim.g.loaded_netrwPlugin = 1
> ```
 
----------------------------------

## ❗ Things to note before cloning, and building the nvim environment
- Download the [latest Neovim version](https://github.com/neovim/neovim/wiki/Installing-Neovim) using your OS's package manager (debian or ubuntu : apt, arch : pacman, windows : winget or chocolatey)
- Download Packer (a nice Neovim package manager)

  Unix/Linux :
  ```
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  ```
  PowerShell :
  ```
  git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
  ```
- Download [ripgrep](https://github.com/BurntSushi/ripgrep) following the installation process for your OS
- Download the "[Hacker Nerd Font](https://www.nerdfonts.com/font-downloads)" or any other nerd font (for the nvim tree icons to display  properly) and install it on your system
- Set a environment variable called `HOME`, pointing to the home directory for your user (if not already present)
- Make a `.nvim/undodir` directory under the user's home directory
- Make sure to have the latest gcc compiler using your OS's package manager (debian or ubuntu : `apt`, arch : `pacman`, windows : `winget` or `choco`)
  > Use mingw for example

----------------------------------

## ⬇️ Installation guide

> 🏗️ A script is in preparation, it should come out in the near future. 
> It will take into account the prerequisites listed above


1. Read and install the prerequisites listed above (🚧 or use the install script if available 🚧)
2. Go into your Home directory, and if on Windows into `HOME\Appdata\Local\`
3. Create a .nvim directory (or nvim if on Windows)
4. Clone the repo using SSH if configured, or HTTPS if not :
   
   SSH :
   ```
   git@github.com:maestro-bene/init.lua.git
   ```
   HTTPS :
   ```
   https://github.com/maestro-bene/init.lua.git
   ```
5. Open neovim inside `init.lua`, type `:so` to source the file
6. Then go, -still with neovim- in `lua/maestro-b/packer.lua` and type `:so`, then type `:PackerSync`
   > This should source the file, and install all the necessary plugins,
7. Close neovim
8. Reopen it back up and watch the magic happen
9. And git gud as they say !
    
----------------------------------

### 🌲 Enabling / Disabling nvim-tree

To enable or disable nvim-tree, either :
- Type `:NvimTreeToggle` when already using nvim
- Go to the first init.lua, and comment (add --) the following line :
  ```lua
  require("nvim-tree").setup()
  ```
  > Simply make sure you comment the first lines about netrw since you won't be using nvim-tree, it's very nice too.
  > ```lua
  > vim.g.loaded_netrw = 1
  > vim.g.loaded_netrwPlugin = 1
  > ```

## Vim motions and commands AZERTY cheat sheet

To finish, here's a little cheat sheet on Vim basic commands / motions for AZERTY keyboards :
![Great cheat sheet](/assets/images/cheat-sheet.png)
