return {
	-- Incremental rename
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
	},

	-- Go forward/backward with square brackets
	{
		"nvim-mini/mini.bracketed",
		event = "BufReadPost",
		config = function()
			local bracketed = require("mini.bracketed")
			bracketed.setup({
				file = { suffix = "" },
				window = { suffix = "" },
				quickfix = { suffix = "" },
				yank = { suffix = "" },
				treesitter = { suffix = "n" },
			})
		end,
	},

	-- Better increase/descrease
	{
		"monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
					augend.constant.new({ elements = { "let", "const" } }),
				},
			})
		end,
	},

	-- 42 School norminette linter
	{
		"hardyrafael17/norminette42.nvim",
		config = function()
			require("norminette").setup({
				runOnSave = true,
				maxErrorsToShow = 5,
				active = true,
			})

			-- Custom commands to toggle norminette
			vim.api.nvim_create_user_command("Norm", function()
				vim.g.norminette_active = true
				vim.notify("Norminette activated", vim.log.levels.INFO)
			end, { desc = "Activate norminette linting" })

			vim.api.nvim_create_user_command("NoNorm", function()
				vim.g.norminette_active = false
				vim.notify("Norminette deactivated", vim.log.levels.INFO)
			end, { desc = "Deactivate norminette linting" })
		end,
	},

}
