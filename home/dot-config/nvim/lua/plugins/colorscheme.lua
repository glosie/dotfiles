-- Neovim reads the terminal background color (OSC 11) and keeps `background` in
-- sync with it, so following the system theme means following that option.
local schemes = { light = "onelight", dark = "catppuccin-frappe" }

local function apply()
  local scheme = schemes[vim.o.background] or schemes.dark
  if vim.g.colors_name ~= scheme then
    vim.cmd.colorscheme(scheme)
  end
end

vim.api.nvim_create_autocmd("OptionSet", {
  group = vim.api.nvim_create_augroup("colorscheme_follows_background", { clear = true }),
  pattern = "background",
  callback = apply,
})

return {
  { "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
  { "olimorris/onedarkpro.nvim", lazy = false, priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = apply,
    },
  },
}
