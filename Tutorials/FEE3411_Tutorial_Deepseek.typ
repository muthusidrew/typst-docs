#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot

// ============================================================
// Counters
// ============================================================
#let question-counter = counter("question")
#let part-counter = counter("part")

// ============================================================
// Question environments
// ============================================================
#let numed-question(body) = {
  question-counter.step()
  part-counter.update(0)
  block(width: 100%, above: 1.2em, below: 0.6em)[
    #text(weight: "bold")[Question #context question-counter.display().]
    #v(0.2em)
    #line(length: 100%, stroke: 0.4pt)
    #v(0.4em)
    #body
  ]
}

#let named-question(title, body) = {
  question-counter.step()
  part-counter.update(0)
  block(width: 100%, above: 1.2em, below: 0.6em)[
    #text(weight: "bold")[#title]
    #v(0.2em)
    #line(length: 100%, stroke: 0.4pt)
    #v(0.4em)
    #body
  ]
}

// ============================================================
// Sub-parts
// ============================================================
#let alphaparts(body) = {
  set enum(numbering: "(a)")
  body
}

#let arabicparts(body) = context {
  let q = counter("question").get().first()
  set enum(numbering: (..nums) => [#q.#nums.pos().first())])
  body
}

// ============================================================
// Answer box
// ============================================================
#let answer-box(height: 2cm) = block(
  width: 100%,
  stroke: 0.5pt,
  inset: 8pt,
  radius: 2pt,
)[
  #v(height)
]

// ============================================================
// Signal definitions
// ============================================================
#let heaviside(t) = if t < 0.0 { 0.0 } else { 1.0 }

// ============================================================
// Document
// ============================================================
= FEE3411 Tutorial 1 — Solutions

#numed-question[
  Sketch the following signals:
  #alphaparts[
    + The unit step $u(t)$
    + The unit ramp $t u(t)$
    + The parabolic signal $1/2 t^2 u(t)$
    + The unit impulse $delta(t)$
  ]

  #v(0.5em)
  *Solution.* All four signals are zero for $t < 0$ and switch on at
  $t = 0$; they differ in how fast they grow afterwards.

  #v(0.4em)
  *(a)–(c)* The step, ramp, and parabolic signals are plotted together
  below for comparison. Each is the running integral of the previous
  one: $integral u(t) dif t = t u(t)$, and
  $integral t u(t) dif t = 1/2 t^2 u(t)$.

  #align(center, cetz.canvas({
    import cetz.draw: *
    plot.plot(
      size: (9, 4),
      x-min: -3,
      x-max: 3,
      y-min: -0.5,
      y-max: 4.5,
      x-label: $t$,
      y-label: $$,
      x-tick-step: 1,
      y-tick-step: 1,
      axis-style: "school-book",
      {
        // u(t)
        plot.add(
          domain: (-3, 3),
          samples: 600,
          t => heaviside(t),
          style: (stroke: blue + 1.5pt),
          label: $u(t)$,
        )
        // t u(t)
        plot.add(
          domain: (-3, 3),
          samples: 600,
          t => t * heaviside(t),
          style: (stroke: green + 1.5pt),
          label: $t u(t)$,
        )
        // (1/2) t^2 u(t)
        plot.add(
          domain: (-3, 3),
          samples: 600,
          t => 0.5 * t * t * heaviside(t),
          style: (stroke: purple + 1.5pt),
          label: $1/2 t^2 u(t)$,
        )
      },
    )
  }))

  #v(0.4em)
  *(d)* The unit impulse $delta(t)$ is not an ordinary function — it is
  a distribution defined by
  $
    integral_(-infinity)^(infinity) delta(t) dif t = 1,
    quad
    delta(t) = 0 "for" t != 0.
  $
  It is drawn as a vertical arrow of unit area at $t = 0$. The arrow
  height is a convention; here it is scaled to $1$ for visibility.

  #align(center, cetz.canvas({
    import cetz.draw: *
    plot.plot(
      size: (9, 2.4),
      x-min: -3,
      x-max: 3,
      y-min: -0.5,
      y-max: 1.5,
      x-label: $t$,
      y-label: $delta(t)$,
      x-tick-step: 1,
      y-tick-step: 1,
      axis-style: "school-book",
      {
        plot.annotate(resize: false, {
          line(
            (0, 0),
            (0, 1),
            stroke: red + 2pt,
            mark: (end: ">", fill: red),
          )
          content((0.18, 1.05), $delta(t)$, anchor: "west")
        })
      },
    )
  }))
]
