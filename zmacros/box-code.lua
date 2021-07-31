function raw_tex (t)
  return pandoc.RawBlock('tex', t)
end

function CodeBlock (cb)
  return {raw_tex'\\begin{tcolorbox}', cb, raw_tex '\\end{tcolorbox}'}
end
