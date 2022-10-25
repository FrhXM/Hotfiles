-------------------------------------------------------
-------------------> EMMET VIM <-----------------------
-------------------------------------------------------
vim.g.user_emmet_mode='a'    -- enable all function in all mode.
vim.g.user_emmet_leader_key=','

-----------------------------------------------------
-------------------> COLORIZER <-----------------------
-----------------------------------------------------
require'colorizer'.setup()

vim.defer_fn(function()
  require("colorizer").attach_to_buffer(0)
end, 0)

-----------------------------------------------------
-------------------> TRANSPERNCY <-------------------
-----------------------------------------------------
-- Trancperncy
require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})


