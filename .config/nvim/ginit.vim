lua << EOF

-------------
-- Nvim-qt --
-------------

if vim.g.GuiLoaded then
  local font_name = "JetBrainsMono NF"
  local font_size = 11
  local not_transparent = false

  local function toggleTransparency()
    not_transparent = not not_transparent
    if not_transparent then
      vim.cmd("GuiWindowOpacity " .. (0.9))
    else
      vim.cmd("GuiWindowOpacity " .. (1.0))
    end
  end

  vim.keymap.set("n", "<F10>", toggleTransparency, { silent = true })

  local function toggleFullscreen()
    if vim.g.GuiWindowFullScreen == 0 then
      vim.cmd("call GuiWindowFullScreen(" .. 1 .. ")")
    else
      vim.cmd("call GuiWindowFullScreen(" .. 0 .. ")")
    end
  end

  vim.keymap.set("n", "<F11>", toggleFullscreen, { silent = true })

  vim.cmd [[
  GuiTabline 0
  GuiPopupmenu 0
  ]]
  vim.cmd("GuiFont! " .. font_name .. ":h" .. font_size)
end

-------------
-- Neovide --
-------------
vim.cmd[[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]

if vim.g.neovide then
  vim.opt.guifont = "JetBrainsMono NF:h11"
  vim.cmd "let g:neovide_transparency=0.85"
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_vfx_opacity = 200.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 2.0
  vim.g.neovide_cursor_vfx_particle_density = 10.0
  vim.g.neovide_cursor_vfx_particle_speed = 20.0
  vim.g.neovide_cursor_vfx_particle_phase = 2.5
  vim.g.neovide_cursor_vfx_particle_curl = 0.5
  vim.g.neovide_cursor_antialiasing = true

  local function toggleTransparency()
    if vim.g.neovide_transparency == 1.0 then
      vim.cmd "let g:neovide_transparency=0.85"
    else
      vim.cmd "let g:neovide_transparency=1.0"
    end
  end

  local function toggleFullscreen()
    if vim.g.neovide_fullscreen == false then
      vim.cmd "let g:neovide_fullscreen=v:true"
    else
      vim.cmd "let g:neovide_fullscreen=v:false"
    end
  end

  vim.keymap.set("n", "<F11>", toggleFullscreen, { silent = true })
  vim.keymap.set("n", "<F10>", toggleTransparency, { silent = true })
end

EOF
