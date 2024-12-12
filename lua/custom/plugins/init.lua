-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'christoomey/vim-tmux-navigator',
  'tpope/vim-unimpaired',
  {
    'tpope/vim-fugitive',
    init = function()
      vim.keymap.set('n', 'gs', vim.cmd.Git, { desc = '[G]it [S]tatus' })
      vim.keymap.set('n', 'gp', ':Git push<cr>', { desc = '[G]it [P]push' })
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'arkav/lualine-lsp-progress' },
    init = function()
      local lualine = require 'lualine'
      lualine.setup {
        options = {
          theme = 'auto',
          icons_enabled = false,
          section_separators = { left = '', right = '' },
          component_seperators = { left = '', right = '' },
          disabled_filetypes = { 'neo-tree', 'TelescopePrompt' },
        },
        winbar = {
          lualine_c = {
            {
              'filename',
              path = 1,
            },
          },
        },
        sections = {
          lualine_a = { 'branch' },
          lualine_b = {
            {
              'buffers',
              show_filename_only = false,
              mode = 2,
              symbols = {
                modified = ' ●',
                alternate_file = '',
                directory = '',
              },
              buffers_color = {
                -- Same values as the general color option can be used here.
                active = 'NormalFloat', -- Color for active buffer.
              },
            },
          },
          lualine_c = {},
          lualine_x = { 'lsp_progress' },
          lualine_y = {
            {
              'diagnostics',
              sources = { 'nvim_diagnostic' },
              symbols = {
                error = ' ',
                warn = ' ',
                info = 'i',
                hint = ' ',
              },
            },
          },
          lualine_z = { 'progress' },
        },
      }
    end,
  },
  {
    'geg2102/nvim-python-repl',
    dependencies = 'nvim-treesitter',
    ft = { 'python', 'lua', 'scala' },
    config = function()
      require('nvim-python-repl').setup {
        execute_on_send = true,
        vsplit = true,
      }
      -- vim.keymap.set("n", [your keymap], function() require('nvim-python-repl').send_statement_definition() end, { desc = "Send semantic unit to REPL"})

      vim.keymap.set('v', '<leader>x', function()
        require('nvim-python-repl').send_visual_to_repl()
      end, { desc = 'Send visual selection to REPL' })

      vim.keymap.set('n', '<leader>xx', function()
        require('nvim-python-repl').send_buffer_to_repl()
      end, { desc = 'Send entire buffer to REPL' })

      -- vim.keymap.set("n", [your keymap], function() require('nvim-python-repl').toggle_execute() end, { desc = "Automatically execute command in REPL after sent"})

      vim.keymap.set('n', '<leader>xv', function()
        require('nvim-python-repl').toggle_vertical()
      end, { desc = 'Create REPL in vertical or horizontal split' })

      -- vim.keymap.set("n", [your keymap], function() require('nvim-python-repl').open_repl() end, { desc = "Opens the REPL in a window split"})
    end,
  },
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = false,
    opts = {
      -- add any opts here
    },
    build = ':AvanteBuild', -- This is optional, recommended tho. Also note that this will block the startup for a bit since we are compiling bindings in Rust.
    dependencies = {
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
      'zbirenbaum/copilot.lua', -- for providers='copilot'
      {
        -- support for image pasting
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to setup it properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },
}
