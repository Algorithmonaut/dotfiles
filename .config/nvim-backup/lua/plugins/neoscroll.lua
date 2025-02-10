return {
	"karb94/neoscroll.nvim",
	config = function()
		require("neoscroll").setup({
			mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },

			easing_function = nil, -- Default easing function
			stop_eof = true,
		})

		local keymap = {
			["<C-u>"] = function()
				require("neoscroll").ctrl_u({ duration = 120 })
			end,
			["<C-d>"] = function()
				require("neoscroll").ctrl_d({ duration = 120 })
			end,
			["<C-b>"] = function()
				require("neoscroll").ctrl_b({ duration = 120 })
			end,
			["<C-f>"] = function()
				require("neoscroll").ctrl_f({ duration = 120 })
			end,
			["zt"] = function()
				require("neoscroll").zt({ half_win_duration = 150 })
			end,
			["zz"] = function()
				require("neoscroll").zz({ half_win_duration = 150 })
			end,
			["zb"] = function()
				require("neoscroll").zb({ half_win_duration = 150 })
			end,
		}

		local modes = { "n", "v", "x" }
		for key, func in pairs(keymap) do
			vim.keymap.set(modes, key, func)
		end
	end,
}
