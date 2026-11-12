--
-- copilot.lua
-- https://github.com/zbirenbaum/copilot.lua
--

return {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    opts = {
        copilot_node_command = vim.fn.system('which node'):gsub('%s+$', ''),
    },
  }