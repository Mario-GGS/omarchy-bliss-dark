-- Dark Inverted Neovim theme (LazyVim override)
-- Catppuccin Mocha colors

local M = {
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = function()
				vim.o.termguicolors = true
				vim.o.winblend = 0
				vim.o.pumblend = 0

				local colors = {
					-- UI colors (base Catppuccin Mocha)
					base = "#1e1e2e",
					mantle = "#181825",
					crust = "#11111b",
					panel = "NONE",
					fg = "#cdd6f4", -- Text
					border = "#cdd6f4",
					subtle = "#6c7086", -- Overlay 0
					selection_bg = "#cdd6f4",
					selection_fg = "#1e1e2e",
					cursor = "#cdd6f4",
					cursor_text = "#1e1e2e",

					-- Catppuccin Mocha Syntax colors
					rosewater = "#f5e0dc",
					flamingo = "#f2cdcd",
					pink = "#f5c2e7",
					mauve = "#cba6f7",
					red = "#f38ba8",
					maroon = "#eba0ac",
					peach = "#fab387",
					yellow = "#f9e2af",
					green = "#a6e3a1",
					teal = "#94e2d5",
					sky = "#89dceb",
					sapphire = "#74c7ec",
					blue = "#89b4fa",
					lavender = "#b4befe",

					-- Text colors
					text = "#cdd6f4",
					subtext1 = "#bac2de",
					subtext0 = "#a6adc8",

					-- Surface colors
					overlay2 = "#9399b2",
					overlay1 = "#7f849c",
					overlay0 = "#6c7086",
					surface2 = "#585b70",
					surface1 = "#45475a",
					surface0 = "#313244",

					-- Comment
					comment = "#6c7086",
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

				-- Comentarios (Catppuccin Mocha Overlay 0)
				set("Comment", { fg = colors.comment, italic = true })

				-- Strings y caracteres (Yellow)
				set("String", { fg = colors.yellow })
				set("Character", { fg = colors.yellow })

				-- Números y constantes (Peach)
				set("Number", { fg = colors.peach })
				set("Float", { fg = colors.peach })
				set("Boolean", { fg = colors.peach })
				set("Constant", { fg = colors.peach })

				-- Funciones (Blue)
				set("Function", { fg = colors.blue, bold = true })
				set("Function.builtin", { fg = colors.blue })

				-- Keywords y control flow (Mauve)
				set("Keyword", { fg = colors.mauve, italic = true })
				set("Statement", { fg = colors.mauve })
				set("Conditional", { fg = colors.mauve, italic = true })
				set("Repeat", { fg = colors.mauve, italic = true })
				set("Label", { fg = colors.mauve })
				set("Exception", { fg = colors.red, italic = true })

				-- Operators (Sky)
				set("Operator", { fg = colors.sky })
				set("Delimiter", { fg = colors.fg })

				-- Types (Yellow)
				set("Type", { fg = colors.yellow })
				set("StorageClass", { fg = colors.mauve, italic = true })
				set("Structure", { fg = colors.yellow })
				set("Typedef", { fg = colors.yellow })

				-- Variables e identificadores (Text)
				set("Identifier", { fg = colors.text })

				-- Preprocessor (Pink)
				set("PreProc", { fg = colors.pink })
				set("Include", { fg = colors.pink, italic = true })
				set("Define", { fg = colors.pink })
				set("Macro", { fg = colors.pink })

				-- Special (Pink)
				set("Special", { fg = colors.pink })
				set("SpecialChar", { fg = colors.pink })
				set("Tag", { fg = colors.mauve })
				set("Debug", { fg = colors.red })

				-- Titles y directorios (mantener monocromático para file explorer)
				set("Title", { fg = colors.fg, bold = true })
				set("Directory", { fg = colors.fg })

				-- Diagnostics (colores solo para errores/warnings)
				set("DiagnosticError", { fg = colors.red, bg = colors.panel })
				set("DiagnosticWarn", { fg = colors.peach, bg = colors.panel })
				set("DiagnosticInfo", { fg = colors.sky, bg = colors.panel })
				set("DiagnosticHint", { fg = colors.teal, bg = colors.panel })
				set("DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
				set("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.peach })
				set("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.sky })
				set("DiagnosticUnderlineHint", { undercurl = true, sp = colors.teal })

				-- ═══════════════════════════════════════════════════════════
				-- Treesitter - Soporte mejorado para múltiples lenguajes
				-- ═══════════════════════════════════════════════════════════

				-- Básicos
				set("@text", { link = "Normal" })
				set("@comment", { fg = colors.comment, italic = true })
				set("@constant", { link = "Constant" })
				set("@constant.builtin", { fg = colors.peach })
				set("@string", { fg = colors.yellow })
				set("@string.escape", { fg = colors.pink })
				set("@string.special", { fg = colors.green })
				set("@character", { link = "Character" })
				set("@number", { link = "Number" })
				set("@boolean", { link = "Boolean" })
				set("@float", { link = "Float" })

				-- Funciones y métodos
				set("@function", { fg = colors.blue, bold = true })
				set("@function. builtin", { fg = colors.blue })
				set("@function.call", { fg = colors.blue })
				set("@method", { fg = colors.blue })
				set("@method.call", { fg = colors.blue })
				set("@constructor", { fg = colors.sapphire })

				-- Keywords
				set("@keyword", { fg = colors.mauve, italic = true })
				set("@keyword.function", { fg = colors.mauve, italic = true })
				set("@keyword.operator", { fg = colors.mauve })
				set("@keyword. return", { fg = colors.mauve, italic = true })
				set("@keyword.import", { fg = colors.mauve, italic = true })

				-- Types
				set("@type", { fg = colors.yellow })
				set("@type.builtin", { fg = colors.yellow })
				set("@type. definition", { fg = colors.yellow })
				set("@type. qualifier", { fg = colors.mauve, italic = true })

				-- Variables
				set("@variable", { fg = colors.text })
				set("@variable.builtin", { fg = colors.red, italic = true })
				set("@variable.parameter", { fg = colors.maroon, italic = true })
				set("@variable.member", { fg = colors.text })
				set("@parameter", { fg = colors.maroon, italic = true })
				set("@property", { fg = colors.text })
				set("@field", { fg = colors.text })

				-- ═══════════════════════════════════════════════════════════
				-- PYTHON - Soporte específico mejorado
				-- ═══════════════════════════════════════════════════════════
				set("@decorator. python", { fg = colors.pink, italic = true })
				set("@function.decorator. python", { fg = colors.pink, italic = true })
				set("@variable.builtin.python", { fg = colors.red, italic = true }) -- self, cls
				set("@type.builtin.python", { fg = colors.yellow }) -- int, str, etc
				set("@keyword.import.python", { fg = colors.mauve, italic = true })
				set("@keyword.exception.python", { fg = colors.red, italic = true })
				set("@string.documentation.python", { fg = colors.comment, italic = true })

				-- JavaScript/TypeScript
				set("@constructor.javascript", { fg = colors.sapphire })
				set("@constructor.typescript", { fg = colors.sapphire })
				set("@tag.javascript", { fg = colors.red })
				set("@tag. typescript", { fg = colors.red })
				set("@tag.tsx", { fg = colors.red })
				set("@tag.attribute. tsx", { fg = colors.peach })
				set("@tag.delimiter.tsx", { fg = colors.fg })

				-- Go
				set("@namespace. go", { fg = colors.yellow })
				set("@type.go", { fg = colors.yellow })
				set("@function.call.go", { fg = colors.blue })

				-- Rust
				set("@namespace.rust", { fg = colors.yellow })
				set("@type.rust", { fg = colors.yellow })
				set("@attribute.rust", { fg = colors.pink })

				-- HTML/XML
				set("@tag", { fg = colors.red })
				set("@tag. attribute", { fg = colors.peach })
				set("@tag.delimiter", { fg = colors.fg })

				-- CSS
				set("@property.css", { fg = colors.blue })
				set("@type.css", { fg = colors.peach })

				-- Markdown
				set("@text.title.markdown", { fg = colors.red, bold = true })
				set("@text.literal.markdown", { fg = colors.green })
				set("@text. uri", { fg = colors.sky, underline = true })
				set("@text.emphasis", { italic = true })
				set("@text.strong", { bold = true })

				-- Otros
				set("@namespace", { fg = colors.yellow })
				set("@label", { fg = colors.mauve })
				set("@operator", { fg = colors.sky })
				set("@punctuation. delimiter", { fg = colors.fg })
				set("@punctuation. bracket", { fg = colors.fg })
				set("@punctuation.special", { fg = colors.pink })
				set("@text.todo", { fg = colors.base, bg = colors.yellow, bold = true })
				set("@text.warning", { fg = colors.base, bg = colors.peach, bold = true })
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

				-- Alpha dashboard (mantener monocromático)
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
