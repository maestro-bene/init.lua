return {
	-- "jackMort/ChatGPT.nvim",
	"maestro-bene/Mistral.nvim",
	enabled = true,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	cmd = {
		"ChatGPT",
		"ChatGPTActAs",
		"ChatGPTCompleteCode",
		"ChatGPTEditWithInstructions",
		"ChatGPTRun",
	},

	config = function()
		require("chatgpt").setup({
			api_key_cmd = "/users/maestro-bene/.config/get-mistral-api-key.sh",
		})
	end,

	keys = function()
		local chatgpt = require("chatgpt")
		local wk = require("which-key")

		wk.register({
			aa = {
				function()
					chatgpt.edit_with_instructions()
				end,
				"Edit with instructions",
			},
		}, {
			prefix = "<leader>",
			mode = "v",
		})

		wk.register({
			ac = {
				function()
					chatgpt.complete_code()
				end,
				"Complete Code",
			},
		}, {
			prefix = "<leader>",
			mode = "v",
		})
		return {
			{ "<leader>aa", "<cmd>ChatGPT<cr>", desc = "ChatGPT" },
			{ "<leader>ac", "<cmd>ChatGPTCompleteCode<cr>", desc = "ChatGPTCompleteCode" },
		}
	end,
}
