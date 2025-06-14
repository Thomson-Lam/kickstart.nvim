local function ensure_blink_loaded()
  -- loads blink.cmp exactly once
  if not package.loaded['blink.cmp'] then
    require('lazy').load { plugins = { 'blink.cmp' } }
  end
  return require 'blink.cmp'
end

local function reconfigure(sources)
  local blink = ensure_blink_loaded()
  local cfg = blink.config or {} -- cfg is {} the very first time
  local new = vim.deepcopy(cfg)
  new.sources = { default = sources }
  blink.setup(new)
end
