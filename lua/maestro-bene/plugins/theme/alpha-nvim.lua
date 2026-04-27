return {
	"goolord/alpha-nvim",
	config = function()
		local theme = require("alpha.themes.dashboard")
		theme.section.header.val = {
			[[      ::::    ::: :::::::::: ::::::::  :::     ::: ::::::::::: ::::    ::::       ]],
			[[      :+:+:   :+: :+:       :+:    :+: :+:     :+:     :+:     +:+:+: :+:+:+      ]],
			[[      :+:+:+  +:+ +:+       +:+    +:+ +:+     +:+     +:+     +:+ +:+:+ +:+      ]],
			[[      +#+ +:+ +#+ +#++:++#  +#+    +:+ +#+     +:+     +#+     +#+  +:+  +#+      ]],
			[[      +#+  +#+#+# +#+       +#+    +#+  +#+   +#+      +#+     +#+       +#+      ]],
			[[      #+#   #+#+# #+#       #+#    #+#   #+#+#+#       #+#     #+#       #+#      ]],
			[[      ###    #### ########## ########      ###     ########### ###       ###      ]],
			[[                                                                                  ]],
			[[                                                                                  ]],
			[[   .-''-.                      .--.  .-. .--------.                      .-''-.   ]],
			[[  /      `'''--..              ||  \/  ||'=====. ||              ..--'''`      \  ]],
			[[ |               '.            || .  . ||  .---' ||            .'               | ]],
			[[ |           ..''` '---.       || |\/|_||  '===. ||       .---' `''..           | ]],
			[[ |        .``           ''''\  ||_|\/|.'       |_||  /''''           ``.        | ]],
			[[ /'..   /`              /    /'|_.'            '._|'\    \              `\   ..'\ ]],
			[[ |   `:'         ___..  \   /  /                  \  \   /  ..___         ':`   | ]],
			[[ '____'__...---'':::::\  '-' ./                    \. '-'  \:::::''---...__'____' ]],
			[[   \::/\ \:::::::::::':  ___/                        \___  :':::::::::::/ /\::/   ]],
			[[    \'| \ '-:::--'`  .' /                                \ '.  `'--:::-' / |'/    ]],
			[[    /'|  \    ....''`__/                                  \__`''....    /  |'\    ]],
			[[    \ |   .   |  .-'`   .------. .------..------. .-. .--.   `'-.  |   .   | /    ]],
			[[     \/::.'   |  |      ||  _   V   _   ||   _   V  \/  ||      |  |   '.::\/     ]],
			[[     \':'_.---|  |      || | |  |  | |  ||  | |  | .  . ||      |  |---._':'/     ]],
			[[      \\      |  |      || | |  |   '|  ||  |'   | |\/| ||      |  |      //      ]],
			[[      \\      |  |      || |' .'|'.   .'||'.   .'|'|\/| ||      |  |      //      ]],
			[[       \\      | |      ||  .'.' '.'.'.'  '.'.'.' '|  | ||      | |      //       ]],
			[[       \\      | |      ||.'.'     '.'      '.'       |.||      | |      //       ]],
			[[        \\     |'       |_.'                          '._|       '|     //        ]],
			[[                                                                                  ]],
		}
		local leader = "SPC"
		local if_nil = vim.F.if_nil
		local function button(sc, txt, keybind, keybind_opts)
			local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

			local opts = {
				position = "center",
				shortcut = sc,
				cursor = 3,
				width = 50,
				align_shortcut = "right",
				hl_shortcut = "Keyword",
			}
			if keybind then
				keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
				opts.keymap = { "n", sc_, keybind, keybind_opts }
			end

			local function on_press()
				local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
				vim.api.nvim_feedkeys(key, "t", false)
			end

			return {
				type = "button",
				val = txt,
				on_press = on_press,
				opts = opts,
			}
		end
		theme.section.buttons.val = {
			button("e", "   New file", "<cmd>ene<CR>"),
			button("SPC f z", "󰅒   Find Zoxide Session & change Nvim cwd"),
			button("SPC f f", "󰥩   Find file within cwd"),
			button("SPC f r", "󱋢   Recently opened files"),
			button("SPC f s", "   Find word within cwd"),
			button("SPC f b", "   Open Safari bookmarks"),
			button("SPC f g", "   Find in all git repos"),
			button("SPC m f", "󱘎   Open NeoTree"),
			button("SPC e e", "   Open NvimTree"),
		}
		theme.section.footer.val = "Made by maestro-bene"
		require("alpha").setup(theme.config)
	end,
}
