-- Variable
local keymap = vim.keymap.set

-- Telescope
keymap('n', '<Leader>f', '<cmd> Telescope find_files<cr>' )
keymap('n', '<Leader>o', '<cmd> Telescope oldfiles <cr>')
keymap('n', '<Leader>s', '<cmd> Telescope live_grep <cr>')

-- Bufferline bindings
keymap('n', 'f',        '<cmd> BufferLinePick <cr>')
keymap('n', 'F',        '<cmd> BufferLinePickClose <cr>')
keymap('n', '<TAB>',    '<cmd> BufferLineCycleNext <cr>')
keymap('n', '<S-TAB>',  '<cmd> BufferLineCyclePrev <cr>')
keymap('n', 'm.',       '<cmd> BufferLineMoveNext <cr>')
keymap('n', 'm,',       '<cmd> BufferLineMovePrev <cr>')

-- Other bindings 
keymap('n', '<F7>',            '<cmd> NvimTreeToggle <cr>')
keymap('n', '<Leader>cc',      '<cmd> ColorizerToggle <cr>')
keymap('n', '<Leader>n',       '<cmd> enew <cr>')
keymap('n', '<Leader>h',       '<cmd> noh <cr>')
keymap('n', '[[',              '<cmd> vertical resize +7 <cr>')
keymap('n', ']]',              '<cmd> vertical resize -7 <cr>')
keymap('n', '<Leader>x',       '<cmd> e ~/.config/xmonad/xmonad.hs<cr>')
