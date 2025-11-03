return {
	-- messages, cmdline and the popupmenu
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
				opts = {
					buf_options = {},
					position = {
						row = 5,
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
					},
					border = {
						style = "rounded",
					},
				},
			},
			routes = {
				{
					filter = {
						event = "notify",
						find = "No information available",
					},
					opts = { skip = true },
				},
			},
			presets = {
				bottom_search = false,
				command_palette = false,
				long_message_to_split = false,
				inc_rename = false,
				lsp_doc_border = true,
			},
		},
	},

	{
		"rcarriga/nvim-notify",
		enabled = false,
	},

	{
		"snacks.nvim",
		opts = {
			scroll = { enabled = false },
		},
		keys = {},
	},

	-- buffer line
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		},
		opts = {
			options = {
				mode = "tabs",
				-- separator_style = "slant",
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		},
	},

	-- filename
	{
		"b0o/incline.nvim",
		event = "BufReadPre",
		priority = 1200,
		config = function()
			require("incline").setup({
				window = { margin = { vertical = 0, horizontal = 1 } },
				hide = {
					cursorline = true,
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if vim.bo[props.buf].modified then
						filename = "[+] " .. filename
					end

					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { " " }, { filename } }
				end,
			})
		end,
	},

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		opts = function(_, opts)
			local LazyVim = require("lazyvim.util")
			opts.sections.lualine_c[4] = {
				LazyVim.lualine.pretty_path({
					length = 0,
					relative = "cwd",
					modified_hl = "MatchParen",
					directory_hl = "",
					filename_hl = "Bold",
					modified_sign = "",
					readonly_icon = " 󰌾 ",
				}),
			}
		end,
	},

	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			plugins = {
				gitsigns = true,
				tmux = true,
				kitty = { enabled = false, font = "+2" },
			},
		},
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
	},

	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			attach_navic = false,
			create_autocmd = false,
			include_buftypes = { "" },
			exclude_filetypes = { "netrw", "toggleterm" },
			modifiers = {
				dirname = ":~:.",
				basename = ":t",
			},
			show_dirname = true,
			show_basename = true,
			show_modified = false,
			modified = function(bufnr)
				return vim.bo[bufnr].modified
			end,
			show_navic = true,
			lead_custom_section = function()
				return " "
			end,
			custom_section = function()
				return " "
			end,
			theme = "auto",
			context_follow_icon_color = false,
			symbols = {
				modified = "●",
				ellipsis = "…",
				separator = "",
			},
			kinds = {
				File = "",
				Module = "",
				Namespace = "",
				Package = "",
				Class = "",
				Method = "",
				Property = "",
				Field = "",
				Constructor = "",
				Enum = "",
				Interface = "",
				Function = "",
				Variable = "",
				Constant = "",
				String = "",
				Number = "",
				Boolean = "",
				Array = "",
				Object = "",
				Key = "",
				Null = "",
				EnumMember = "",
				Struct = "",
				Event = "",
				Operator = "",
				TypeParameter = "",
			},
		},
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		enabled = false,
	},

	{
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				preset = {
					header = [[
	        ██████╗ ███████╗██╗   ██╗ █████╗ ███████╗██╗     ██╗███████╗███████╗
	        ██╔══██╗██╔════╝██║   ██║██╔══██╗██╔════╝██║     ██║██╔════╝██╔════╝
	        ██║  ██║█████╗  ██║   ██║███████║███████╗██║     ██║█████╗  █████╗
	        ██║  ██║██╔══╝  ╚██╗ ██╔╝██╔══██║╚════██║██║     ██║██╔══╝  ██╔══╝
	        ██████╔╝███████╗ ╚████╔╝ ██║  ██║███████║███████╗██║██║     ███████╗
	        ╚═════╝ ╚══════╝  ╚═══╝  ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚═╝     ╚══════╝
   ]],
				},
			},
		},
	},

	-- themes
	{
		"Mofiqul/adwaita.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"savq/melange-nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"maxmx03/solarized.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"RostislavArts/naysayer.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"srcery-colors/srcery-vim",
		lazy = false,
		priority = 1000,
	},
	{
		"Abstract-IDE/Abstract-cs",
		lazy = false,
		priority = 1000,
	},
	{
		"wincent/base16-nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"jwbaldwin/oscura.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"wesgibbs/vim-irblack",
		lazy = false,
		priority = 1000,
	},
	{
		"dasch/satellite",
		lazy = false,
		priority = 1000,
	},

	-- theme switcher
	{
		"zaldih/themery.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("themery").setup({
				themes = {
					"solarized-osaka",
					"adwaita",
					"melange",
					"gruvbox",
					"solarized",
					"naysayer",
					"srcery",
					"abstract",
					"base16",
					"oscura",
					"irblack",
					"satellite",
				},
				livePreview = true,
			})
		end,
		keys = {
			{ "<leader>tt", "<cmd>Themery<cr>", desc = "Theme switcher" },
		},
	},
}
