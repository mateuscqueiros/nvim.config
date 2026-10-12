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
    local client = vim.lsp.get_clients({ bufnr = 0, name = "ts_ls" })[1]
    if not client then
      return vim.notify("ts_ls not attached", vim.log.levels.WARN)
    end
    client:exec_cmd(params)
    vim.print("Fix imports")
  end
end

M.merge = function(...)
  local result = {}
  for _, t in ipairs({ ... }) do
    for k, v in pairs(t) do
      result[k] = v
    end
    local mt = getmetatable(t)
    if mt then
      setmetatable(result, mt)
    end
  end
  return result
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

M.colorscheme = function()
  return { enable_preview = true }
end

return M
