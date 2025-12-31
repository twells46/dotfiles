vim.api.nvim_create_autocmd('BufWritePost', {
  callback = function()
    local out_lines = vim.fn.systemlist(vim.fn.expandcmd 'compiler %:p')
    vim.fn.setqflist({}, 'r', { title = 'lowdown', lines = out_lines })
  end,
})
