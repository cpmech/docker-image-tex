function raw_tex (t)
  return pandoc.RawBlock('tex', t)
end

function Meta (m)
  m['header-includes'] = {raw_tex [[
    \usepackage{tcolorbox}
    \newcommand{\tensorI}[1]{\vec{\boldsymbol{#1}}}
    \newcommand{\At}[2]{\left.{#1}\right\rvert_{#2}}
    \newcommand{\diF}[2]{\frac{\mathrm{d}#1}{\mathrm{d}#2}}
    \newcommand{\diFF}[2]{\frac{\mathrm{d}^2{#1}}{\mathrm{d}{#2}^2}}
    \newcommand{\UB}[2]{\underbrace{#1}_{#2}}
  ]]}
  return m
end