local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- Divisibility
  s("div", { t("\\mid ") }),
  s("ndivs", { t("\\nmid ") }),
  
  -- Congruences
  s("cong", { t("\\equiv ") }),
  s("mod", { t("\\bmod ") }),
  s("pmod", { t("\\pmod{"), i(1), t("}"), i(0) }),
  
  -- Common number theory functions
  s("gcd", { t("\\gcd("), i(1), t(", "), i(2), t(")"), i(0) }),
  s("lcm", { t("\\text{lcm}("), i(1), t(", "), i(2), t(")"), i(0) }),
  
  -- Primes and factorization
  s("prime", { t("\\mathcal{P}") }),
  s("PP", { t("\\mathbb{P}") }), -- Set of prime numbers
  s("legendre", { t("\\left(\\frac{"), i(1), t("}{"), i(2), t("}\\right)"), i(0) }), -- Legendre symbol
  s("jacobi", { t("\\left(\\frac{"), i(1), t("}{"), i(2), t("}\\right)"), i(0) }),   -- Jacobi symbol
  
  -- Floor and ceiling functions
  s("floor", { t("\\lfloor "), i(1), t(" \\rfloor"), i(0) }),
  s("ceil", { t("\\lceil "), i(1), t(" \\rceil"), i(0) }),
  
  -- Diophantine equations
  s("dioph", { 
    t({"\\begin{align*}", "\t"}), 
    i(1, "ax + by"), t(" &= "), i(2, "c"), t({"", "\\end{align*}"}), 
    i(0) 
  }),
  
  -- Modular arithmetic operations
  s("invmod", { t(""), i(1, "a"), t("^{-1} \\bmod "), i(2, "n"), i(0) }),
  s("powmod", { t(""), i(1, "a"), t("^{"), i(2, "b"), t("} \\bmod "), i(3, "n"), i(0) }),
  
  -- Chinese remainder theorem
  s("crt", {
    t({"\\begin{cases}", "\t"}),
    i(1, "x"), t(" \\equiv "), i(2, "a_1"), t(" \\pmod{"), i(3, "m_1"), t({"}",
    "\t"}), i(4, "x"), t(" \\equiv "), i(5, "a_2"), t(" \\pmod{"), i(6, "m_2"), t({"}",
    "\\end{cases}"}),
    i(0)
  }),
  
  -- Number theoretic functions
  s("phi", { t("\\varphi("), i(1), t(")"), i(0) }),   -- Euler's totient function
  s("moebius", { t("\\mu("), i(1), t(")"), i(0) }),   -- Möbius function
  s("sigma", { t("\\sigma_{"), i(1), t("}("), i(2), t(")"), i(0) }),  -- Sum of divisors
  s("tau", { t("\\tau("), i(1), t(")"), i(0) }),      -- Number of divisors
  
  -- Continued fractions
  s("contfrac", {
    t("\\cfrac{1}{"), i(1), t(" + \\cfrac{1}{"), i(2), t(" + \\cfrac{1}{"), i(3), t("}}"), i(0)
  }),
  
  -- Theorem environments for number theory
  s("thm", {
    t({"\\begin{theorem}", "\t"}),
    i(1),
    t({"", "\\end{theorem}"}),
    i(0)
  }),
  
  s("lemma", {
    t({"\\begin{lemma}", "\t"}),
    i(1),
    t({"", "\\end{lemma}"}),
    i(0)
  }),
  
  s("proof", {
    t({"\\begin{proof}", "\t"}),
    i(1),
    t({"", "\\end{proof}"}),
    i(0)
  }),
  
  s("cor", {
    t({"\\begin{corollary}", "\t"}),
    i(1),
    t({"", "\\end{corollary}"}),
    i(0)
  }),
  
  -- Quadratic reciprocity
  s("quadrec", {
    t("\\left(\\frac{p}{q}\\right)\\left(\\frac{q}{p}\\right) = (-1)^{\\frac{(p-1)(q-1)}{4}}")
  }),
  
  -- Typical number theory examples
  s("fermat", { t("Fermat's Little Theorem: $a^{p-1} \\equiv 1 \\pmod{p}$") }),
  s("euler", { t("Euler's Theorem: $a^{\\varphi(n)} \\equiv 1 \\pmod{n}$") }),
  s("wilson", { t("Wilson's Theorem: $(p-1)! \\equiv -1 \\pmod{p}$") }),
  
  -- Cases for proofs (common in number theory)
  s("cases", {
    t({"\\begin{cases}", "\t"}),
    i(1), t(" & \\text{if } "), i(2), t({",", "\t"}),
    i(3), t(" & \\text{if } "), i(4), t({",", "\t"}),
    i(5), t(" & \\text{otherwise}"),
    t({"", "\\end{cases}"}),
    i(0)
  }),
}
