vim.api.nvim_create_autocmd("FileType", {
  pattern = "jjdescription",
  callback = function()
    vim.opt_local.smartindent = false
  end,
})
