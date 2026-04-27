return {
  "yetone/avante.nvim",
  opts = function(_, opts)
    opts = opts or {}
    opts.highlights = opts.highlights or {}

    -- Palette Catppuccin Mocha
    -- Référence: catppuccin mocha standard palette names
    local C = {
      rosewater = "#f5e0dc",
      flamingo  = "#f2cdcd",
      pink      = "#f5c2e7",
      mauve     = "#cba6f7",
      red       = "#f38ba8",
      maroon    = "#eba0ac",
      peach     = "#fab387",
      yellow    = "#f9e2af",
      green     = "#a6e3a1",
      teal      = "#94e2d5",
      sky       = "#89dceb",
      sapphire  = "#74c7ec",
      blue      = "#89b4fa",
      lavender  = "#b4befe",
      text      = "#cdd6f4",
      subtext1  = "#bac2de",
      subtext0  = "#a6adc8",
      overlay2  = "#9399b2",
      overlay1  = "#7f849c",
      overlay0  = "#6c7086",
      surface2  = "#585b70",
      surface1  = "#45475a",
      surface0  = "#313244",
      base      = "#1e1e2e",
      mantle    = "#181825",
      crust     = "#11111b",
    }

    -- On remplace les groupes Avante après chargement du thème
    local function set_avante_hl()
      local set = vim.api.nvim_set_hl

      set(0, "AvanteTitle", { fg = C.base, bg = C.green, bold = true })
      set(0, "AvanteReversedTitle", { fg = C.green, bg = "NONE" })
      set(0, "AvanteSubtitle", { fg = C.base, bg = C.sapphire, bold = true })
      set(0, "AvanteReversedSubtitle", { fg = C.sapphire, bg = "NONE" })
      set(0, "AvanteThirdTitle", { fg = C.text, bg = C.surface0 })
      set(0, "AvanteReversedThirdTitle", { fg = C.surface0, bg = "NONE" })

      set(0, "AvanteSuggestion", { fg = C.overlay1, italic = true })
      set(0, "AvanteAnnotation", { fg = C.overlay1, italic = true })
      set(0, "AvantePopupHint", { fg = C.text, bg = "NONE" })
      set(0, "AvanteInlineHint", { fg = C.mauve, italic = true })

      set(0, "AvanteToBeDeleted", { bg = C.surface0, fg = C.red, strikethrough = true })
      set(0, "AvanteToBeDeletedWOStrikethrough", { bg = C.surface0, fg = C.red })

      set(0, "AvanteConfirmTitle", { fg = C.base, bg = C.red, bold = true })

      set(0, "AvanteButtonDefault", { fg = C.base, bg = C.subtext1 })
      set(0, "AvanteButtonDefaultHover", { fg = C.base, bg = C.green })
      set(0, "AvanteButtonPrimary", { fg = C.base, bg = C.subtext1 })
      set(0, "AvanteButtonPrimaryHover", { fg = C.base, bg = C.sapphire })
      set(0, "AvanteButtonDanger", { fg = C.base, bg = C.subtext1 })
      set(0, "AvanteButtonDangerHover", { fg = C.base, bg = C.red })

      -- Fenêtres "comme nvim normal"
      set(0, "AvantePromptInput", { link = "Normal" })
      set(0, "AvantePromptInputBorder", { link = "WinSeparator" })
      set(0, "AvanteSidebarWinSeparator", { fg = C.base, bg = "NONE" })
      set(0, "AvanteSidebarWinHorizontalSeparator", { link = "WinSeparator" })
      set(0, "AvanteSidebarNormal", { link = "Normal" })

      set(0, "AvanteCommentFg", { fg = C.overlay1 })
      set(0, "AvanteReversedNormal", { fg = C.base, bg = C.text })

      set(0, "AvanteStateSpinnerGenerating", { fg = C.base, bg = C.mauve, bold = true })
      set(0, "AvanteStateSpinnerToolCalling", { fg = C.base, bg = C.sapphire, bold = true })
      set(0, "AvanteStateSpinnerFailed", { fg = C.base, bg = C.red, bold = true })
      set(0, "AvanteStateSpinnerSucceeded", { fg = C.base, bg = C.green, bold = true })
      set(0, "AvanteStateSpinnerSearching", { fg = C.base, bg = C.pink, bold = true })
      set(0, "AvanteStateSpinnerThinking", { fg = C.base, bg = C.pink, bold = true })
      set(0, "AvanteStateSpinnerCompacting", { fg = C.base, bg = C.pink, bold = true })

      set(0, "AvanteTaskRunning", { fg = C.pink, bg = "NONE" })
      set(0, "AvanteTaskCompleted", { fg = C.green, bg = "NONE" })
      set(0, "AvanteTaskFailed", { fg = C.red, bg = "NONE" })
      set(0, "AvanteThinking", { fg = C.pink, bg = "NONE" })

      -- Conflits diff
      set(0, "AvanteConflictCurrent", { bg = C.surface0, bold = true })
      set(0, "AvanteConflictCurrentLabel", { bg = C.surface1, bold = true })
      set(0, "AvanteConflictIncoming", { bg = C.surface0, bold = true })
      set(0, "AvanteConflictIncomingLabel", { bg = C.surface1, bold = true })

      -- Logo gradient remappé mocha
      local grad = {
        C.rosewater, C.flamingo, C.pink, C.mauve, C.red, C.maroon, C.peach,
        C.yellow, C.green, C.teal, C.sky, C.sapphire, C.blue, C.lavender,
      }
      for i, col in ipairs(grad) do
        set(0, ("AvanteLogoLine%d"):format(i), { fg = col })
      end
    end

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = set_avante_hl,
    })
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyDone",
      callback = set_avante_hl,
    })

    -- Si le thème est déjà chargé
    vim.schedule(set_avante_hl)

    return opts
  end,
}
