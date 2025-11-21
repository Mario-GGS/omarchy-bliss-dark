-- Serenity Neovim theme (LazyVim override)
-- Dark variant by Mario-GGS

local M = {
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = function()
				vim.o.termguicolors = true
				vim.o.winblend = 0
				vim.o.pumblend = 0

				local colors = {
					-- Base / fondo
					base = "#121212", -- terminal base
					panel = "#121212", -- editor panel
					fg = "#E5E5E5",
					border = "#333333",

					-- Paleta principal
					black = "#000000",
					red = "#C94F4F",
					green = "#8BC34A",
					yellow = "#FFB74D",
					blue = "#64B5F6",
					magenta = "#BA68C8",
					cyan = "#4DD0E1",
					white = "#E5E5E5",

					bright_black = "#555555",
					bright_red = "#EF5350",
					bright_green = "#AED581",
					bright_yellow = "#FFD54F",
					bright_blue = "#90CAF9",
					bright_magenta = "#CE93D8",
					bright_cyan = "#80DEEA",
					bright_white = "#FFFFFF",

					-- Extras
					subtle = "#252525",
					selection_bg = "#252525",
					selection_fg = "#F0F0F0",
					cursor = "#F0F0F0",
					cursor_text = "#121212",

					-- Logo / header LazyVim
					logo = "#F5F5F5",
				}

				local function set(g, o)
					vim.api.nvim_set_hl(0, g, o)
				end

				vim.cmd("highlight clear")
				local P = { bg = colors.panel }

				-- Core/editor
				set("Normal", vim.tbl_extend("force", { fg = colors.fg }, P))
				set("NormalNC", vim.tbl_extend("force", { fg = colors.fg }, P))
				set("SignColumn", vim.tbl_extend("force", { fg = colors.bright_black }, P))
				set("FoldColumn", vim.tbl_extend("force", { fg = colors.bright_black }, P))
				set("LineNr", vim.tbl_extend("force", { fg = colors.bright_black }, P))
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
				set("StatusLineNC", vim.tbl_extend("force", { fg = colors.bright_black }, P))
				set("TabLine", vim.tbl_extend("force", { fg = colors.bright_black }, P))
				set("TabLineFill", P)
				set("TabLineSel", { fg = colors.base, bg = colors.blue, bold = true })

				-- Window separators
				set("WinSeparator", vim.tbl_extend("force", { fg = colors.border }, P))
				set("VertSplit", vim.tbl_extend("force", { fg = colors.border }, P))

				-- Selections / folds
				set("Visual", { bg = colors.selection_bg, fg = colors.selection_fg })
				set("VisualNOS", { bg = colors.subtle })
				set("Folded", vim.tbl_extend("force", { fg = colors.bright_black, italic = true }, P))

				-- Syntax
				set("Comment", { fg = colors.bright_black, italic = true })
				set("Constant", { fg = colors.magenta })
				set("String", { fg = colors.green })
				set("Character", { fg = colors.cyan })
				set("Number", { fg = colors.yellow })
				set("Boolean", { fg = colors.red, bold = true })
				set("Float", { fg = colors.yellow })
				set("Identifier", { fg = colors.fg })

				-- un poco más de punch para funciones y palabras clave
				set("Function", { fg = colors.bright_blue, bold = true })
				set("Function.builtin", { fg = colors.cyan, bold = true })
				set("Statement", { fg = colors.magenta, bold = true })
				set("Conditional", { fg = colors.magenta })
				set("Repeat", { fg = colors.yellow })
				set("Label", { fg = colors.cyan })
				set("Operator", { fg = colors.cyan })
				set("Keyword", { fg = colors.bright_blue, bold = true })
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

				-- Search
				set("Search", { fg = colors.base, bg = "#8C8C8C" })
				set("IncSearch", { fg = colors.base, bg = colors.black, bold = true })
				pcall(set, "CurSearch", { fg = colors.base, bg = colors.black, bold = true })
				set("Substitute", { fg = colors.base, bg = "#595959", bold = true })

				-- MatchParen y lens algo más discretos en dark
				set("MatchParen", { fg = colors.black, bg = "#4A4A4A", bold = true })
				pcall(set, "HlSearchNear", { fg = colors.base, bg = "#5E5E5E" })
				pcall(set, "HlSearchLens", { fg = colors.base, bg = "#707070" })
				pcall(set, "HlSearchLensNear", { fg = colors.base, bg = "#666666" })

				-- Enforce background consistency + Alpha/LazyVim tweaks
				local function enforce_panel()
					set("Normal", { fg = colors.fg, bg = colors.panel })
					set("NormalNC", { fg = colors.fg, bg = colors.panel })
					set("NormalFloat", { fg = colors.fg, bg = colors.panel })
					set("StatusLine", { fg = colors.fg, bg = colors.panel })
					set("TabLine", { fg = colors.bright_black, bg = colors.panel })

					-- Dashboard / LazyVim
					set("AlphaNormal", { fg = colors.fg, bg = colors.panel })
					pcall(set, "AlphaHeader", { fg = colors.logo, bg = colors.panel })
					pcall(set, "AlphaTitle", { fg = colors.logo, bg = colors.panel, bold = true })
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
