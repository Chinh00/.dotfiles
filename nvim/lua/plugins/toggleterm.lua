return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = 15,
    open_mapping = [[<C-\>]], -- Mở terminal nhanh bằng Ctrl+\
    shade_filetypes = {},
    shade_terminals = false,
    shading_factor = 2,
    persist_size = true,
    direction = "horizontal", -- Mặc định mở ngang
  },
  config = function()
    require("toggleterm").setup()

    local Terminal = require("toggleterm.terminal").Terminal
    local terminals = {}

    -- Mở terminal mới (Tự động đánh ID)
    function _open_new_terminal()
      local id = #terminals + 1
      local term = Terminal:new({ id = id, direction = "horizontal" })
      term:toggle()
      terminals[id] = term
    end

    -- Phím tắt để mở terminal tự động
    vim.keymap.set("n", "<leader>tt", _open_new_terminal, { desc = "Open new terminal" })

    -- Di chuyển giữa các terminal mở
    vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Move to left window" })
    vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Move to right window" })
    vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Move to lower window" })
    vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Move to upper window" })
    local lazydocker = Terminal:new({
      cmd = "lazydocker",
      direction = "float",
      hidden = true,
      float_opts = { border = "rounded" }, -- border đẹp
    })

    vim.keymap.set("n", "<leader>dd", function()
      lazydocker:toggle()
    end, { noremap = true, silent = true, desc = "Open LazyDocker" })
    -- Đóng tất cả terminal
    function _close_all_terminals()
      for id, term in pairs(terminals) do
        term:close()
      end
      terminals = {}
    end
    vim.keymap.set("n", "<leader>tx", _close_all_terminals, { desc = "Close all terminals" })
    vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
    vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
    vim.keymap.set("t", "<C-t>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
  end,
}
