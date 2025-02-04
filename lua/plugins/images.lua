--Okay so this plugin basicsally allows you to view images in neovim itself
--I made this plugin work with much wishy washy so I do not know if it will work for you
--Requires a lot of dependencies, a specific terminal emulator (kitty which is bestttttt)
--rough walkthrough:
--download and install lua or/and luarocks (for version 5.1)
--install magick with luarocks for lua5.1
--and it also requires a lot of dependencies so go check the plugin maintainer for the list
return {
  "3rd/image.nvim",
  lazy = false,
  config = function()
    require("image").setup()
  end,
}
