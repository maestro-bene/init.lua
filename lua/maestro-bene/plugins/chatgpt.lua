return {
	"jackMort/ChatGPT.nvim",
	-- "maestro-bene/Mistral.nvim",
	enabled = true,
	lazy = true,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"folke/trouble.nvim",
	},
	cmd = {
		"ChatGPT",
		"ChatGPTActAs",
		"ChatGPTCompleteCode",
		"ChatGPTEditWithInstructions",
		"ChatGPTRun",
	},

	config = function()
		local handle = io.popen("/users/maestro-bene/.config/get-op-api-key.sh")
		local result = handle:read("*a") -- Read the entire output
		handle:close()

		-- Throw an exception if stdout is blank
		if result == "" then
			error("The stdout is blank!")
		end

		require("chatgpt").setup({
			api_key_cmd = "/users/maestro-bene/.config/get-op-api-key.sh",
			-- api_key_cmd = "/users/maestro-bene/.config/get-mistral-api-key.sh",
		})
	end,

	keys = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>c", group = "ChatGPT" },
			{ "<leader>cc", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
			{ "<leader>cp", "<cmd>ChatGPTCompleteCode<CR>", desc = "Complete Code" },
			{
				mode = { "n", "v" },
				{ "<leader>ce", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction" },
				{ "<leader>ck", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords" },
				{
					"<leader>cl",
					"<cmd>ChatGPTRun code_readability_analysis<CR>",
					desc = "Code Readability Analysis",
				},
				{ "<leader>cr", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit" },
				-- { "<leader>cg", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
				-- { "<leader>ct", "<cmd>ChatGPTRun translate<CR>", desc = "Translate" },
				-- { "<leader>cd", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring" },
				-- { "<leader>ca", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests" },
				-- { "<leader>co", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
				-- { "<leader>cs", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize" },
				-- { "<leader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
				-- { "<leader>cx", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code" },
			},
		})
	end,
}
