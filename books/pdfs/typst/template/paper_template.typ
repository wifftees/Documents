///////////////////////////////
// This Typst template is for working paper draft.
// It is based on the general SSRN papaer.
// Copyright (c) 2023
// Author:  Jiaxin Peng
// License: MIT
// Version: 0.1
// Date:    2021-07-05
// Email:   jiaxin.peng@outlook.com
///////////////////////////////
#let paper(
  font: "Computer Modern",
  fontsize: 11pt,
  title: none,
  authors: (),
  date: "",
  abstract: [],
  keywords: [],
  JEL: [],
  acknowledgements: none,
  bibloc: none,
  bibstyle: "ieee", 
  bibtitle: "References",
  doc,
) = {
set par(leading: 1em)
  // Set and show rules from before.

set text(
  font: font,
  size: fontsize
)
set footnote(numbering: "*")
set footnote.entry(
  separator: line(length: 100%, stroke: 0.5pt)
)
set footnote.entry(indent: 0em)
set align(left)
  text(17pt, align(center,{title;}))
    v(15pt)

  let count = authors.len()
  let ncols = calc.min(count, 3)
set footnote.entry(indent: 0em)
  grid(
    columns: (1fr,) * ncols,
    row-gutter: 24pt,
    ..authors.map(author => {
      text(14pt,align(center,{author.name; 
      {
        if author.note != ""  {
          footnote(author.note)
          }
      };[\ ]
      author.affiliation; [\ ]
      link("mailto:" + author.email)})
      )
}),
  )
  v(5pt)
  align(center,[#date])
    v(25pt)
  set heading(numbering: "1.")
set math.equation(numbering: "(1)")
  set footnote(numbering: "1")
set footnote.entry(
  separator: line(length: 100%, stroke: 0.5pt)
)
set footnote.entry(indent: 0em)
  set align(left)
  columns(1, doc)
pagebreak()
}
