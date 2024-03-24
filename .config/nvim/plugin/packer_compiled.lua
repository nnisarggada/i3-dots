-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/nnisarggada/.cache/nvim/packer_hererocks/2.1.1702233742/share/lua/5.1/?.lua;/home/nnisarggada/.cache/nvim/packer_hererocks/2.1.1702233742/share/lua/5.1/?/init.lua;/home/nnisarggada/.cache/nvim/packer_hererocks/2.1.1702233742/lib/luarocks/rocks-5.1/?.lua;/home/nnisarggada/.cache/nvim/packer_hererocks/2.1.1702233742/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/nnisarggada/.cache/nvim/packer_hererocks/2.1.1702233742/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  Colorizer = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/Colorizer",
    url = "https://github.com/chrisbra/Colorizer"
  },
  ["Comment.nvim"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["codeium.vim"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/codeium.vim",
    url = "https://github.com/Exafunction/codeium.vim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["flutter-tools.nvim"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/flutter-tools.nvim",
    url = "https://github.com/akinsho/flutter-tools.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["highlight-undo.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19highlight-undo\frequire\0" },
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/highlight-undo.nvim",
    url = "https://github.com/tzachar/highlight-undo.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-null-ls.nvim"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/mason-null-ls.nvim",
    url = "https://github.com/jayp0521/mason-null-ls.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-silicon"] = {
    commands = { "Silicon" },
    config = { "\27LJ\2\nF\0\0\3\0\5\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2'\1\4\0\18\2\0\0&\1\2\1L\1\2\0\v/home/\n$USER\vexpand\afn\bvim'\0\0\1\0\3\0\0046\0\0\0009\0\1\0009\0\2\0L\0\2\0\rfiletype\abo\bvim|\0\0\6\0\a\0\r6\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\3\0029\2\4\0026\4\0\0009\4\3\0049\4\5\4B\4\1\0A\2\0\2'\3\6\0D\0\3\0\a:t\25nvim_get_current_buf\22nvim_buf_get_name\bapi\16fnamemodify\afn\bvimW\0\0\4\0\5\0\b'\0\0\0006\1\1\0009\1\2\1'\3\3\0B\1\2\2'\2\4\0&\0\2\0L\0\2\0\14_code.png\23!%Y-%m-%dT%H-%M-%S\tdate\aos\15./silicon_Ø\2\1\0\6\0\r\0\0193\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0\18\4\0\0B\4\1\2'\5\5\0&\4\5\4=\4\6\0033\4\a\0=\4\b\0033\4\t\0=\4\n\0033\4\v\0=\4\f\3B\1\2\1K\0\1\0\voutput\0\17window_title\0\rlanguage\0\21background_image\28/.config/silicon/bg.jpg\1\0\b\vgobble\2\17shadow_color\f#100808\20shadow_offset_y\3\b\20shadow_offset_x\3\b\23shadow_blur_radius\3\16\19no_line_number\2\ntheme\fDracula\tfont-JetBrains Mono NF=34;Noto Color Emoji=34\nsetup\fsilicon\frequire\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/opt/nvim-silicon",
    url = "https://github.com/michaelrommel/nvim-silicon"
  },
  ["nvim-transparent"] = {
    config = { "\27LJ\2\n5\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\24transparent_enabled\6g\bvim\0" },
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/nvim-transparent",
    url = "https://github.com/xiyaowong/nvim-transparent"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyodark.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\26colorscheme tokyodark\bcmd\bvim\0" },
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/tokyodark.nvim",
    url = "https://github.com/tiagovla/tokyodark.nvim"
  },
  ["typescript.nvim"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/typescript.nvim",
    url = "https://github.com/jose-elias-alvarez/typescript.nvim"
  },
  ["vim-ReplaceWithRegister"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/vim-ReplaceWithRegister",
    url = "https://github.com/inkarkat/vim-ReplaceWithRegister"
  },
  ["vim-astro"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/vim-astro",
    url = "https://github.com/wuelnerdotexe/vim-astro"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/vim-maximizer",
    url = "https://github.com/szw/vim-maximizer"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/nnisarggada/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-transparent
time([[Config for nvim-transparent]], true)
try_loadstring("\27LJ\2\n5\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\24transparent_enabled\6g\bvim\0", "config", "nvim-transparent")
time([[Config for nvim-transparent]], false)
-- Config for: highlight-undo.nvim
time([[Config for highlight-undo.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19highlight-undo\frequire\0", "config", "highlight-undo.nvim")
time([[Config for highlight-undo.nvim]], false)
-- Config for: tokyodark.nvim
time([[Config for tokyodark.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\26colorscheme tokyodark\bcmd\bvim\0", "config", "tokyodark.nvim")
time([[Config for tokyodark.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd nvim-ts-autotag ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Silicon', function(cmdargs)
          require('packer.load')({'nvim-silicon'}, { cmd = 'Silicon', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-silicon'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Silicon ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)


_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
