-- Dark Inverted Neovim theme (LazyVim override)
-- Mantiene UI monocromática, solo colorea el código

local M = {
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = function()
				vim.o.termguicolors = true
				vim.o.winblend = 0
				vim.o.pumblend = 0

				local colors = {
					-- UI colors (mantener original)
					base = "#121212",
					panel = "NONE",
					fg = "#E5E5E5",
					border = "#E5E5E5",
					subtle = "#404040",
					selection_bg = "#E5E5E5",
					selection_fg = "#121212",
					cursor = "#E5E5E5",
					cursor_text = "#121212",

					-- Syntax colors (inspirado en Catppuccin)
					-- Usamos una paleta reducida pero efectiva
					red = "#F38BA8", -- keywords importantes, errores
					peach = "#FAB387", -- números, constantes
					yellow = "#F9E2AF", -- strings
					green = "#A6E3A1", -- funciones
					teal = "#94E2D5", -- types
					blue = "#89B4FA", -- variables especiales
					mauve = "#CBA6F7", -- keywords de control
					pink = "#F5C2E7", -- operators
				}

				local function set(g, o)
					vim.api.nvim_set_hl(0, g, o)
				end

				vim.cmd("highlight clear")
				local P = { bg = colors.panel }

				-- Core/editor (mantener monocromático)
				set("Normal", vim.tbl_extend("force", { fg = colors.fg }, P))
				set("NormalNC", vim.tbl_extend("force", { fg = colors.fg }, P))
				set("SignColumn", vim.tbl_extend("force", { fg = colors.fg }, P))
				set("FoldColumn", vim.tbl_extend("force", { fg = colors.fg }, P))
				set("LineNr", vim.tbl_extend("force", { fg = colors.subtle }, P))
				set("CursorLineNr", vim.tbl_extend("force", { fg = colors.fg }, P))
				set("CursorLine", P)
				set("CursorColumn", P)

				-- Floats / menus (mantener monocromático)
				set("NormalFloat", vim.tbl_extend("force", { fg = colors.fg }, P))
				set("FloatBorder", vim.tbl_extend("force", { fg = colors.border }, P))
				set("Pmenu", vim.tbl_extend("force", { fg = colors.fg }, P))
				set("PmenuSel", { fg = colors.selection_fg, bg = colors.selection_bg })
				set("PmenuSbar", { bg = colors.subtle })
				set("PmenuThumb", { bg = colors.fg })

				-- Statusline / tabs (mantener monocromático)
				set("StatusLine", vim.tbl_extend("force", { fg = colors.fg }, P))
				set("StatusLineNC", vim.tbl_extend("force", { fg = colors.subtle }, P))
				set("TabLine", vim.tbl_extend("force", { fg = colors.subtle }, P))
				set("TabLineFill", P)
				set("TabLineSel", { fg = colors.selection_fg, bg = colors.selection_bg })

				-- Window separators (mantener monocromático)
				set("WinSeparator", vim.tbl_extend("force", { fg = colors.border }, P))
				set("VertSplit", vim.tbl_extend("force", { fg = colors.border }, P))

				-- Selections / folds (mantener monocromático)
				set("Visual", { bg = colors.selection_bg, fg = colors.selection_fg })
				set("VisualNOS", { bg = colors.subtle })
				set("Folded", vim.tbl_extend("force", { fg = colors.subtle, italic = true }, P))

				-- ═══════════════════════════════════════════════════════════
				-- AQUÍ EMPIEZA EL COLOR - Solo para el código
				-- ═══════════════════════════════════════════════════════════

				-- Comentarios (sutiles)
				set("Comment", { fg = colors.subtle, italic = true })

				-- Strings y caracteres (amarillo)
				set("String", { fg = colors.yellow })
				set("Character", { fg = colors.yellow })

				-- Números y constantes (peach/naranja)
				set("Number", { fg = colors.peach })
				set("Float", { fg = colors.peach })
				set("Boolean", { fg = colors.peach })
				set("Constant", { fg = colors.peach })

				-- Funciones (verde)
				set("Function", { fg = colors.green })
				set("Function.builtin", { fg = colors.green })

				-- Keywords y control flow (mauve/morado)
				set("Keyword", { fg = colors.mauve })
				set("Statement", { fg = colors.mauve })
				set("Conditional", { fg = colors.mauve })
				set("Repeat", { fg = colors.mauve })
				set("Label", { fg = colors.mauve })
				set("Exception", { fg = colors.red })

				-- Operators (pink)
				set("Operator", { fg = colors.pink })
				set("Delimiter", { fg = colors.fg })

				-- Types (teal/cyan)
				set("Type", { fg = colors.teal })
				set("StorageClass", { fg = colors.teal })
				set("Structure", { fg = colors.teal })
				set("Typedef", { fg = colors.teal })

				-- Variables e identificadores (fg normal)
				set("Identifier", { fg = colors.fg })

				-- Preprocessor (blue)
				set("PreProc", { fg = colors.blue })
				set("Include", { fg = colors.blue })
				set("Define", { fg = colors.blue })
				set("Macro", { fg = colors.blue })

				-- Special (pink)
				set("Special", { fg = colors.pink })
				set("SpecialChar", { fg = colors.pink })
				set("Tag", { fg = colors.pink })
				set("Debug", { fg = colors.red })

				-- Titles y directorios (mantener monocromático para file explorer)
				set("Title", { fg = colors.fg, bold = true })
				set("Directory", { fg = colors.fg })

				-- Diagnostics (colores solo para errores/warnings)
				set("DiagnosticError", { fg = colors.red, bg = colors.panel })
				set("DiagnosticWarn", { fg = colors.peach, bg = colors.panel })
				set("DiagnosticInfo", { fg = colors.blue, bg = colors.panel })
				set("DiagnosticHint", { fg = colors.teal, bg = colors.panel })
				set("DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
				set("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.peach })
				set("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.blue })
				set("DiagnosticUnderlineHint", { undercurl = true, sp = colors.teal })

				-- Treesitter (mapeo coherente)
				set("@text", { link = "Normal" })
				set("@comment", { link = "Comment" })
				set("@constant", { link = "Constant" })
				set("@constant.builtin", { fg = colors.peach })
				set("@string", { link = "String" })
				set("@character", { link = "Character" })
				set("@number", { link = "Number" })
				set("@boolean", { link = "Boolean" })
				set("@float", { link = "Float" })
				set("@function", { link = "Function" })
				set("@function.builtin", { link = "Function.builtin" })
				set("@function.call", { fg = colors.green })
				set("@method", { link = "Function" })
				set("@method.call", { fg = colors.green })
				set("@keyword", { link = "Keyword" })
				set("@keyword.function", { fg = colors.mauve })
				set("@keyword.operator", { link = "Operator" })
				set("@keyword.return", { fg = colors.red })
				set("@type", { link = "Type" })
				set("@type.builtin", { fg = colors.teal })
				set("@variable", { fg = colors.fg })
				set("@variable.builtin", { fg = colors.blue })
				set("@parameter", { fg = colors.fg, italic = true })
				set("@property", { fg = colors.fg })
				set("@tag", { fg = colors.mauve })
				set("@tag.attribute", { fg = colors.teal })
				set("@tag.delimiter", { fg = colors.pink })
				set("@constructor", { fg = colors.teal })
				set("@namespace", { fg = colors.teal })
				set("@text.uri", { fg = colors.blue, underline = true })
				set("@text.todo", { fg = colors.base, bg = colors.yellow, bold = true })

				-- Search (mantener monocromático pero visible)
				set("Search", { fg = colors.base, bg = colors.fg })
				set("IncSearch", { fg = colors.base, bg = colors.fg, bold = true })
				pcall(set, "CurSearch", { fg = colors.base, bg = colors.fg, bold = true })
				set("Substitute", { fg = colors.base, bg = colors.subtle, bold = true })
				set("MatchParen", { fg = colors.fg, bg = colors.subtle, bold = true })
				pcall(set, "HlSearchNear", { fg = colors.base, bg = colors.fg })
				pcall(set, "HlSearchLens", { fg = colors.base, bg = colors.subtle })
				pcall(set, "HlSearchLensNear", { fg = colors.base, bg = colors.fg })

				-- Alpha dashboard (mantener monocromático - ORIGINAL)
				set("AlphaHeader", { fg = colors.fg })
				set("AlphaButtons", { fg = colors.fg })
				set("AlphaShortcut", { fg = colors.fg })
				set("AlphaFooter", { fg = colors.fg })

				-- Enforce background consistency
				local function enforce_panel()
					set("Normal", { fg = colors.fg, bg = colors.panel })
					set("NormalNC", { fg = colors.fg, bg = colors.panel })
					set("NormalFloat", { fg = colors.fg, bg = colors.panel })
					set("StatusLine", { fg = colors.fg, bg = colors.panel })
					set("TabLine", { fg = colors.subtle, bg = colors.panel })
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
