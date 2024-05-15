local M = {}

M.organize_imports = function()
  if
    vim.bo.filetype == "typescriptreact"
    or vim.bo.filetype == "javascriptreact"
  then
    local params = {
      command = "_typescript.organizeImports",
      arguments = { vim.api.nvim_buf_get_name(0) },
      title = "Organize Imports",
    }
    vim.lsp.buf.execute_command(params)
    vim.print("Fix imports")
  end
end

M.no_preview = function()
  return require("telescope.themes").get_dropdown({
    hidden = true,
    borderchars = {
      { "", "", "", "", "", "", "", "" },
      prompt = { "", "", "", "", "", "", "", "" },
      results = { "", "", "", "", "", "", "", "" },
      preview = { "", "", "", "", "", "", "", "" },
    },
    width = 0.8,
    previewer = false,
    prompt_title = false,
  })
end

return M
