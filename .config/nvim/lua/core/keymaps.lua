local fn = vim.fn

local modes = {
  normal_mode = "n",
  insert_mode = "i",
  terminal_mode = "t",
  visual_mode = "v",
  visual_block_mode = "x",
  command_mode = "c",
}

local function close()
  if vim.bo.buftype == "terminal" then
    vim.cmd [[
    Bdelete!
    silent! close
    ]]
  elseif #vim.api.nvim_list_wins() > 1 then
    vim.cmd "silent! close"
  else
    vim.notify("Can't Close Window", vim.log.levels.WARN)
  end
end

local function forward_search()
  if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
    return "<CR>/<C-r>/"
  end
  return "<C-z>"
end

local function backward_search()
  if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
    return "<CR>?<C-r>/"
  end
  return "<S-Tab>"
end

local keymaps = {
  normal_mode = {
    ["C-j"] = "<C-w>j",
    ["C-k"] = "<C-w>k",
    ["C-h"] = "<C-w>h",
    ["C-l"] = "<C-w>l",

    ["<Leader>w"] = "<C-w>w",

    [";"] = close,

    ["<C-Up>"] = ":resize +2<CR>",
    ["<C-Down>"] = ":resize -2<CR>",
    ["<C-Left>"] = ":vertical resize +2<CR>",
    ["<C-Right>"] = ":vertical resize -2<CR>",

    ["L"] = ":bnext<CR>",
    ["H"] = ":bprevious<CR>",

    ["<"] = "<<",
    [">"] = ">>",


    ["<A-j>"] = ":m .+1<CR>==",
    ["<A-k>"] = ":m .-2<CR>==",
  },
  insert_mode = {

    -- ["jk"] = "<Esc>",

    ["<A-j>"] = "<Esc>:m .+1<CR>==gi",
    ["<A-k>"] = "<Esc>:m .-2<CR>==gi",
    ["<C-S-V>"] = "<C-R>+",
  },
  terminal_mode = {

    ["<Esc>"] = "<C-\\><C-n>",
  },
  visual_mode = {

    ["p"] = '"_dP',

    -- ["jk"] = "<Esc>",

    ["<"] = "<gv",
    [">"] = ">gv",

    ["<A-j>"] = ":m '>+1<CR>gv=gv",
    ["<A-k>"] = ":m '<-2<CR>gv=gv",
  },
  visual_block_mode = {

    ["<A-j>"] = ":m '>+1<CR>gv=gv",
    ["<A-k>"] = ":m '<-2<CR>gv=gv",
  },
  command_mode = {

    ["<Tab>"] = forward_search,
    ["<S-Tab>"] = backward_search,
  },
}

set_keymaps(keymaps.normal_mode, modes.normal_mode)
set_keymaps(keymaps.insert_mode, modes.insert_mode)
set_keymaps(keymaps.terminal_mode, modes.terminal_mode)
set_keymaps(keymaps.visual_mode, modes.visual_mode)
set_keymaps(keymaps.visual_block_mode, modes.visual_block_mode)
set_keymaps(keymaps.command_mode, modes.command_mode)
