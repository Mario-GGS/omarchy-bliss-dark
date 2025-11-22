-- Dark Inverted Neovim theme (LazyVim override)
-- Cyberpunk Edgerunners inspired colors

local M = {
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = function()
				vim.o.termguicolors = true
				vim.o.winblend = 0
				vim.o.pumblend = 0

				local colors = {
					base = "#121212", -- terminal base
					panel = "NONE", -- editor panel
					fg = "#E5E5E5", -- foreground principal
					border = "#5DADE2", -- azul para bordes

					-- Cyberpunk Edgerunners palette (darkened)
					black = "#121212",
					red = "#FF6B6B", -- rojo cálido para errores
					green = "#3FCC1A", -- verde edgerunners
					yellow = "#D4B000", -- amarillo edgerunners
					blue = "#5DADE2", -- azul frío
					magenta = "#C49AD9", -- rosa/magenta edgerunners
					cyan = "#00BFD4", -- cyan edgerunners
					white = "#E5E5E5",
					orange = "#FF8C42", -- naranja acento

					bright_black = "#2A2A2A",
					bright_red = "#FF8585",
					bright_green = "#5FE038",
					bright_yellow = "#F8E602",
					bright_blue = "#7EC8F0",
					bright_magenta = "#E0B8ED",
					bright_cyan = "#00D4EA",
					bright_white = "#FFFFFF",

					subtle = "#5E1B6B", -- violeta oscuro
					selection_bg = "#5E1B6B",
					selection_fg = "#E5E5E5",
					cursor = "#00BFD4",
					cursor_text = "#121212",
				}

				local function set(g, o)
					vim.api.nvim_set_hl(0, g, o)
				end

				vim.cmd("highlight clear")
				local P = { bg = colors.panel }

				-- Core/editor
				set("Normal", vim.tbl_extend("force", { fg = colors.fg }, P))
				set("NormalNC", vim.tbl_extend("force", { fg = colors.fg }, P))
				set("SignColumn", vim.tbl_extend("force", { fg = colors.cyan }, P))
				set("FoldColumn", vim.tbl_extend("force", { fg = colors.magenta }, P))
				set("LineNr", vim.tbl_extend("force", { fg = colors.subtle }, P))
				set("CursorLineNr", vim.tbl_extend("force", { fg = colors.cyan, bold = true }, P))
				set("CursorLine", P)
				set("CursorColumn", P)

				-- Floats / menus
				set("NormalFloat", vim.tbl_extend("force", { fg = colors.fg }, P))
				set("FloatBorder", vim.tbl_extend("force", { fg = colors.border }, P))
				set("Pmenu", vim.tbl_extend("force", { fg = colors.fg }, P))
				set("PmenuSel", { fg = colors.base, bg = colors.cyan, bold = true })
				set("PmenuSbar", { bg = colors.subtle })
				set("PmenuThumb", { bg = colors.green })

				-- Statusline / tabs
				set("StatusLine", vim.tbl_extend("force", { fg = colors.cyan }, P))
				set("StatusLineNC", vim.tbl_extend("force", { fg = colors.subtle }, P))
				set("TabLine", vim.tbl_extend("force", { fg = colors.magenta }, P))
				set("TabLineFill", P)
				set("TabLineSel", { fg = colors.base, bg = colors.cyan, bold = true })

				-- Window separators
				set("WinSeparator", vim.tbl_extend("force", { fg = colors.border }, P))
				set("VertSplit", vim.tbl_extend("force", { fg = colors.border }, P))

				-- Selections / folds
				set("Visual", { bg = colors.selection_bg, fg = colors.selection_fg })
				set("VisualNOS", { bg = colors.subtle })
				set("Folded", vim.tbl_extend("force", { fg = colors.magenta, italic = true }, P))

				-- Syntax highlighting (colorful!)
				set("Comment", { fg = colors.subtle, italic = true })
				set("Constant", { fg = colors.magenta })
				set("String", { fg = colors.green })
				set("Character", { fg = colors.cyan })
				set("Number", { fg = colors.yellow })
				set("Boolean", { fg = colors.orange, bold = true })
				set("Float", { fg = colors.yellow })
				set("Identifier", { fg = colors.fg })
				set("Function", { fg = colors.blue, bold = true })
				set("Function.builtin", { fg = colors.cyan, bold = true })
				set("Statement", { fg = colors.magenta, bold = true })
				set("Conditional", { fg = colors.orange })
				set("Repeat", { fg = colors.orange })
				set("Label", { fg = colors.cyan })
				set("Operator", { fg = colors.cyan })
				set("Keyword", { fg = colors.blue, bold = true })
				set("Exception", { fg = colors.red })
				set("PreProc", { fg = colors.yellow })
				set("Include", { fg = colors.magenta })
				set("Macro", { fg = colors.orange })
				set("Type", { fg = colors.cyan, italic = true })
				set("StorageClass", { fg = colors.orange })
				set("Structure", { fg = colors.yellow })
				set("Typedef", { fg = colors.yellow })
				set("Special", { fg = colors.cyan })
				set("SpecialChar", { fg = colors.cyan })
				set("Tag", { fg = colors.magenta })
				set("Delimiter", { fg = colors.fg })
				set("Debug", { fg = colors.red })
				set("Title", { fg = colors.cyan, bold = true })
				set("Directory", { fg = colors.cyan, bold = true })

				-- Diagnostics
				set("DiagnosticError", { fg = colors.red, bg = colors.panel })
				set("DiagnosticWarn", { fg = colors.orange, bg = colors.panel })
				set("DiagnosticInfo", { fg = colors.cyan, bg = colors.panel })
				set("DiagnosticHint", { fg = colors.green, bg = colors.panel })
				set("DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
				set("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.orange })
				set("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.cyan })
				set("DiagnosticUnderlineHint", { undercurl = true, sp = colors.green })

				-- Treesitter links
				set("@text", { link = "Normal" })
				set("@comment", { link = "Comment" })
				set("@constant", { link = "Constant" })
				set("@constant.builtin", { fg = colors.orange, bold = true })
				set("@string", { link = "String" })
				set("@character", { link = "Character" })
				set("@number", { link = "Number" })
				set("@boolean", { link = "Boolean" })
				set("@float", { link = "Float" })
				set("@function", { link = "Function" })
				set("@function.builtin", { link = "Function.builtin" })
				set("@method", { link = "Function" })
				set("@keyword", { link = "Keyword" })
				set("@keyword.function", { fg = colors.magenta, bold = true })
				set("@keyword.operator", { link = "Operator" })
				set("@type.builtin", { fg = colors.cyan, bold = true })
				set("@variable", { fg = colors.fg })
				set("@variable.builtin", { fg = colors.orange, bold = true, italic = true })
				set("@parameter", { fg = colors.yellow, italic = true })
				set("@tag.attribute", { fg = colors.yellow })
				set("@constructor", { fg = colors.magenta })
				set("@namespace", { fg = colors.cyan })
				set("@text.uri", { fg = colors.green, underline = true })
				set("@text.todo", { fg = colors.base, bg = colors.yellow, bold = true })

				-- Search
				set("Search", { fg = colors.base, bg = colors.yellow })
				set("IncSearch", { fg = colors.base, bg = colors.orange, bold = true })
				pcall(set, "CurSearch", { fg = colors.base, bg = colors.cyan, bold = true })
				set("Substitute", { fg = colors.base, bg = colors.green, bold = true })
				set("MatchParen", { fg = colors.cyan, bg = colors.subtle, bold = true })
				pcall(set, "HlSearchNear", { fg = colors.base, bg = colors.blue })
				pcall(set, "HlSearchLens", { fg = colors.base, bg = colors.subtle })
				pcall(set, "HlSearchLensNear", { fg = colors.base, bg = colors.cyan })

				-- Alpha (dashboard) colors
				set("AlphaHeader", { fg = colors.cyan, bold = true })
				set("AlphaButtons", { fg = colors.magenta })
				set("AlphaShortcut", { fg = colors.green, bold = true })
				set("AlphaFooter", { fg = colors.yellow, italic = true })

				-- Enforce background consistency
				local function enforce_panel()
					set("Normal", { fg = colors.fg, bg = colors.panel })
					set("NormalNC", { fg = colors.fg, bg = colors.panel })
					set("NormalFloat", { fg = colors.fg, bg = colors.panel })
					set("StatusLine", { fg = colors.cyan, bg = colors.panel })
					set("TabLine", { fg = colors.magenta, bg = colors.panel })
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
