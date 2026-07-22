-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

local function copy_path(state)
	-- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
	-- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
	local node = state.tree:get_node()
	local filepath = node:get_id()
	local filename = node.name
	local modify = vim.fn.fnamemodify

	local results = {
		filepath,
		modify(filepath, ":."),
		modify(filepath, ":~"),
		filename,
		modify(filename, ":r"),
		modify(filename, ":e"),
	}

	vim.ui.select({
		"1. Absolute path: " .. results[1],
		"2. Path relative to CWD: " .. results[2],
		"3. Path relative to HOME: " .. results[3],
		"4. Filename: " .. results[4],
		"5. Filename without extension: " .. results[5],
		"6. Extension of the filename: " .. results[6],
	}, { prompt = "Choose to copy to clipboard:" }, function(choice)
		if choice then
			local i = tonumber(choice:sub(1, 1))
			if i then
				local result = results[i]
				vim.fn.setreg('"', result)
				vim.notify("Copied: " .. result)
			else
				vim.notify("Invalid selection")
			end
		else
			vim.notify("Selection cancelled")
		end
	end)
end

return {
  'nvim-neo-tree/neo-tree.nvim',
  lazy = false,
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    {
      's1n7ax/nvim-window-picker', -- for open_with_window_picker keymaps
      version = '2.*',
      event = 'VeryLazy',
      config = function()
        require('window-picker').setup {
          hint = 'floating-big-letter',
          filter_rules = {
            include_current_win = false,
            -- filter using buffer options
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },

              -- if the buffer type is one of following, the window will be ignored
              buftype = { 'terminal', 'quickfix' },
            },
          },
        }
      end,
    },
  },
  cmd = 'Neotree',
  keys = {
    { '<C-n>', ':Neotree toggle<CR>', desc = 'NeoTree toggle', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['<C-n>'] = 'close_window',
          ['<C-s>'] = 'open_split',
          ['<C-v>'] = 'open_vsplit',
          ['O'] = 'open_with_window_picker',
          ['/'] = 'noop',
          ['Y'] = copy_path,
        },
      },
      hijack_netrw_behavior = 'open_current',
    },
  },
}
