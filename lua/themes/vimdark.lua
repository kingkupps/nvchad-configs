-- Pure black background, white text, and vim's built-in `syntax on` palette
-- for a dark background (see `:h highlight-groups` defaults in vim).

local M = {}

-- vim's default gui colors for a dark background
local statement = "#ffff60"
local comment = "#80a0ff"
local identifier = "#40ffff"
local type_ = "#60ff60"
local constant = "#ffa0a0"
local preproc = "#ff80ff"
local special = "#ffa500"
local white = "#ffffff"
local black = "#000000"
local ignore = "#666666"

M.base_30 = {
  white = white,
  darker_black = black,
  black = black, --  nvim bg
  black2 = "#0d0d0d",
  one_bg = "#121212",
  one_bg2 = "#1a1a1a",
  one_bg3 = "#242424",
  grey = "#3a3a3a",
  grey_fg = "#4e4e4e",
  grey_fg2 = "#5a5a5a",
  light_grey = ignore,
  red = "#ff5f5f",
  baby_pink = constant,
  pink = preproc,
  line = "#262626", -- for lines like vertsplit
  green = type_,
  vibrant_green = "#87ff87",
  blue = comment,
  nord_blue = "#6a8fe8",
  yellow = statement,
  sun = "#ffff87",
  purple = preproc,
  dark_purple = "#d75fd7",
  teal = "#008b8b",
  orange = special,
  cyan = identifier,
  statusline_bg = "#0d0d0d",
  lightbg = "#1a1a1a",
  pmenu_bg = statement,
  folder_bg = comment,
}

M.base_16 = {
  base00 = black,
  base01 = "#0d0d0d",
  base02 = "#303030",
  base03 = "#4e4e4e",
  base04 = ignore,
  base05 = white,
  base06 = "#f8f8f8",
  base07 = white,
  base08 = identifier,
  base09 = constant,
  base0A = type_,
  base0B = constant, -- vim links String -> Constant
  base0C = special,
  base0D = identifier, -- vim links Function -> Identifier
  base0E = statement,
  base0F = white, -- vim leaves punctuation/delimiters unhighlighted
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
    Operator = { fg = white },

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
    Delimiter = { fg = white },

    Todo = { fg = "#0000ff", bg = statement },
    Underlined = { fg = comment, underline = true },
    Error = { fg = white, bg = "#ff0000" },
    Ignore = { fg = ignore },
  },

  treesitter = {
    ["@comment"] = { fg = comment },
    ["@comment.todo"] = { fg = "#0000ff", bg = statement },

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

    ["@variable"] = { fg = white },
    ["@variable.parameter"] = { fg = white },
    ["@variable.builtin"] = { fg = identifier },
    ["@variable.member"] = { fg = identifier },
    ["@variable.member.key"] = { fg = identifier },
    ["@property"] = { fg = identifier },
    ["@module"] = { fg = identifier },

    ["@tag"] = { fg = statement },
    ["@tag.builtin"] = { fg = statement },
    ["@tag.attribute"] = { fg = type_ },
    ["@tag.delimiter"] = { fg = white },

    ["@operator"] = { fg = white },
    ["@punctuation.bracket"] = { fg = white },
    ["@punctuation.delimiter"] = { fg = white },
    ["@punctuation.special"] = { fg = special },

    ["@markup.heading"] = { fg = preproc },
    ["@markup.link.url"] = { fg = comment, underline = true },
  },

  defaults = {
    Comment = { fg = comment },
    Search = { fg = black, bg = statement },
    IncSearch = { fg = black, bg = special },
    MatchParen = { fg = white, bg = "#008b8b" },
    MatchWord = { fg = white, bg = "#008b8b" },
    Title = { fg = preproc },
    Directory = { fg = identifier },
    SpecialKey = { fg = identifier },
    NonText = { fg = "#4e4e4e" },
    Folded = { fg = identifier, bg = "#1a1a1a" },
    CursorLineNr = { fg = statement },
    ErrorMsg = { fg = white, bg = "#ff0000" },
    WarningMsg = { fg = "#ff5f5f" },
    MoreMsg = { fg = "#2e8b57" },
    Question = { fg = "#00ff00" },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "vimdark")

return M
