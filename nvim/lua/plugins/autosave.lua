return {
  "pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = true,
      execution_message = {
        message = function()
          return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
        end,
      },
      trigger_events = { "InsertLeave", "TextChanged" }, -- khi nào thì save
      conditions = {
        exists = true,
        modifiable = true,
      },
      write_all_buffers = false,
      debounce_delay = 135, -- delay trước khi save
    })
  end,
}
