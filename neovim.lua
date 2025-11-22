-- Dark Inverted Neovim theme (LazyVim override)
-- Inspired by Tokyo Night - Mantiene UI monocromática, solo colorea el código

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

					-- Syntax colors (inspirado en Tokyo Night)
					-- Paleta mejorada y más vibrante
					red = "#F7768E", -- keywords importantes, errores (Tokyo Night red)
					orange = "#FF9E64", -- números, constantes (Tokyo Night orange)
					yellow = "#E0AF68", -- strings (Tokyo Night yellow)
					green = "#9ECE6A", -- funciones, strings especiales (Tokyo Night green)
					teal = "#73DACA", -- types, clases (Tokyo Night teal)
					cyan = "#7DCFFF", -- variables especiales, imports (Tokyo Night cyan)
					blue = "#7AA2F7", -- keywords de control (Tokyo Night blue)
					purple = "#BB9AF7", -- operators, special (Tokyo Night purple)
					magenta = "#C678DD", -- decoradores, annotations

					-- Comentarios más visibles (Tokyo Night comment)
					comment = "#565F89", -- Mucho más visible que #404040
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
				set("Folded", vim.tbl_extend("force", { fg = colors.comment, italic = true }, P))

				-- ═══════════════════════════════════════════════════════════
				-- AQUÍ EMPIEZA EL COLOR - Solo para el código
				-- ═══════════════════════════════════════════════════════════

				-- Comentarios (MÁS VISIBLES - color gris medio como Tokyo Night)
				set("Comment", { fg = colors.comment, italic = true })

				-- Strings y caracteres (amarillo Tokyo Night)
				set("String", { fg = colors.yellow })
				set("Character", { fg = colors.yellow })

				-- Números y constantes (naranja)
				set("Number", { fg = colors.orange })
				set("Float", { fg = colors.orange })
				set("Boolean", { fg = colors.orange })
				set("Constant", { fg = colors.orange })

				-- Funciones (verde)
				set("Function", { fg = colors.green, bold = true })
				set("Function.builtin", { fg = colors.green })

				-- Keywords y control flow (azul Tokyo Night)
				set("Keyword", { fg = colors.blue, italic = true })
				set("Statement", { fg = colors.blue })
				set("Conditional", { fg = colors.purple, italic = true })
				set("Repeat", { fg = colors.purple, italic = true })
				set("Label", { fg = colors.purple })
				set("Exception", { fg = colors.red, italic = true })

				-- Operators (púrpura)
				set("Operator", { fg = colors.purple })
				set("Delimiter", { fg = colors.fg })

				-- Types (teal/cyan)
				set("Type", { fg = colors.teal })
				set("StorageClass", { fg = colors.blue, italic = true })
				set("Structure", { fg = colors.teal })
				set("Typedef", { fg = colors.teal })

				-- Variables e identificadores (fg normal)
				set("Identifier", { fg = colors.fg })

				-- Preprocessor (cyan)
				set("PreProc", { fg = colors.cyan })
				set("Include", { fg = colors.purple, italic = true })
				set("Define", { fg = colors.purple })
				set("Macro", { fg = colors.purple })

				-- Special (púrpura)
				set("Special", { fg = colors.purple })
				set("SpecialChar", { fg = colors.purple })
				set("Tag", { fg = colors.cyan })
				set("Debug", { fg = colors.red })

				-- Titles y directorios (mantener monocromático para file explorer)
				set("Title", { fg = colors.fg, bold = true })
				set("Directory", { fg = colors.fg })

				-- Diagnostics (colores solo para errores/warnings)
				set("DiagnosticError", { fg = colors.red, bg = colors.panel })
				set("DiagnosticWarn", { fg = colors.orange, bg = colors.panel })
				set("DiagnosticInfo", { fg = colors.cyan, bg = colors.panel })
				set("DiagnosticHint", { fg = colors.teal, bg = colors.panel })
				set("DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
				set("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.orange })
				set("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.cyan })
				set("DiagnosticUnderlineHint", { undercurl = true, sp = colors.teal })

				-- ═══════════════════════════════════════════════════════════
				-- Treesitter - Soporte mejorado para múltiples lenguajes
				-- ═══════════════════════════════════════════════════════════

				-- Básicos
				set("@text", { link = "Normal" })
				set("@comment", { fg = colors.comment, italic = true })
				set("@constant", { link = "Constant" })
				set("@constant.builtin", { fg = colors.orange })
				set("@string", { fg = colors.yellow })
				set("@string.escape", { fg = colors.purple })
				set("@string.special", { fg = colors.green })
				set("@character", { link = "Character" })
				set("@number", { link = "Number" })
				set("@boolean", { link = "Boolean" })
				set("@float", { link = "Float" })

				-- Funciones y métodos
				set("@function", { fg = colors.green, bold = true })
				set("@function.builtin", { fg = colors.green })
				set("@function.call", { fg = colors.green })
				set("@method", { fg = colors.green })
				set("@method.call", { fg = colors.green })
				set("@constructor", { fg = colors.teal })

				-- Keywords
				set("@keyword", { fg = colors.blue, italic = true })
				set("@keyword.function", { fg = colors.purple, italic = true })
				set("@keyword.operator", { fg = colors.purple })
				set("@keyword.return", { fg = colors.red, italic = true })
				set("@keyword.import", { fg = colors.purple, italic = true })

				-- Types
				set("@type", { fg = colors.teal })
				set("@type.builtin", { fg = colors.cyan })
				set("@type.definition", { fg = colors.teal })
				set("@type.qualifier", { fg = colors.blue, italic = true })

				-- Variables
				set("@variable", { fg = colors.fg })
				set("@variable.builtin", { fg = colors.red, italic = true })
				set("@variable.parameter", { fg = colors.orange, italic = true })
				set("@variable.member", { fg = colors.fg })
				set("@parameter", { fg = colors.orange, italic = true })
				set("@property", { fg = colors.fg })
				set("@field", { fg = colors.fg })

				-- ═══════════════════════════════════════════════════════════
				-- PYTHON - Soporte específico mejorado
				-- ═══════════════════════════════════════════════════════════
				set("@decorator.python", { fg = colors.magenta, italic = true })
				set("@function.decorator.python", { fg = colors.magenta, italic = true })
				set("@variable.builtin.python", { fg = colors.red, italic = true }) -- self, cls
				set("@type.builtin.python", { fg = colors.cyan }) -- int, str, etc
				set("@keyword.import.python", { fg = colors.purple, italic = true })
				set("@keyword.exception.python", { fg = colors.red, italic = true })
				set("@string.documentation.python", { fg = colors.comment, italic = true })

				-- JavaScript/TypeScript
				set("@constructor.javascript", { fg = colors.teal })
				set("@constructor.typescript", { fg = colors.teal })
				set("@tag.javascript", { fg = colors.red })
				set("@tag.typescript", { fg = colors.red })
				set("@tag.tsx", { fg = colors.red })
				set("@tag.attribute.tsx", { fg = colors.orange })
				set("@tag.delimiter.tsx", { fg = colors.fg })

				-- Go
				set("@namespace.go", { fg = colors.teal })
				set("@type.go", { fg = colors.teal })
				set("@function.call.go", { fg = colors.green })

				-- Rust
				set("@namespace.rust", { fg = colors.teal })
				set("@type.rust", { fg = colors.teal })
				set("@attribute.rust", { fg = colors.magenta })

				-- HTML/XML
				set("@tag", { fg = colors.red })
				set("@tag.attribute", { fg = colors.orange })
				set("@tag.delimiter", { fg = colors.fg })

				-- CSS
				set("@property.css", { fg = colors.cyan })
				set("@type.css", { fg = colors.orange })

				-- Markdown
				set("@text.title.markdown", { fg = colors.red, bold = true })
				set("@text.literal.markdown", { fg = colors.green })
				set("@text.uri", { fg = colors.cyan, underline = true })
				set("@text.emphasis", { italic = true })
				set("@text.strong", { bold = true })

				-- Otros
				set("@namespace", { fg = colors.teal })
				set("@label", { fg = colors.purple })
				set("@operator", { fg = colors.purple })
				set("@punctuation.delimiter", { fg = colors.fg })
				set("@punctuation.bracket", { fg = colors.fg })
				set("@punctuation.special", { fg = colors.purple })
				set("@text.todo", { fg = colors.base, bg = colors.yellow, bold = true })
				set("@text.warning", { fg = colors.base, bg = colors.orange, bold = true })
				set("@text.danger", { fg = colors.base, bg = colors.red, bold = true })

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
