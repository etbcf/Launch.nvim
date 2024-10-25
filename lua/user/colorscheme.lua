local M = {
  "folke/tokyonight.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  local colorscheme_gnome = "tokyonight-night"
  local colorscheme_tilix = "tokyonight-storm"

  -- Check if Tilix-specific environment variable is present
  local is_tilix = vim.env.TILIX_ID ~= nil
  local desktop_env = vim.env.XDG_CURRENT_DESKTOP or ""

  -- Apply the appropriate colorscheme
  if is_tilix then
    vim.cmd("colorscheme " .. colorscheme_tilix)
  elseif desktop_env:match("GNOME") then
    vim.cmd("colorscheme " .. colorscheme_gnome)
  else
    -- Fallback if neither Tilix nor GNOME is detected
    vim.cmd("colorscheme " .. colorscheme_gnome)
  end
end

return M
