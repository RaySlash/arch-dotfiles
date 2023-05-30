-- Startup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Lazy Plugin manager
local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  vim.opt.rtp:prepend(lazy.path)
  require('lazy').setup(plugins, opts)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.setup({
	{'folke/tokyonight.nvim'},
	{'nvim-lualine/lualine.nvim'},
	{'lukas-reineke/indent-blankline.nvim'},
	{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
	{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
	{'nvim-treesitter/nvim-treesitter-textobjects', after = "nvim-treesitter", requires = "nvim-treesitter/nvim-treesitter"},
	{'numToStr/Comment.nvim'},
	{'nvim-tree/nvim-tree.lua', version = "*", dependencies = {'nvim-tree/nvim-web-devicons'}},
    {'nvim-telescope/telescope.nvim', tag = '0.1.1', dependencies = {'nvim-lua/plenary.nvim'}},
	{'nvim-telescope/telescope-fzf-native.nvim'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/nvim-cmp'},
	{'hrsh7th/cmp-buffer'},
	{'hrsh7th/cmp-path'},
	{'saadparwaiz1/cmp_luasnip'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'L3MON4D3/LuaSnip'},
	{'rafamadriz/friendly-snippets'},
	{'aurum77/live-server.nvim',
		run = function()
			require"live_server.util".install()
		end,
		cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" }
	},
})

-- ColorScheme
vim.opt.termguicolors = true
vim.cmd [[colorscheme tokyonight-night]]

-- Commands
vim.g.mapleader = ' '
vim.opt.rnu = true
vim.opt.background = 'dark'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Key-Bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>f', '<cmd>NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>')
vim.keymap.set({'n', 'x'}, 'cp', '"+y')
vim.keymap.set({'n', 'x'}, 'cv', '"+p')
vim.keymap.set({'n', 'x'}, 'x', '_x')
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

-- Start plugins and configs
require('lualine').setup({
	options = {
		theme = 'tokyonight-night',
		globalstatus = true,
	},
})

require('bufferline').setup({})

require('Comment').setup({})

require("nvim-tree").setup({})

require'lspconfig'.pyright.setup({})

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "html", "css", "javascript" },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    additional_vim_regex_highlighting = false,
  },
}
