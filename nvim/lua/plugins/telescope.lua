return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim", -- Tăng tốc tìm kiếm
      "nvim-telescope/telescope-ui-select.nvim", -- Cải thiện UI chọn
    },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = "➜ ",
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = { prompt_position = "top", preview_width = 0.5 },
            vertical = { mirror = false },
          },
        },
        pickers = {
          find_files = { hidden = true },
          live_grep = { theme = "ivy" },
        },
        extensions = {
          ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
        },
      })

      -- Load extensions
      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")

      -- Keymaps cho telescope
      local keymap = vim.keymap.set
      keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
      keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
      keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find Buffers" })
      keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find Help" })
    end,
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Tăng tốc tìm kiếm
  { "nvim-telescope/telescope-ui-select.nvim" }, -- Cải thiện UI
}
