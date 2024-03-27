return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local keymap = vim.keymap -- for conciseness
		local harpoon = require("harpoon")

		harpoon:setup()

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		vim.keymap.set("n", "<leader>ht", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })

		keymap.set("n", "<leader>hm", function()
			harpoon:list():append()
		end, { desc = "Mark file with harpoon" })

		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end, { desc = "Go to previous Harpoon entry" })
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, { desc = "Go to next Harpoon entry" })
		keymap.set("n", "<leader>hl", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "List Harpoon entries" })
		keymap.set("n", "<leader>j", function()
			harpoon:list():select(1)
		end, { desc = "Follow Harpoon 1" })
		keymap.set("n", "<leader>k", function()
			harpoon:list():select(2)
		end, { desc = "Follow Harpoon 2" })
		keymap.set("n", "<leader>l", function()
			harpoon:list():select(3)
		end, { desc = "Follow Harpoon 3" })
		keymap.set("n", "<leader>m", function()
			harpoon:list():select(4)
		end, { desc = "Follow Harpoon 4" })
	end,
}
