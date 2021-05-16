local ui = {}
local conf = require('modules.ui.config')

ui['lewis6991/gitsigns.nvim'] = {
  event = {'BufRead','BufNewFile'},
  config = conf.gitsigns,
  requires = {'nvim-lua/plenary.nvim',opt=true}
}

ui["lukas-reineke/indent-blankline.nvim"] = {
  branch = 'lua',
  event = 'BufRead',
  setup = conf.indentBlankLine,
}

ui['~/.config/midnight-owl.nvim'] = {
  event = 'VimEnter',
  config = conf.midnightOwl,
}

ui["akinsho/nvim-bufferline.lua"] = {
  after = 'midnight-owl.nvim',
  config = conf.bufferline,
  requires = {'kyazdani42/nvim-web-devicons',opt=true}
}

ui["hoob3rt/lualine.nvim"] = {
  after = 'midnight-owl.nvim',
  config = conf.lualine,
  requires = {'kyazdani42/nvim-web-devicons',opt=true}
}

ui["norcalli/nvim-colorizer.lua"] = {
  after = 'midnight-owl.nvim',
  config = conf.colorizer,
}

ui['kyazdani42/nvim-tree.lua'] = {
  cmd = {'NvimTreeToggle','NvimTreeOpen'},
  config = conf.tree,
  requires = {'kyazdani42/nvim-web-devicons',opt=true}
}

ui["rrethy/vim-illuminate"] = {
  after = 'midnight-owl.nvim',
  setup = conf.illuminate,
}

return ui
