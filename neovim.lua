-- Dark Inverted Neovim theme (LazyVim override)
-- Based on Serenity with inverted colors

local M = {
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = function()
				vim.o.termguicolors = true
				vim.o.winblend = 0
				vim.o.pumblend = 0

				local colors = {
					base = "#121212", -- terminal base (invertido de #CCCCCC)
					panel = "NONE", -- editor panel
					fg = "#E5E5E5", -- foreground principal (invertido de #474747)
					border = "#E5E5E5", -- bordes (invertido de #333333)

					black = "#121212", -- invertido de #CCCCCC
					red = "#2A2A2A", -- invertido de #3D3D3D
					green = "#3D3D3D", -- invertido de #474747
					yellow = "#505050", -- invertido de #515151
					blue = "#636363", -- invertido de #5B5B5B
					magenta = "#767676", -- invertido de #656565
					cyan = "#898989", -- invertido de #6F6F6F
					white = "#E5E5E5", -- invertido de #333333

					bright_black = "#1E1E1E", -- invertido de #4A4A4A
					bright_red = "#3A3A3A", -- invertido de #545454
					bright_green = "#4D4D4D", -- invertido de #5E5E5E
					bright_yellow = "#606060", -- invertido de #686868
					bright_blue = "#737373", -- invertido de #727272
					bright_magenta = "#868686", -- invertido de #7C7C7C
					bright_cyan = "#999999", -- invertido de #868686
					bright_white = "#FFFFFF",

					subtle = "#404040", -- invertido de #BFBFBF
					selection_bg = "#E5E5E5", -- invertido de #333333
					selection_fg = "#121212", -- invertido de #CCCCCC
					cursor = "#E5E5E5", -- invertido de #333333
					cursor_text = "#121212", -- invertido de #CCCCCC
				}

				local function set(g, o)
					vim.api.nvim_set_hl(0, g, o)
				end

				vim.cmd("highlight clear")
				local P = { bg = colors.panel }

				-- Core/editor
				set("Normal", vim.tbl_extend("force", { fg = colors.fg }, P))
				set("NormalNC", vim.tbl_extend("force", { fg = colors.fg }, P))
				set("SignColumn", vim.tbl_extend("force", { fg = colors.bright_white }, P))
				set("FoldColumn", vim.tbl_extend("force", { fg = colors.bright_white }, P))
				set("LineNr", vim.tbl_extend("force", { fg = colors.bright_white }, P))
				set("CursorLine", P)
				set("CursorColumn", P)

				-- Floats / menus
				set("NormalFloat", vim.tbl_extend("force", { fg = colors.fg }, P))
				set("FloatBorder", vim.tbl_extend("force", { fg = colors.border }, P))
				set("Pmenu", vim.tbl_extend("force", { fg = colors.fg }, P))
				set("PmenuSel", { fg = colors.base, bg = colors.blue, bold = true })
				set("PmenuSbar", { bg = colors.subtle })
				set("PmenuThumb", { bg = colors.green })

				-- Statusline / tabs
				set("StatusLine", vim.tbl_extend("force", { fg = colors.fg }, P))
				set("StatusLineNC", vim.tbl_extend("force", { fg = colors.bright_white }, P))
				set("TabLine", vim.tbl_extend("force", { fg = colors.bright_white }, P))
				set("TabLineFill", P)
				set("TabLineSel", { fg = colors.base, bg = colors.blue, bold = true })

				-- Window separators
				set("WinSeparator", vim.tbl_extend("force", { fg = colors.border }, P))
				set("VertSplit", vim.tbl_extend("force", { fg = colors.border }, P))

				-- Selections / folds
				set("Visual", { bg = colors.selection_bg, fg = colors.selection_fg })
				set("VisualNOS", { bg = colors.subtle })
				set("Folded", vim.tbl_extend("force", { fg = colors.bright_white, italic = true }, P))

				-- Syntax
				set("Comment", { fg = colors.bright_white, italic = true })
				set("Constant", { fg = colors.magenta })
				set("String", { fg = colors.green })
				set("Character", { fg = colors.cyan })
				set("Number", { fg = colors.yellow })
				set("Boolean", { fg = colors.red, bold = true })
				set("Float", { fg = colors.yellow })
				set("Identifier", { fg = colors.fg })
				set("Function", { fg = colors.blue, bold = true })
				set("Function.builtin", { fg = colors.cyan, bold = true })
				set("Statement", { fg = colors.magenta, bold = true })
				set("Conditional", { fg = colors.magenta })
				set("Repeat", { fg = colors.yellow })
				set("Label", { fg = colors.cyan })
				set("Operator", { fg = colors.cyan })
				set("Keyword", { fg = colors.blue, bold = true })
				set("Exception", { fg = colors.red })
				set("PreProc", { fg = colors.yellow })
				set("Include", { fg = colors.yellow })
				set("Macro", { fg = colors.bright_red })
				set("Type", { fg = colors.cyan, italic = true })
				set("StorageClass", { fg = colors.red })
				set("Structure", { fg = colors.yellow })
				set("Typedef", { fg = colors.yellow })
				set("Special", { fg = colors.cyan })
				set("SpecialChar", { fg = colors.cyan })
				set("Tag", { fg = colors.magenta })
				set("Delimiter", { fg = colors.fg })
				set("Debug", { fg = colors.red })
				set("Title", { fg = colors.blue, bold = true })
				set("Directory", { fg = colors.cyan })

				-- Diagnostics
				set("DiagnosticError", { fg = colors.red, bg = colors.panel })
				set("DiagnosticWarn", { fg = colors.yellow, bg = colors.panel })
				set("DiagnosticInfo", { fg = colors.cyan, bg = colors.panel })
				set("DiagnosticHint", { fg = colors.green, bg = colors.panel })
				set("DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
				set("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.yellow })
				set("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.cyan })
				set("DiagnosticUnderlineHint", { undercurl = true, sp = colors.green })

				-- Treesitter links
				set("@text", { link = "Normal" })
				set("@comment", { link = "Comment" })
				set("@constant", { link = "Constant" })
				set("@constant.builtin", { fg = colors.red, bold = true })
				set("@string", { link = "String" })
				set("@character", { link = "Character" })
				set("@number", { link = "Number" })
				set("@boolean", { link = "Boolean" })
				set("@float", { link = "Float" })
				set("@function", { link = "Function" })
				set("@function.builtin", { link = "Function.builtin" })
				set("@method", { link = "Function" })
				set("@keyword", { link = "Keyword" })
				set("@keyword.function", { link = "Keyword" })
				set("@keyword.operator", { link = "Operator" })
				set("@type.builtin", { fg = colors.cyan, bold = true })
				set("@variable", { fg = colors.fg })
				set("@variable.builtin", { fg = colors.red, bold = true, italic = true })
				set("@parameter", { fg = colors.yellow, italic = true })
				set("@tag.attribute", { fg = colors.yellow })
				set("@constructor", { fg = colors.magenta })
				set("@namespace", { fg = colors.cyan })
				set("@text.uri", { fg = colors.green, underline = true })
				set("@text.todo", { fg = colors.base, bg = colors.yellow, bold = true })

				-- Search (Dark Inverted)
				set("Search", { fg = colors.base, bg = "#737373" })
				set("IncSearch", { fg = colors.base, bg = colors.white, bold = true })
				pcall(set, "CurSearch", { fg = colors.base, bg = colors.white, bold = true })
				set("Substitute", { fg = colors.base, bg = "#A6A6A6", bold = true })
				set("MatchParen", { fg = colors.white, bg = "#494949", bold = true })
				pcall(set, "HlSearchNear", { fg = colors.base, bg = "#858585" })
				pcall(set, "HlSearchLens", { fg = colors.base, bg = "#595959" })
				pcall(set, "HlSearchLensNear", { fg = colors.base, bg = "#737373" })

				-- Enforce background consistency
				local function enforce_panel()
					set("Normal", { fg = colors.fg, bg = colors.panel })
					set("NormalNC", { fg = colors.fg, bg = colors.panel })
					set("NormalFloat", { fg = colors.fg, bg = colors.panel })
					set("StatusLine", { fg = colors.fg, bg = colors.panel })
					set("TabLine", { fg = colors.bright_white, bg = colors.panel })
					set("AlphaNormal", { fg = colors.fg, bg = colors.panel })
				end

				vim.api.nvim_create_autocmd({ "UIEnter", "VimEnter", "ColorScheme" }, {
					callback = function()
						vim.schedule(enforce_panel)
					end,
				})
				vim.api.nvim_create_autocmd("User", {
					pattern = "AlphaReady",
					callback = function()
						vim.schedule(enforce_panel)
					end,
				})
			end,
		},
	},
}

return M
