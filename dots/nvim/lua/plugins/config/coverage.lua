require("coverage").setup({
	commands = true, -- create commands
	highlights = {
		-- customize highlight groups created by the plugin
		covered = { fg = "#73DACA" },   -- supports style, fg, bg, sp (see :h highlight-gui)
		uncovered = { fg = "#F7768E" },
	},
	signs = {
		-- use your own highlight groups or text markers
		covered = { hl = "CoverageCovered", text = "▎" },
		uncovered = { hl = "CoverageUncovered", text = "▎" },
	},
	summary = {
		-- customize the summary pop-up
		min_coverage = 80.0,      -- minimum coverage threshold (used for highlighting)
	},
	lang = {
		-- customize language specific settings
	},
})
