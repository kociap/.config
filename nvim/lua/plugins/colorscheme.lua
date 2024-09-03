local colors = {
	bg = "#282828",
	fg = "#d3d3d3",
	bg_ruler = "#474747",
	fg_indentline = "#474747",
	fg_gutter = "#6e6e6e",
}

local scheme = {
	ruler = { bg = colors.bg_ruler },

	property = { fg = colors.fg },
}

-- return {
-- 	dir = "~/anoneme",
-- 	priority = 1000,
-- 	lazy = false,
-- 	opts = {},
-- }

return {
	"folke/tokyonight.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		style = "moon",
		styles = {
			comments = { italic = false },
			keywords = { italic = false },
		},
		on_colors = function(c)
			c["bg"] = colors.bg
			c["fg"] = colors.fg
			c["bg_ruler"] = colors.bg_ruler
			c["fg_indentline"] = colors.fg_indentline
			c["fg_gutter"] = colors.fg_gutter
			c["blue2"] = "#FF0000"
			c["green"] = "#8ae400"
			c["green3"] = "#c3e88d"
			c["comment"] = "#737ba6"
			c["keyword"] = "#b485ff"
		end,
		on_highlights = function(hl, c)
			hl["ColorColumn"] = scheme.ruler

			hl["Function"] = { fg = c.green }
			hl["Identifier"] = { fg = c.fg }
			hl["String"] = { fg = c.green3 }
			hl["Character"] = { fg = c.green3 }
			hl["PreProc"] = { fg = c.red }
			hl["@variable.parameter"] = { fg = c.fg }
			hl["@property"] = scheme.property
			hl["@comment.error"] = { fg = c.comment }
			hl["@comment.hint"] = { fg = c.comment }
			hl["@comment.info"] = { fg = c.comment }
			hl["@comment.note"] = { fg = c.comment }
			hl["@comment.todo"] = { fg = c.comment }
			hl["@comment.warning"] = { fg = c.comment }
			hl["@keyword"] = { fg = c.keyword }
			hl["@keyword.function"] = { fg = c.keyword }
			hl["@keyword.return"] = { fg = c.keyword }
			hl["@punctuation.delimiter"] = { fg = c.fg }
			-- Indent Blankline
			hl["IblIndent"] = { fg = c.fg_indentline, nocombine = true }
			hl["IblScope"] = { fg = c.blue1, nocombine = true }
			hl["IndentBlanklineChar"] = { fg = c.fg_indentline, nocombine = true }
			hl["IndentBlanklineContextChar"] = { fg = c.blue1, nocombine = true }
			-- CMP
			hl["CmpItemKindProperty"] = scheme.property
		end,
	},
}
