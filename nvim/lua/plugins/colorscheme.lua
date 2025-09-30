return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      integrations = {
        nvimtree = true,
        telescope = true,
        which_key = true,
        treesitter = true,
        gitsigns = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
