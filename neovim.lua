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
          base = "#1e1e2e",
          mantle = "#181825",
          crust = "#11111b",
          panel = "NONE",
          fg = "#cdd6f4",
          border = "#cdd6f4",
          subtle = "#6c7086",
          selection_bg = "#cdd6f4",
          selection_fg = "#1e1e2e",
          cursor = "#cdd6f4",
          cursor_text = "#1e1e2e",

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

          text = "#cdd6f4",
          subtext1 = "#bac2de",
          subtext0 = "#a6adc8",

          overlay2 = "#9399b2",
          overlay1 = "#7f849c",
          overlay0 = "#6c7086",
          surface2 = "#585b70",
          surface1 = "#45475a",
          surface0 = "#313244",

          comment = "#6c7086",
        }

        local function set(g, o)
          vim.api.nvim_set_hl(0, g, o)
        end

        vim.cmd("highlight clear")
        local P = { bg = colors.panel }

        -- Core/editor
        set("Normal", vim.tbl_extend("force", { fg = colors.fg }, P))
        set("NormalNC", vim.tbl_extend("force", { fg = colors.fg }, P))
        set("SignColumn", vim.tbl_extend("force", { fg = colors.fg }, P))
        set("FoldColumn", vim.tbl_extend("force", { fg = colors.fg }, P))
        set("LineNr", vim.tbl_extend("force", { fg = colors.subtle }, P))
        set("CursorLineNr", vim.tbl_extend("force", { fg = colors.fg }, P))
        set("CursorLine", P)
        set("CursorColumn", P)

        -- Floats
        set("NormalFloat", vim.tbl_extend("force", { fg = colors.fg }, P))
        set("FloatBorder", vim.tbl_extend("force", { fg = colors.border }, P))
        set("Pmenu", vim.tbl_extend("force", { fg = colors.fg }, P))
        set("PmenuSel", { fg = colors.selection_fg, bg = colors.selection_bg })
        set("PmenuSbar", { bg = colors.subtle })
        set("PmenuThumb", { bg = colors.fg })

        -- Statusline / tabs
        set("StatusLine", vim.tbl_extend("force", { fg = colors.fg }, P))
        set("StatusLineNC", vim.tbl_extend("force", { fg = colors.subtle }, P))
        set("TabLine", vim.tbl_extend("force", { fg = colors.subtle }, P))
        set("TabLineFill", P)
        set("TabLineSel", { fg = colors.selection_fg, bg = colors.selection_bg })

        -- Separators
        set("WinSeparator", vim.tbl_extend("force", { fg = colors.border }, P))
        set("VertSplit", vim.tbl_extend("force", { fg = colors.border }, P))

        -- Visual & folds
        set("Visual", { bg = colors.selection_bg, fg = colors.selection_fg })
        set("VisualNOS", { bg = colors.subtle })
        set("Folded", vim.tbl_extend("force", { fg = colors.comment, italic = true }, P))

        -------------------------------------------------------------------------
        -- Syntax Highlighting
        -------------------------------------------------------------------------

        set("Comment", { fg = colors.comment, italic = true })

        -- Strings
        set("String", { fg = colors.yellow })
        set("Character", { fg = colors.yellow })

        -- Numbers & constants
        set("Number", { fg = colors.peach })
        set("Float", { fg = colors.peach })
        set("Boolean", { fg = colors.peach })
        set("Constant", { fg = colors.peach })

        -- Functions
        set("Function", { fg = colors.blue, bold = true })
        set("FunctionBuiltin", { fg = colors.blue })

        -- Keywords
        set("Keyword", { fg = colors.mauve, italic = true })
        set("Statement", { fg = colors.mauve })
        set("Conditional", { fg = colors.mauve, italic = true })
        set("Repeat", { fg = colors.mauve, italic = true })
        set("Label", { fg = colors.mauve })
        set("Exception", { fg = colors.red, italic = true })

        -- Operators
        set("Operator", { fg = colors.sky })
        set("Delimiter", { fg = colors.fg })

        -- Types
        set("Type", { fg = colors.yellow })
        set("StorageClass", { fg = colors.mauve, italic = true })
        set("Structure", { fg = colors.yellow })
        set("Typedef", { fg = colors.yellow })

        -- Identifiers
        set("Identifier", { fg = colors.text })

        -- Preprocessor
        set("PreProc", { fg = colors.pink })
        set("Include", { fg = colors.pink, italic = true })
        set("Define", { fg = colors.pink })
        set("Macro", { fg = colors.pink })

        ----------------------------------------------------------------------------
        -- Treesitter — corregidas TODAS las entradas con nombres inválidos
        ----------------------------------------------------------------------------

        set("@comment", { fg = colors.comment, italic = true })
        set("@constant", { link = "Constant" })
        set("@constant.builtin", { fg = colors.peach })

        set("@string", { fg = colors.yellow })
        set("@string.escape", { fg = colors.pink })
        set("@string.special", { fg = colors.green })

        set("@number", { link = "Number" })
        set("@boolean", { link = "Boolean" })

        set("@function", { fg = colors.blue, bold = true })
        set("@function.builtin", { fg = colors.blue })
        set("@function.call", { fg = colors.blue })
        set("@method", { fg = colors.blue })
        set("@method.call", { fg = colors.blue })
        set("@constructor", { fg = colors.sapphire })

        set("@keyword", { fg = colors.mauve, italic = true })
        set("@keyword.function", { fg = colors.mauve, italic = true })
        set("@keyword.operator", { fg = colors.mauve })
        set("@keyword.return", { fg = colors.mauve, italic = true })
        set("@keyword.import", { fg = colors.mauve, italic = true })

        set("@type", { fg = colors.yellow })
        set("@type.builtin", { fg = colors.yellow })
        set("@type.definition", { fg = colors.yellow })
        set("@type.qualifier", { fg = colors.mauve, italic = true })

        set("@variable", { fg = colors.text })
        set("@variable.builtin", { fg = colors.red, italic = true })
        set("@variable.parameter", { fg = colors.maroon, italic = true })
        set("@variable.member", { fg = colors.text })
        set("@parameter", { fg = colors.maroon, italic = true })

        -- Python
        set("@decorator.python", { fg = colors.pink, italic = true })
        set("@function.decorator.python", { fg = colors.pink })
        set("@variable.builtin.python", { fg = colors.red, italic = true })
        set("@keyword.import.python", { fg = colors.mauve, italic = true })
        set("@keyword.exception.python", { fg = colors.red, italic = true })
        set("@string.documentation.python", { fg = colors.comment, italic = true })

        -- JavaScript/TS
        set("@constructor.javascript", { fg = colors.sapphire })
        set("@constructor.typescript", { fg = colors.sapphire })
        set("@tag.javascript", { fg = colors.red })
        set("@tag.typescript", { fg = colors.red })
        set("@tag.tsx", { fg = colors.red })
        set("@tag.attribute.tsx", { fg = colors.peach })
        set("@tag.delimiter.tsx", { fg = colors.fg })

        -- Go
        set("@namespace.go", { fg = colors.yellow })
        set("@type.go", { fg = colors.yellow })
        set("@function.call.go", { fg = colors.blue })

        -- Rust
        set("@namespace.rust", { fg = colors.yellow })
        set("@type.rust", { fg = colors.yellow })
        set("@attribute.rust", { fg = colors.pink })

        -- HTML / XML
        set("@tag", { fg = colors.red })
        set("@tag.attribute", { fg = colors.peach })
        set("@tag.delimiter", { fg = colors.fg })

        -------------------------------------------------------------------------
        -- Search
        -------------------------------------------------------------------------
        set("Search", { fg = colors.base, bg = colors.fg })
        set("IncSearch", { fg = colors.base, bg = colors.fg, bold = true })
        set("MatchParen", { fg = colors.fg, bg = colors.subtle, bold = true })

        -------------------------------------------------------------------------
        -- Dashboard (Alpha)
        -------------------------------------------------------------------------
        set("AlphaHeader", { fg = colors.fg })
        set("AlphaButtons", { fg = colors.fg })
        set("AlphaShortcut", { fg = colors.fg })
        set("AlphaFooter", { fg = colors.fg })

        -------------------------------------------------------------------------
        -- Enforce consistent background
        -------------------------------------------------------------------------
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
