local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- Document structure
  s("beg", {
    t("\\begin{"), i(1), t({"}", "\t"}),
    i(0),
    t({"", "\\end{"}), f(function(args) return args[1][1] end, {1}), t("}")
  }),
  
  -- Math environments
  s("mk", {
    t("$"), i(1), t("$"), i(0)
  }),
  
  s("dm", {
    t({"\\[", "\t"}), i(1), 
    t({"", ".\\]"}), i(0)
  }),
  
  s("ali", {
    t({"\\begin{align*}", "\t"}), i(1),
    t({"", ".\\end{align*}"}), i(0)
  }),
  
  -- Lists
  s("enum", {
    t({"\\begin{enumerate}", "\t\\item "}), i(1), 
    t({"", "\\end{enumerate}"}), i(0)
  }),
  
  s("item", {
    t({"\\begin{itemize}", "\t\\item "}), i(1), 
    t({"", "\\end{itemize}"}), i(0)
  }),
  
  s("desc", {
    t({"\\begin{description}", "\t\\item["}), i(1), t({"]", "\t"}), i(2),
    t({"", "\\end{description}"}), i(0)
  }),
  
  -- Common math operations
  s("//", {
    t("\\frac{"), i(1), t("}{"), i(2), t("}"), i(0)
  }),
  
  s("sum", {
    t("\\sum_{"), i(1, "n=1"), t("}^{"), i(2, "\\infty"), t("} "), i(0)
  }),
  
  s("lim", {
    t("\\lim_{"), i(1, "n"), t(" \\to "), i(2, "\\infty"), t("} "), i(0)
  }),
  
  s("prod", {
    t("\\prod_{"), i(1, "n=1"), t("}^{"), i(2, "\\infty"), t("} "), i(0)
  }),
  
  s("part", {
    t("\\frac{\\partial "), i(1, "f"), t("}{\\partial "), i(2, "x"), t("}"), i(0)
  }),
  
  -- Brackets with proper sizing
  s("()", {
    t("\\left( "), i(1), t(" \\right)"), i(0)
  }),
  
  s("[]", {
    t("\\left[ "), i(1), t(" \\right]"), i(0)
  }),
  
  s("lr{", {
    t("\\left\\{ "), i(1), t(" \\right\\}"), i(0)
  }),
  
  s("lr|", {
    t("\\left| "), i(1), t(" \\right|"), i(0)
  }),
  
  -- Common symbols
  s("...", { t("\\ldots") }),
  s("=>", { t("\\implies") }),
  s("=<", { t("\\impliedby") }),
  s("iff", { t("\\iff") }),
  s("<=", { t("\\le ") }),
  s(">=", { t("\\ge ") }),
  s("!=", { t("\\neq ") }),
  s("->", { t("\\to ") }),
  s("<->", { t("\\leftrightarrow") }),
  
  -- Sets and logic
  s("inn", { t("\\in ") }),
  s("notin", { t("\\not\\in ") }),
  s("cc", { t("\\subset ") }),
  s("set", { t("\\{"), i(1), t("\\}"), i(0) }),
  s("emptyset", { t("\\emptyset") }),
  s("cup", { t("\\cup ") }),
  s("cap", { t("\\cap ") }),
  s("EE", { t("\\exists ") }),
  s("AA", { t("\\forall ") }),
  
  -- Number sets
  s("RR", { t("\\mathbb{R}") }),
  s("QQ", { t("\\mathbb{Q}") }),
  s("ZZ", { t("\\mathbb{Z}") }),
  s("NN", { t("\\mathbb{N}") }),
  
  -- Common functions
  s("sqrt", { t("\\sqrt{"), i(1), t("}"), i(0) }),
  s("conj", { t("\\overline{"), i(1), t("}"), i(0) }),
  
  -- Figures and tables
  s("fig", {
    t({"\\begin{figure}["}), i(1, "htpb"), t({"]", "\t\\centering", "\t"}),
    i(2, "\\includegraphics[width=0.8\\textwidth]{"), i(3, "filename"), t({"}",
    "\t\\caption{"}), i(4), t({"}", "\t\\label{fig:"}), i(5), t({"}",
    "\\end{figure}"}), i(0)
  }),
  
  s("table", {
    t({"\\begin{table}["}), i(1, "htpb"), t({"]", "\t\\centering", "\t\\caption{"}), 
    i(2), t({"}", "\t\\label{tab:"}), i(3), t({"}",
    "\t\\begin{tabular}{"}), i(4, "c"), t({"}",
    "\t"}), i(0), t({"",
    "\t\\end{tabular}", "\\end{table}"})
  }),
  
  -- Text formatting
  s("bf", { t("\\textbf{"), i(1), t("}"), i(0) }),
  s("it", { t("\\textit{"), i(1), t("}"), i(0) }),
  s("tt", { t("\\text{"), i(1), t("}"), i(0) }),
  s("ul", { t("\\underline{"), i(1), t("}"), i(0) }),
  s("\n", { t("\\newline{"), i(1), t("}"), i(0) }),
  
  -- Package include
  s("pac", { t("\\usepackage["), i(1, "options"), t("]{"), i(2, "package"), t("}"), i(0) }),
}
