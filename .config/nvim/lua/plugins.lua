local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  if vim.fn.input("Install packer.nvim? (y for yes)") ~= "y" then
    return
  end

  local directory = string.format('%s/site/pack/packer/opt/', vim.fn.stdpath('data'))

  vim.fn.mkdir(directory, 'p')

  local git_clone_cmd = vim.fn.system(string.format(
  'git clone %s %s',
  'https://github.com/wbthomason/packer.nvim',
  directory .. '/packer.nvim'
  ))

  print(git_clone_cmd)
  print("Installing packer.nvim...")

  return
end

return require('packer').startup(function()

  use {
    'akinsho/nvim-bufferline.lua',
    event = 'VimEnter *',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require('bufferline').setup{
        options = {
          show_buffer_close_icons = false,
          separator_style = "thick",
          mappings = false,
        }
      }
    end
  }

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    event = 'VimEnter *',
    config = function()
      require('lualine').setup{
        options = {
          theme = require('helpers').getLualineTheme(),
          icons_enabled = true,
          -- section_separators = nil, component_separators = nil
          component_separators = {'', ''},
          section_separators = {'', ''}
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },
          lualine_c = { 'filename', 'diff', 'g:coc_status' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {  },
          lualine_b = { 'branch' },
          lualine_c = { 'filename' },
          lualine_x = {  },
          lualine_y = {  },
          lualine_z = { 'location' }
        },
        extensions = { 'fzf' }
      }
    end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    event = 'VimEnter *',
    config = function()
      require('colorizer').setup()
    end
  }

  use {
    'jiangmiao/auto-pairs',
    event = 'VimEnter *'
  }

  use {
    'junegunn/fzf.vim',
    event = 'VimEnter *',
    config = function()
      vim.g.fzf_layout = {
        ['window'] = {
          ['width'] = 0.9,
          ['height'] = 0.9,
          ['border'] = 'rounded',
          ['highlight'] = 'Directory'
        }
      }

      vim.g.fzf_buffers_jump = 1

      vim.g.fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

      vim.g.fzf_commands_expect = 'alt-enter,ctrl-x'

      vim.g.fzf_action = {
        ['ctrl-x'] = 'split',
        ['ctrl-v'] = 'vsplit'
      }
      vim.g.fzf_preview_window = 'right:50%'

      vim.cmd([[packadd cfilter]])

    end
  }

  use {
    'machakann/vim-sandwich',
    event = 'VimEnter *',
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    opt = true,
    cmd = 'NvimTreeToggle',
    config = function()
      vim.g["nvim_tree_indent_markers"] = 1
      vim.g["nvim_tree_follow"] = 1
      vim.g["nvim_tree_auto_close"] = 1
      vim.g["nvim_tree_width_allow_resize"] = 1
      vim.g["nvim_tree_side"] = "left"
    end
  }

  use {
    'neoclide/coc.nvim',
    branch = 'release',
    event = 'VimEnter *',
    config = function()
      vim.g.coc_global_extensions = {
        'coc-css',
        'coc-docker',
        'coc-elixir',
        -- 'coc-emmet',
        'coc-eslint',
        'coc-html',
        'coc-json',
        'coc-markdownlint',
        'coc-prettier',
        'coc-python',
        'coc-sh',
        'coc-snippets',
        'coc-tsserver',
        'coc-yaml',
      }
    end
  }

  use {
    'tpope/vim-commentary',
    event = 'VimEnter *',
  }

  use {
    'mhinz/vim-signify',
    event = 'VimEnter *',
    config = function()
      vim.g.signify_sign_add = '│'
      vim.g.signify_sign_change = '│'
      vim.g.signify_sign_delete = '_'
    end
  }

  use {
    'rrethy/vim-illuminate',
    event = 'VimEnter *',
    config = function()
      vim.g.Illuminate_delay = 500
      vim.g.Illuminate_highlightUnderCursor = 1
      vim.g.Illuminate_ftblacklist = {'NvimTree'}
    end
  }

  use {
    'mg979/vim-visual-multi',
    branch = 'master',
    event = 'VimEnter *',
  }

  -- use {
  --   'nvim-treesitter/nvim-treesitter',
  --   run = ':TSUpdate',
  --   event = 'VimEnter *',
  --   config = function()
  --     require('nvim-treesitter.configs').setup {
  --       ensure_installed = "all",
  --       highlight = {
  --         enable = true
  --       },
  --       indent = {
  --         enable = false,
  --       }
  --     }
  --   end
  -- }
  use {
    'sheerun/vim-polyglot',
    event = 'VimEnter *',
  }

  use {
    'wbthomason/packer.nvim',
    opt = true
  }

  use {
    'rhysd/git-messenger.vim',
    opt = true,
    cmd = 'GitMessenger'
  }

  use {
    'styled-components/vim-styled-components',
    branch = 'main',
    opt = true,
    ft = {'javascript', 'typescript', 'javascriptreact'},
  }

  use {
    'justinmk/vim-sneak',
    event = 'VimEnter *',
    -- config = function()
    --   vim.g["sneak#use_ic_scs"] = 1
    --   vim.g["sneak#target_labels"] = "asdfjkl;ghqweruioptyzxcvnmb"
    -- end
  }

    use {
      'iamcco/markdown-preview.nvim',
      opt = true,
      ft = {'markdown'},
      run = 'cd app && yarn install',
      cmd = 'MarkdownPreview'
    }

  -- use {
  --   'elixir-editors/vim-elixir',
  --   opt = true,
  --   event = 'VimEnter *'
  -- }

  -- use {
  --   'dag/vim-fish',
  --   opt = true,
  --   event = 'VimEnter *',
  --   -- ft = {'fish'}
  -- }

  -- use {
  --   'jxnblk/vim-mdx-js',
  --   opt = true,
  --   ft = {'mdx'}
  -- }

  use {
    'mcchrish/nnn.vim',
    opt = true,
    cmd = 'NnnPicker'
  }

end)

