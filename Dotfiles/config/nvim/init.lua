vim.opt.wrap = false

vim.keymap.set({'n', 'i'}, '<Select>', '<End>')
vim.keymap.set({'n', 'i'}, '<Find>', '<Home>')

-- ===============================
-- Packeador de plugins
-- ===============================
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  -- Gestión de iconos
  use 'kyazdani42/nvim-web-devicons'
  
  -- Explorador de archivos tipo VS Code
  use 'nvim-tree/nvim-tree.lua'

  -- Terminal integrada
  use 'voldikss/vim-floaterm'

  -- Barra de estado
  use 'nvim-lualine/lualine.nvim'

  -- Temas
  use 'gruvbox-community/gruvbox'

  -- Autocompletado
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'

  -- LSP (lenguaje inteligente)
  use 'neovim/nvim-lspconfig'

  -- Búsqueda fuzzy
  use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
end)


-- ===============================
-- 2️⃣ Explorador lateral
-- ===============================
require('nvim-tree').setup {
  view = { width = 30, side = 'left' },
  renderer = {
    icons = { show = { git = true, folder = true, file = true } }
  }
}

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap=true, silent=true})


-- ===============================
-- 3️⃣ Terminal integrada
-- ===============================
vim.api.nvim_set_keymap('n', '<leader>t', ':FloatermToggle<CR>', {noremap=true, silent=true})


-- ===============================
-- 4️⃣ Barra de estado y tema
-- ===============================
require('lualine').setup{
  options = { theme = 'gruvbox' }
}

vim.cmd[[colorscheme gruvbox]]
vim.o.termguicolors = true


-- ===============================
-- 5️⃣ Autocompletado + LSP
-- ===============================
local cmp = require'cmp'
cmp.setup {
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true })
  },
  sources = {
    { name = 'nvim_lsp' }
  }
}

-- Ejemplo: Python LSP
vim.lsp.start({
  name = "pyright",
  cmd = {"pyright-langserver", "--stdio"},
})


-- ===============================
-- 6️⃣ Búsqueda fuzzy
-- ===============================
local telescope = require('telescope.builtin')
vim.api.nvim_set_keymap('n', '<leader>ff', ":Telescope find_files<CR>", {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fg', ":Telescope live_grep<CR>", {noremap=true})



