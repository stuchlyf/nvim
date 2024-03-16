-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_exec("language en_US", true)

local function windows_shell()
  -- Setting shell command flags
  vim.o.shellcmdflag =
    "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"

  -- Setting shell redirection
  vim.o.shellredir = '2>&1 | %{ "$_" } | Out-File %s; exit $LastExitCode'

  -- Setting shell pipe
  vim.o.shellpipe = '2>&1 | %{ "$_" } | Tee-Object %s; exit $LastExitCode'

  -- Setting shell quote options
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end

-- Check if 'pwsh' is executable and set the shell accordingly
if vim.fn.executable("fish") == 1 then
  vim.o.shell = "fish"
elseif vim.fn.executable("pwsh") == 1 then
  vim.o.shell = "pwsh"
  windows_shell()
else
  vim.o.shell = "powershell"
  windows_shell()
end
