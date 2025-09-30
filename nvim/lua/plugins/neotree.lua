return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- (Tùy chọn) Cần thiết để hiển thị icon đẹp
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = false, -- Tự động đóng nếu là cửa sổ cuối cùng
        popup_border_style = "rounded",
        filesystem = {
          follow_current_file = true,
          use_libuv_file_watcher = true,
          hijack_netrw_behavior = "open_default",
        },
        window = {
          width = 30,
          mappings = {
            ["<space>"] = "toggle_node",
            ["<cr>"] = "open",
            ["o"] = "open",
            ["s"] = "open_split",
            ["v"] = "open_vsplit",
            ["t"] = "open_tabnew",
            ["i"] = "open_split",
            ["h"] = "close_node",
            ["H"] = "toggle_hidden",
          },
        },
      })
      vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree", silent = true })
      vim.cmd([[
      hi! NormalFloat guibg=NONE
      hi! NeoTreeNormal guibg=NONE
      hi! NeoTreeNormalNC guibg=NONE
    ]])
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },
}
