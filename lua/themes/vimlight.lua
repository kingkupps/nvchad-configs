-- #ffffff background, black text, and vim's built-in `syntax on` palette
-- for a light background (see `:h highlight-groups` defaults in vim).

local M = {}

-- vim's default gui colors for a light background
local statement = "#a52a2a"
local comment = "#0000ff"
local identifier = "#008b8b"
local type_ = "#2e8b57"
local constant = "#ff00ff"
local preproc = "#a020f0"
local special = "#6a5acd"
local white = "#ffffff"
local black = "#000000"
local bg = "#ffffff"
local ignore = "#999999"

M.base_30 = {
  white = black,
  darker_black = "#e8e8e8",
  black = bg, --  nvim bg
  black2 = "#ebebeb",
  one_bg = "#e4e4e4",
  one_bg2 = "#dcdcdc",
  one_bg3 = "#d2d2d2",
  grey = "#c8c8c8",
  grey_fg = "#b4b4b4",
  grey_fg2 = "#a6a6a6",
  light_grey = ignore,
  red = "#d70000",
  baby_pink = constant,
  pink = preproc,
  line = "#d6d6d6", -- for lines like vertsplit
  green = type_,
  vibrant_green = "#00875f",
  blue = comment,
  nord_blue = "#3a5fcd",
  yellow = statement,
  sun = "#af8700",
  purple = preproc,
  dark_purple = "#8700af",
  teal = identifier,
  orange = "#d75f00",
  cyan = identifier,
  statusline_bg = "#ebebeb",
  lightbg = "#dcdcdc",
  pmenu_bg = statement,
  folder_bg = comment,
}

M.base_16 = {
  base00 = bg,
  base01 = "#ebebeb",
  base02 = "#d6d6d6",
  base03 = "#b4b4b4",
  base04 = ignore,
  base05 = black,
  base06 = "#1a1a1a",
  base07 = black,
  base08 = identifier,
  base09 = constant,
  base0A = type_,
  base0B = constant, -- vim links String -> Constant
  base0C = special,
  base0D = identifier, -- vim links Function -> Identifier
  base0E = statement,
  base0F = black, -- vim leaves punctuation/delimiters unhighlighted
}

-- base46 collapses several vim groups onto the same base16 slot (e.g. Statement
-- and Identifier both land on base08), so the faithful assignments are restored here.
M.polish_hl = {
  syntax = {
    Statement = { fg = statement },
    Conditional = { fg = statement },
    Repeat = { fg = statement },
    Label = { fg = statement },
    Keyword = { fg = statement },
    Exception = { fg = statement },
    Operator = { fg = black },

    Type = { fg = type_ },
    Typedef = { fg = type_ },
    StorageClass = { fg = type_ },
    Structure = { fg = type_ },

    PreProc = { fg = preproc },
    Define = { fg = preproc },
    Include = { fg = preproc },
    Macro = { fg = preproc },
    PreCondit = { fg = preproc },

    Identifier = { fg = identifier },
    Function = { fg = identifier },

    Constant = { fg = constant },
    String = { fg = constant },
    Character = { fg = constant },
    Number = { fg = constant },
    Boolean = { fg = constant },
    Float = { fg = constant },

    Special = { fg = special },
    SpecialChar = { fg = special },
    Tag = { fg = special },
    Delimiter = { fg = black },

    Todo = { fg = "#0000ff", bg = "#ffff00" },
    Underlined = { fg = comment, underline = true },
    Error = { fg = white, bg = "#ff0000" },
    Ignore = { fg = ignore },
  },

  treesitter = {
    ["@comment"] = { fg = comment },
    ["@comment.todo"] = { fg = "#0000ff", bg = "#ffff00" },

    ["@keyword"] = { fg = statement },
    ["@keyword.function"] = { fg = statement },
    ["@keyword.return"] = { fg = statement },
    ["@keyword.operator"] = { fg = statement },
    ["@keyword.conditional"] = { fg = statement },
    ["@keyword.conditional.ternary"] = { fg = statement },
    ["@keyword.repeat"] = { fg = statement },
    ["@keyword.exception"] = { fg = statement },
    ["@keyword.coroutine"] = { fg = statement },
    ["@keyword.storage"] = { fg = type_ },
    ["@keyword.import"] = { fg = preproc },
    ["@keyword.directive"] = { fg = preproc },
    ["@keyword.directive.define"] = { fg = preproc },

    ["@type"] = { fg = type_ },
    ["@type.builtin"] = { fg = type_ },
    ["@type.definition"] = { fg = type_ },
    ["@constructor"] = { fg = type_ },
    ["@attribute"] = { fg = preproc },

    ["@variable"] = { fg = black },
    ["@variable.parameter"] = { fg = black },
    ["@variable.builtin"] = { fg = identifier },
    ["@variable.member"] = { fg = identifier },
    ["@variable.member.key"] = { fg = identifier },
    ["@property"] = { fg = identifier },
    ["@module"] = { fg = identifier },

    ["@tag"] = { fg = statement },
    ["@tag.builtin"] = { fg = statement },
    ["@tag.attribute"] = { fg = type_ },
    ["@tag.delimiter"] = { fg = black },

    ["@operator"] = { fg = black },
    ["@punctuation.bracket"] = { fg = black },
    ["@punctuation.delimiter"] = { fg = black },
    ["@punctuation.special"] = { fg = special },

    ["@markup.heading"] = { fg = preproc },
    ["@markup.link.url"] = { fg = comment, underline = true },
  },

  nvimtree = {
    NvimTreeNormal = { bg = bg },
    NvimTreeNormalNC = { bg = bg },
    NvimTreeEndOfBuffer = { fg = bg },
    -- Paired with the half-block `vert` fillchar set for the tree window in autocmds.lua.
    NvimTreeWinSeparator = { fg = ignore, bg = bg },
  },

  defaults = {
    Cursor = { fg = white, bg = black },
    Comment = { fg = comment },
    Search = { fg = black, bg = "#ffff00" },
    IncSearch = { fg = white, bg = "#ff8c00" },
    MatchParen = { fg = black, bg = "#00ffff" },
    MatchWord = { fg = black, bg = "#00ffff" },
    Title = { fg = preproc },
    Directory = { fg = comment },
    SpecialKey = { fg = comment },
    NonText = { fg = "#b4b4b4" },
    Folded = { fg = "#00008b", bg = "#d6d6d6" },
    CursorLineNr = { fg = statement },
    ErrorMsg = { fg = white, bg = "#ff0000" },
    WarningMsg = { fg = "#ff0000" },
    MoreMsg = { fg = "#2e8b57" },
    Question = { fg = "#008000" },
  },
}

M.type = "light"

M = require("base46").override_theme(M, "vimlight")

return M
