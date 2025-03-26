-- LaTeX Snippets for LuaSnip
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local tex = {}

-- Helper function to detect math context
local in_math = function()
  -- Adapt this based on your editor setup
  -- For VimTeX:
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
  -- For Treesitter:
  -- local node = vim.treesitter.get_node()
  -- return node and vim.tbl_contains({"math_environment"}, node:type())
end

-- Template snippets
tex.snippets = {
  -- Document templates
  s({trig = "notestemplate", descr = "Lecture Notes Template", snippetType = "autosnippet"}, {
    t({
      "\\documentclass{article}",
      "",
      "\\usepackage{amsmath, amsthm, amssymb, amsfonts}",
      "\\usepackage{thmtools}",
      "\\usepackage{graphicx}",
      "\\usepackage{setspace}",
      "\\usepackage{geometry}",
      "\\usepackage{float}",
      "\\usepackage{hyperref}",
      "\\usepackage[utf8]{inputenc}",
      "\\usepackage[english]{babel}",
      "\\usepackage{framed}",
      "\\usepackage[dvipsnames]{xcolor}",
      "\\usepackage{tcolorbox}",
      "",
      "\\colorlet{LightGray}{White!90!Periwinkle}",
      "\\colorlet{LightOrange}{Orange!15}",
      "\\colorlet{LightGreen}{Green!15}",
      "",
      "\\newcommand{\\HRule}[1]{\\rule{\\linewidth}{#1}}",
      "",
      "\\declaretheoremstyle[name=Theorem,]{thmsty}",
      "\\declaretheorem[style=thmsty,numberwithin=section]{theorem}",
      "\\tcolorboxenvironment{theorem}{colback=LightGray}",
      "",
      "\\declaretheoremstyle[name=Proposition,]{prosty}",
      "\\declaretheorem[style=prosty,numberlike=theorem]{proposition}",
      "\\tcolorboxenvironment{proposition}{colback=LightOrange}",
      "",
      "\\declaretheoremstyle[name=Principle,]{prcpsty}",
      "\\declaretheorem[style=prcpsty,numberlike=theorem]{principle}",
      "\\tcolorboxenvironment{principle}{colback=LightGreen}",
      "",
      "\\setstretch{1.2}",
      "\\geometry{",
      "    textheight=9in,",
      "    textwidth=5.5in,",
      "    top=1in,",
      "    headheight=12pt,",
      "    headsep=25pt,",
      "    footskip=30pt",
      "}",
      "",
      "% ------------------------------------------------------------------------------",
      "",
      "\\begin{document}",
      "",
      "% ------------------------------------------------------------------------------",
      "% Cover Page and ToC",
      "% ------------------------------------------------------------------------------",
      "",
      "\\title{ \\normalsize \\textsc{}",
      "		\\\\ [2.0cm]",
      "		\\HRule{1.5pt} \\\\",
      "		\\LARGE \\textbf{\\uppercase{Template Title}",
      "		\\HRule{2.0pt} \\\\ [0.6cm] \\LARGE{Subtitle} \\vspace*{10\\baselineskip}}",
      "		}",
      "\\date{}",
      "\\author{\\textbf{Author} \\\\ ",
      "		Who? \\\\",
      "		Where? \\\\",
      "		When?}",
      "",
      "\\maketitle",
      "\\newpage",
      "",
      "\\tableofcontents",
      "\\newpage",
      "",
      "% ------------------------------------------------------------------------------",
      "",
      "\\section{Examples}",
      "",
      "\\begin{theorem}",
      "    This is a theorem.",
      "\\end{theorem}",
      "",
      "\\begin{proposition}",
      "    This is a proposition.",
      "\\end{proposition}",
      "",
      "\\begin{principle}",
      "    This is a principle.",
      "\\end{principle}",
      "",
      "% Maybe I need to add one more part: Examples.",
      "% Set style and colour later.",
      "",
      "\\subsection{Pictures}",
      "",
      "\\begin{figure}[htbp]",
      "    \\center",
      "    \\includegraphics[scale=0.06]{img/photo.jpg}",
      "    \\caption{Sydney, NSW}",
      "\\end{figure}",
      "",
      "\\subsection{Citation}",
      "",
      "This is a citation\\cite{Eg}.",
      "",
      "\\newpage",
      "",
      "% ------------------------------------------------------------------------------",
      "% Reference and Cited Works",
      "% ------------------------------------------------------------------------------",
      "",
      "\\bibliographystyle{IEEEtran}",
      "\\bibliography{References.bib}",
      "",
      "% ------------------------------------------------------------------------------",
      "",
      "\\end{document}"
    }),
  }, {condition = line_begin}),

  s({trig = "hwtemplate", descr = "Basic Homework Template", snippetType = "autosnippet"}, {
    t("\\documentclass[12pt]{article}"),
    t({"", "", "\\usepackage[utf8]{inputenc}", "", "\\usepackage{latexsym,amsfonts,amssymb,amsthm,amsmath}", "", "\\setlength{\\parindent}{0in}", "\\setlength{\\oddsidemargin}{0in}", "\\setlength{\\textwidth}{6.5in}", "\\setlength{\\textheight}{8.8in}", "\\setlength{\\topmargin}{0in}", "\\setlength{\\headheight}{18pt}", "", "", "", "\\title{Math "}),
    i(1, "0"),
    t(" Weekly Homework "),
    i(2, "1"),
    t({"}", "\\author{"}),
    i(3, "2"),
    t({"}", "", "\\begin{document}", "", "\\maketitle", "", "\\vspace{0.5in}", "", "", "", "\\subsection*{Exercise 1}", "(Statement of problem goes here.)\\\\", "", "\\begin{proof}", "(Type your proof here.)", "\\end{proof}", "", "\\vspace{2in} %Leave space for comments!", "", "", "\\subsection*{Exercise 2}", "(Statement of problem goes here.)\\\\", "", "\\begin{proof}", "(Type your proof here.)", "\\end{proof}", "", "\\vspace{2in} %Leave more space for comments!", "", "", "", "", "", "", "", "\\end{document}"}),
  }, {condition = line_begin}),

  s({trig = "template", descr = "Basic template", snippetType = "autosnippet"}, {
    t({"\\documentclass[12pt]{article}", "", "\\usepackage[utf8]{inputenc}", "\\usepackage[T1]{fontenc}", "\\usepackage{textcomp}", "\\usepackage{amsmath, amssymb, latexsym, amsfonts, amsthm}", "", "\\setlength{\\parindent}{0in}", "\\setlength{\\oddsidemargin}{0in}", "\\setlength{\\textwidth}{6.5in}", "\\setlength{\\textheight}{8.8in}", "\\setlength{\\topmargin}{0in}", "\\setlength{\\headheight}{18pt}", "", "\\title{"}),
    i(1),
    t({"}", "\\author{Vivek Ramadhar}", "", "% figure support", "\\usepackage{import}", "\\usepackage{xifthen}", "\\pdfminorversion=7", "\\usepackage{pdfpages}", "\\usepackage{transparent}", "\\newcommand{\\incfig}[1]{%", "	\\def\\svgwidth{\\columnwidth}", "	\\import{./figures/}{#1.pdf_tex}", "}", "", "\\pdfsuppresswarningpagegroup=1", "", "\\begin{document}", "	\\maketitle", "	\\vspace{0.5in}", "	\\subsection*{1)}"}),
    i(0),
    t("\\end{document}"),
  }, {condition = line_begin}),

  -- Basic environments
  s({trig = "\\beg", descr = "begin{} / end{}", snippetType = "autosnippet"}, 
    fmta("\\begin{<>}\n\t<>\n\\end{<>}", {
      i(1),
      i(0),
      rep(1)
    })
  ),

  -- Higher priority snippets
  s({trig = "...", descr = "ldots", snippetType = "autosnippet"}, 
    {t("\\ldots")}
  ),

  -- Table and figure environments
  s({trig = "table", descr = "Table environment", snippetType = "autosnippet"}, {
    t("\\begin{table}["),
    i(1, "htpb"),
    t({"]", "\t\\centering", "\t\\caption{"}),
    i(2, "caption"),
    t({"}", "\t\\label{tab:"}),
    i(3, "label"),
    t({"}", "\t\\begin{tabular}{"}),
    i(5, "c"),
    t("}\n\t"),
    i(0),
    f(function(args, snip)
      local cols = args[1][1]:gsub("[^c|l|r]", "")
      local str = ""
      for i=1, #cols-1 do
        str = str .. " & "
      end
      return str
    end, {5}),
    t({"\n\t\\end{tabular}", "\\end{table}"}),
  }, {condition = line_begin}),

  s({trig = "fig", descr = "Figure environment", snippetType = "autosnippet"}, {
    t({"\\begin{figure}[", "\t"}),
    i(1, "htpb"),
    t({"]", "\t\\centering", "\t"}),
    i(2, "\\includegraphics[width=0.8\\textwidth]{"),
    i(3),
    t("}"),
    t({"\n\t\\caption{"}),
    i(4, "caption"),
    t({"}", "\t\\label{fig:"}),
    f(function(args)
      return args[1][1]:gsub("[^%w]", "-")
    end, {3}),
    t({"}", "\\end{figure}"}),
  }, {condition = line_begin}),

  -- List environments
  s({trig = "enum", descr = "Enumerate", snippetType = "autosnippet"}, 
    fmta("\\begin{enumerate}\n\t\\item <>\n\\end{enumerate}", {
      i(0)
    })
  ),

  s({trig = "item", descr = "Itemize", snippetType = "autosnippet"}, 
    fmta("\\begin{itemize}\n\t\\item <>\n\\end{itemize}", {
      i(0)
    })
  ),

  s({trig = "desc", descr = "Description", snippetType = "autosnippet"}, 
    fmta("\\begin{description}\n\t\\item[<>] <>\n\\end{description}", {
      i(1),
      i(0)
    })
  ),

  -- Packages and logical operators
  s({trig = "pac", descr = "Package", snippetType = "autosnippet"}, 
    fmta("\\usepackage[<>]{<>}<>", {
      i(1, "options"),
      i(2, "package"),
      i(0)
    })
  ),

  s({trig = "=>", descr = "implies", snippetType = "autosnippet"}, 
    {t("\\implies")}
  ),

  s({trig = "=<", descr = "implied by", snippetType = "autosnippet"}, 
    {t("\\impliedby")}
  ),

  -- Math context dependent snippets
  s({trig = "iff", descr = "iff", snippetType = "autosnippet"}, 
    {t("\\iff")}
  , {condition = in_math}),

  -- Inline and display math
  s({trig = "mk", descr = "Math", snippetType = "autosnippet"}, {
    t("$"),
    i(1),
    t("$"),
    f(function(args)
      if args[1][1] and string.sub(args[1][1], 1, 1) ~= "," and 
         string.sub(args[1][1], 1, 1) ~= "." and
         string.sub(args[1][1], 1, 1) ~= "?" and
         string.sub(args[1][1], 1, 1) ~= "-" and
         string.sub(args[1][1], 1, 1) ~= " " then
        return " "
      else
        return ""
      end
    end, {2}),
    i(2)
  }),

  s({trig = "dm", descr = "Math", snippetType = "autosnippet"}, 
    fmta("\\[\n<>\n.\\] <>", {
      i(1),
      i(0)
    })
  ),

  s({trig = "ali", descr = "Align", snippetType = "autosnippet"}, 
    fmta("\\begin{align*}\n\t<>\n.\\end{align*}", {
      i(1)
    })
  ),

  -- Fractions
  s({trig = "//", descr = "Fraction", snippetType = "autosnippet"}, 
    fmta("\\frac{<>}{<>}<>", {
      i(1),
      i(2),
      i(0)
    })
  , {condition = in_math}),

  s({trig = "/", descr = "Fraction", snippetType = "autosnippet"}, 
    fmta("\\frac{<>}{<>}<>", {
      f(function(_, snip) return snip.env.TM_SELECTED_TEXT[1] or "" end),
      i(1),
      i(0)
    })
  ),

  -- Advanced regex-based snippets
  s({trig = "([0-9]+)/", regTrig = true, descr = "Symbol fraction", snippetType = "autosnippet"}, 
    fmta("\\frac{<>}{<>}<>", {
      f(function(_, snip) return snip.captures[1] end),
      i(1),
      i(0)
    })
  , {condition = in_math}),

  s({trig = "([a-zA-Z]+)/", regTrig = true, descr = "Symbol fraction", snippetType = "autosnippet"}, 
    fmta("\\frac{<>}{<>}<>", {
      f(function(_, snip) return snip.captures[1] end),
      i(1),
      i(0)
    })
  , {condition = in_math}),

  -- Parentheses fractions
  s({trig = ".*%)/", regTrig = true, descr = "() frac", snippetType = "autosnippet"}, {
    f(function(_, snip)
      local str = snip.captures[1]
      local result = ""
      local depth = 0
      local i = #str
      
      while i > 0 do
        if string.sub(str, i, i) == ")" then depth = depth + 1 end
        if string.sub(str, i, i) == "(" then depth = depth - 1 end
        if depth == 0 then break end
        i = i - 1
      end
      
      result = string.sub(str, 1, i-1) .. "\\frac{" .. string.sub(str, i+1, -2) .. "}"
      return result
    end, {}),
    t("{"),
    i(1),
    t("}"),
    i(0)
  }, {condition = in_math}),

  -- Auto subscript
  s({trig = "([A-Za-z])(%d)", regTrig = true, descr = "auto subscript", snippetType = "autosnippet"}, 
    fmta("<>_<>", {
      f(function(_, snip) return snip.captures[1] end),
      f(function(_, snip) return snip.captures[2] end)
    })
  , {condition = in_math}),

  s({trig = "([A-Za-z])_(%d%d)", regTrig = true, descr = "auto subscript2", snippetType = "autosnippet"}, 
    fmta("<>_{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      f(function(_, snip) return snip.captures[2] end)
    })
  , {condition = in_math}),

  -- Delimiters and brackets
  s({trig = "ceil", descr = "ceil", snippetType = "autosnippet"}, 
    fmta("\\left\\lceil <> \\right\\rceil <>", {
      i(1),
      i(0)
    })
  , {condition = in_math}),

  s({trig = "floor", descr = "floor", snippetType = "autosnippet"}, 
    fmta("\\left\\lfloor <> \\right\\rfloor<>", {
      i(1),
      i(0)
    })
  , {condition = in_math}),

  s({trig = "pmat", descr = "pmat", snippetType = "autosnippet"}, 
    fmta("\\begin{pmatrix} <> \\end{pmatrix} <>", {
      i(1),
      i(0)
    })
  ),

  s({trig = "bmat", descr = "bmat", snippetType = "autosnippet"}, 
    fmta("\\begin{bmatrix} <> \\end{bmatrix} <>", {
      i(1),
      i(0)
    })
  ),

  s({trig = "%(%)}", regTrig = true, descr = "left( right)", snippetType = "autosnippet"}, 
    fmta("\\left( <> \\right) <>", {
      i(1),
      i(0)
    })
  , {condition = in_math}),

  -- More math snippets
  s({trig = "conj", descr = "conjugate", snippetType = "autosnippet"}, 
    fmta("\\overline{<>}<>", {
      i(1),
      i(0)
    })
  , {condition = in_math}),

  s({trig = "sq", descr = "sqrt", snippetType = "autosnippet"}, 
    fmta("\\sqrt{<>} <>", {
      i(1),
      i(0)
    })
  , {condition = in_math}),

  s({trig = "sr", descr = "^2", snippetType = "autosnippet"}, 
    {t("^2")}
  , {condition = in_math}),

  s({trig = "cb", descr = "^3", snippetType = "autosnippet"}, 
    {t("^3")}
  , {condition = in_math}),

  s({trig = "td", descr = "to the ... power", snippetType = "autosnippet"}, 
    fmta("^{<>}<>", {
      i(1),
      i(0)
    })
  , {condition = in_math}),

  -- Quantifiers
  s({trig = "EE", descr = "exists", snippetType = "autosnippet"}, 
    {t("\\exists ")}
  , {condition = in_math}),

  s({trig = "AA", descr = "forall", snippetType = "autosnippet"}, 
    {t("\\forall ")}
  , {condition = in_math}),

  -- Subscripts for variables
  s({trig = "xnn", descr = "x_n", snippetType = "autosnippet"}, 
    {t("x_{n}")}
  , {condition = in_math}),

  s({trig = "ynn", descr = "y_n", snippetType = "autosnippet"}, 
    {t("y_{n}")}
  , {condition = in_math}),

  s({trig = "xii", descr = "x_i", snippetType = "autosnippet"}, 
    {t("x_{i}")}
  , {condition = in_math}),

  s({trig = "yii", descr = "y_i", snippetType = "autosnippet"}, 
    {t("y_{i}")}
  , {condition = in_math}),

  -- Greek letters and operators
  s({trig = "ooo", descr = "infinity", snippetType = "autosnippet"}, 
    {t("\\infty")}
  ),

  s({trig = "<=", descr = "leq", snippetType = "autosnippet"}, 
    {t("\\le ")}
  ),

  s({trig = ">=", descr = "geq", snippetType = "autosnippet"}, 
    {t("\\ge ")}
  ),
  
  -- Special math functions
  s({trig = "lim", descr = "limit", snippetType = "autosnippet"}, 
    fmta("\\lim_{<> \\to <>} ", {
      i(1, "n"),
      i(2, "\\infty")
    })
  ),

  -- Math functions and operators
  s({trig = "->", descr = "to", snippetType = "autosnippet"}, 
    {t("\\to ")}
  , {condition = in_math}),

  s({trig = "<->", descr = "leftrightarrow", snippetType = "autosnippet"}, 
    {t("\\leftrightarrow")}
  , {condition = in_math}),

  s({trig = "!>", descr = "mapsto", snippetType = "autosnippet"}, 
    {t("\\mapsto ")}
  , {condition = in_math}),

  s({trig = "invs", descr = "inverse", snippetType = "autosnippet"}, 
    {t("^{-1}")}
  , {condition = in_math}),

  s({trig = "\\\\\\", descr = "setminus", regTrig = false, snippetType = "autosnippet"}, 
    {t("\\setminus")}
  , {condition = in_math}),

  -- Set theory
  s({trig = "set", descr = "set", snippetType = "autosnippet"}, 
    fmta("\\{<>\\} <>", {
      i(1),
      i(0)
    })
  , {condition = in_math}),

  s({trig = "cc", descr = "subset", snippetType = "autosnippet"}, 
    {t("\\subset ")}
  , {condition = in_math}),

  s({trig = "notin", descr = "not in", snippetType = "autosnippet"}, 
    {t("\\not\\in ")}
  ),

  s({trig = "inn", descr = "in", snippetType = "autosnippet"}, 
    {t("\\in ")}
  , {condition = in_math}),

  -- Number sets
  s({trig = "NN", descr = "N", snippetType = "autosnippet"}, 
    {t("\\N")}
  ),

  s({trig = "RR", descr = "real", snippetType = "autosnippet"}, 
    {t("\\mathbb{R}")}
  ),

  s({trig = "QQ", descr = "Q", snippetType = "autosnippet"}, 
    {t("\\mathbb{Q}")}
  ),

  s({trig = "ZZ", descr = "Z", snippetType = "autosnippet"}, 
    {t("\\mathbb{Z}")}
  ),

  -- Text formatting in math
  s({trig = "bl", descr = "boldface text", snippetType = "autosnippet"}, 
    fmta("\\textbf{<>}<>", {
      i(1),
      i(0)
    })
  , {condition = in_math}),

  s({trig = "it", descr = "italic text", snippetType = "autosnippet"}, 
    fmta("\\textit{<>}<>", {
      i(1),
      i(0)
    })
  , {condition = in_math}),

  s({trig = "tt", descr = "text", snippetType = "autosnippet"}, 
    fmta("\\text{<>}<>", {
      i(1),
      i(0)
    })
  , {condition = in_math}),

  -- Environments
  s({trig = "case", descr = "cases", snippetType = "autosnippet"}, 
    fmta("\\begin{cases}\n\t<>\n\\end{cases}", {
      i(1)
    })
  , {condition = in_math})
}

-- Return the snippets table
return tex.snippets
