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
		wk.register({
			["<leader>c"] = {
				name = "ChatGPT",
				c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
				p = { "<cmd>ChatGPTCompleteCode<CR>", "Complete Code" },
				e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
				-- All commented lines are now handled through Telescope GPT extension
				-- g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
				-- t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
				k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
				-- d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
				-- a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
				-- o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
				-- s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
				-- f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
				-- x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
				r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
				l = {
					"<cmd>ChatGPTRun code_readability_analysis<CR>",
					"Code Readability Analysis",
					mode = { "n", "v" },
				},
			},
		})
	end,
}
