local gl = require("galaxyline")
local gls = gl.section
gl.short_line_list = {"LuaTree", "vista", "dbui","dashboard"}


local colors = {
    bg       = "NONE",
    line_bg  = "NONE",
    fg       = "#D8DEE9",
    fg_green = "#a4e400",
    blue     = "#22262C",
    red      = "#f92672",
    lightbg  = "#232526",
    grey     = '#c0c0c0',
    white    = '#FFFFFF',
    yellow   = '#ffff87',
    purple   = '#af87ff',
    green    = '#A4E400',
    cyan     = '#62D8F1',
    magenta  = '#F92672',
    orange   = '#FF9700',
    pumpkin  = '#ef5939',
}

local function mode_color()
    local mode_color_bg = {
        n     = colors.magenta,
        i     = colors.yellow,
        v     = colors.cyan, [''] = colors.cyan, V=colors.cyan,
        c     = colors.purple, cv = colors.purple,ce=colors.purple,
        no    = colors.magenta,
        s     = colors.green, S=colors.green, [''] = colors.green,
        ic    = colors.yellow,
        R     = colors.magenta, Rv = colors.magenta,
        r     = colors.orange, rm = colors.orange, ['r?'] = colors.orange,
        ['!'] = colors.pumpkin,t = colors.pumpkin
    }
    return mode_color_bg[vim.fn.mode()]
end

local function fg_color(bg_color)
    if bg_color == colors.magenta or bg_color == colors.purple then
        return colors.white
    else
        return colors.lightbg
    end
end



gls.left[1] = {
    leftRounded = {
        provider = function()
            vim.api.nvim_command('hi GalaxyleftRounded guifg='..mode_color())
            return ""
        end,
        highlight = {colors.bg, colors.bg}
    }
}

gls.left[2] = {
    ViMode = {
        provider = function()
            local colorbg = mode_color()
            local colorfg = fg_color(colorbg)
            vim.api.nvim_command('hi GalaxyViMode guibg='..colorbg)
            vim.api.nvim_command('hi GalaxyViMode guifg='..colorfg)
            return "   "
        end,
        highlight = {colors.white, colors.cyan},
    }
}

gls.left[3] = {
    FileIcon = {
        provider = function()
            return '  '..require('galaxyline.provider_fileinfo').get_file_icon()
        end,
        condition = buffer_not_empty,
        highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.lightbg},
    }
}

gls.left[4] = {
    FileName = {
        provider = {"FileName", "FileSize"},
        condition = buffer_not_empty,
        highlight = {colors.fg, colors.lightbg}
    }
}

gls.left[5] = {
    teech = {
        provider = function()
            return ""
        end,
        separator = " ",
        highlight = {colors.lightbg, colors.bg}
    }
}

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
        return true
    end
    return false
end

gls.left[6] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "   ",
        highlight = {colors.yellow, colors.line_bg}
    }
}

gls.left[7] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = " ",
        highlight = {colors.orange, colors.line_bg}
    }
}

gls.left[8] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = " ",
        highlight = {colors.red, colors.line_bg}
    }
}

gls.left[9] = {
    LeftEnd = {
        provider = function()
            return " "
        end,
        separator = " ",
        separator_highlight = {colors.line_bg, colors.line_bg},
        highlight = {colors.line_bg, colors.line_bg}
    }
}

gls.left[10] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {colors.red, colors.bg}
    }
}

gls.left[11] = {
    Space = {
        provider = function()
            return " "
        end,
        highlight = {colors.line_bg, colors.line_bg}
    }
}

gls.left[12] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = {colors.orange, colors.bg}
    }
}

gls.right[1] = {
    GitIcon = {
        provider = function()
            return "   "
        end,
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.green, colors.line_bg}
    }
}

gls.right[2] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.green, colors.line_bg}
    }
}

gls.right[3] = {
    right_LeftRounded = {
        provider = function()
            vim.api.nvim_command('hi Galaxyright_LeftRounded guifg='..mode_color())
            return ""
        end,
        separator = " ",
        separator_highlight = {colors.bg, colors.bg},
        highlight = {colors.red, colors.bg}
    }
}

gls.right[4] = {
    SiMode = {
        provider = function()
            local colorbg = mode_color()
            local colorfg = fg_color(colorbg)
            vim.api.nvim_command('hi GalaxySiMode guibg='..colorbg)
            vim.api.nvim_command('hi GalaxySiMode guifg='..colorfg)
            local alias = {
                n = "NORMAL",
                i = "INSERT",
                c = "COMMAND",
                v = "VISUAL",
                V = "V-LINE",
                [""] = "V-BLOCK",
                R = "REPLACE",
                s = "SELECT",
            }
            return alias[vim.fn.mode()]
        end,
        highlight = {colors.light_bg, colors.red,'bold'}
    }
}


gls.right[5] = {
    rightRounded = {
        provider = function()
            vim.api.nvim_command('hi GalaxyrightRounded guifg='..mode_color())
            return " "
        end,
        highlight = {colors.fg, colors.bg}
    }
}
