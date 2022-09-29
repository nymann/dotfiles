require("coverage").setup({
  auto_reload = false,
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
  load_coverage_cb = function(ftype)
    vim.notify("Loaded" .. ftype .. " coverage")
  end,
  auto_reload_timeout_ms = 2000,
})
