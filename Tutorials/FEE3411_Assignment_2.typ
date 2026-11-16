#import "assignment-template.typ": *
#import "@preview/cetz:0.5.1": canvas, draw
#import "@preview/cetz-plot:0.1.4": plot
#import "@preview/zap:0.6.0"

#show: assignment.with(
  reg-no: "FEE3/2143/2023",
  assignment-name: "FEE3411 Assignment 2",
)

#numed-question(
  lead: [
    In the series RLC network below, the input is $v_i(t)$ and the output is $v_o(t)$. Take $R = 11 thin Omega$, $L = 1 "H"$, $C = 0.1 "F"$

    #align(center)[
      #zap.circuit({
        import zap: *
        // Main components along the top branch
        node("vi+", (0, 0))
        inductor("L", "vi+", (rel: (2, 0)), label: $L$)
        capacitor("C", "L.out", (rel: (2, 0)), label: $C$)

        // Vertical resistor on the right
        resistor("R", "C.out", (rel: (0, -2)), label: (content: $R$, anchor: "south"), u: $v_o (t)$)
        node("vi-", (rel: (-4, 0), to: "R.out"))
        wire("R.out", "vi-")
        vsource("V", "vi-", "vi+", u: $v_i(t)$)
      })
    ]
  ],
)[
  #sub-question(
    [Using the impedance method derive $G = frac(V_o (s), V_i (s))$ in terms of $R, L$ and $C$ then substitute the given values],
    answer: answer-box()[
      We know:
      $
        Z_L & = s L \
        Z_C & = 1/(s C) \
        Z_R & = R
      $
      Additionally:
      $
        V_o (s) = V_i (s) dot frac(Z_R, Z_("total"))
      $
      Hence:
      $
        G(s) & = frac(V_o (s), V_i (s)) \
             & = frac(R, s L + R + 1/(s C)) \
             & = frac(s R C, s^2 L C + s R C + 1)
      $

      Substituting the given values yields:
      $
        G(s) = frac(#(11 * 0.1)s, #(1 * 0.1)s^2 + #(11 * 0.1)s + 1)
      $
    ],
  )
  #sub-question(
    [State the poles the zeros and the relative degree of $G(s)$, sketch its pole-zero map and say what kind of filter this network is],
    answer: answer-box()[
      The relative degree is $1$:
      $
        deg("denominator") - deg("numerator") = 2 - 1 = 1
      $

      The zeros are the roots of the numerator:
      $
        #(11 * 0.1)s & = 0 \
                   s & = 0
      $

      The poles are the roots of the characteristic equation:
      $
        #(1 * 0.1) s^2 + #(11 * 0.1)s + 1 & = 0 \
                          (s + 1)(s + 10) & = 0
      $
      So the poles are negative real (-1, -10).

      #align(center)[
        #canvas({
          import draw: *

          // Grid and Axes Configuration
          let x-min = -12.0
          let x-max = 2.0
          let y-min = -4.0
          let y-max = 4.0
          let r = 0.25

          // Draw Grid Lines
          grid(
            (x-min, y-min),
            (x-max, y-max),
            stroke: (dash: "dotted", paint: black, thickness: 0.5pt),
            step: 1.0,
          )

          // Draw Axes with Arrows
          line((x-min, 0), (x-max, 0), mark: (end: "stealth"), stroke: 1pt + black)
          line((0, y-min), (0, y-max), mark: (end: "stealth"), stroke: 1pt + black)

          // Axis Labels
          content((x-max - 0.5, 0.4), $Re (sigma)$)
          content((0.6, y-max - 0.4), $Im (j omega)$)

          // Origin Label
          content((0.3, -0.3), $0$, stroke: none)

          // Function to draw a pole (X marker)
          let draw-pole(x, y, label: "") = {
            line((x - r, y - r), (x + r, y + r), stroke: (paint: red, thickness: 1.8pt))
            line((x - r, y + r), (x + r, y - r), stroke: (paint: red, thickness: 1.8pt))
            if label != "" {
              content((x, y - 0.5), label)
            }
          }
          let draw-zero(x, y, label: "") = {
            circle((x, y), radius: r, stroke: (paint: red, thickness: 1.8pt))
            if label != "" {
              content((x, y - 0.5), label)
            }
          }

          draw-pole(-1, 0, label: $-1$)
          draw-pole(-10, 0, label: $-10$)
          draw-zero(0, 0)
        })
      ]

      It is a band pass filter.
      At DC the capacitor acts as an open circuit hence no current flows across the resistor causing no voltage to appear across it.
      At high frequencies the inductor acts as an open circuit causing no current to flow again making $v_o = i R = 0$.
      In between however the reactances partially cancel out allowing current to flow and a non-zero voltage appears across the resistor.

      Additionally here is the frequency response curve to prove this:

      #align(center)[
        #canvas({
          import draw: *

          let mag-db(w) = {
            let num = 1.1 * w
            let re = 1 - 0.1 * w * w
            let im = 1.1 * w
            20 * calc.log(num) - 10 * calc.log(re * re + im * im)
          }

          // log-spaced samples
          let pts = ()
          for i in range(0, 241) {
            let w = 0.1 * calc.pow(1000, i / 240)
            pts.push((w, mag-db(w)))
          }

          plot.plot(
            size: (10, 4),
            x-min: 0.1,
            x-max: 100,
            x-mode: "log",
            y-min: -40,
            y-max: 5,
            x-label: $omega$,
            y-label: $20 log_10 |G(j omega)|$,
            x-grid: "both",
            y-grid: "both",
            x-ticks: (0.1, 1, 10, 100),
            {
              plot.add(pts, label: [Response])
              plot.add-hline(mag-db(1), label: [#calc.round(mag-db(1), digits: 2) dB])
            },
          )
        })
      ]
    ],
  )
  #sub-question(
    [Write down the d.c. gain of $G(s)$. Confirm it with the final value theorem applied to the unit-step response, and explain physically why the answer must come out as it does.],
    answer: answer-box()[
      $
        G(s) & = frac(#(11 * 0.1)s, #(1 * 0.1)s^2 + #(11 * 0.1)s + 1) \
        G(0) & = 0/1 \
             & = 0
      $
      Applying the unit step and the final value theorem gives:
      $
        lim_(t -> oo) v_(o)(t) & = lim_(s -> oo) s V_(o)(s) \
                               & = lim_(s -> oo) s (G(s)1/s) \
                               & = G(0) \
                               & = frac(#(11 * 0.1) times 0, #(1 * 0.1) times 0^2 + #(11 * 0.1) times 0 + 1) \
                               & = 0/1 \
                               & = 0
      $

    ],
  )
  #sub-question(
    [Find $v_o (t)$ for a unit step input by partial fractions. Which of the two natural modes governs the shape of the response after the first few tenths of a second, and why?],
    answer: answer-box()[
      $
        V_o (s) & = G(s)V_i (s) \
                & = G(s)U(s) \
                & = frac(#str(11 * 0.1), #(1 * 0.1)s^2 + #(11 * 0.1)s + 1) \
                & = frac(#str(11 * 0.1 * 10), (s + 1)(s + 10)) \
                & = frac(A, s + 1) + frac(B, s + 10)
      $

      $
        A & = lr(V_o (s)(s + 1) |)_(s = -1) = 11/9 \
        B & = lr(V_o (s)(s + 10) |)_(s = -10) = 11/(-9) \
      $

      $
        V_o (s) = 11/9 frac(1, s + 1) - 11/9 frac(1, s + 10)
      $

      Finding the inverse laplace:
      $
        v_o (t) = 11/9 e^(-t) - 11/9 e^(-10t)
      $
      After say 7-tenths of a second the first mode $11/9 e^(-t)$= #(calc.round((11 / 9) * calc.pow(calc.e, (-7 / 10)), digits: 4)) while the second mode $11/9 e^(-10t)$= #(calc.round((11 / 9) * calc.pow(calc.e, (10 * -7 / 10)), digits: 4)).
      We see that the first mode is 2 orders of magnitude greater than the second hence it is the more dominant mode.
    ],
  )
]

#numed-question(
  lead: [
    The figure below shows a servo with three feedback paths. The blocks are:
    $
          G_1 & = 4 \
      G_2 (s) & = frac(1, s + 4) \
      G_3 (s) & = 5/s \
          H_1 & = 0.5 \
          H_2 & = 1
    $

    #align(center)[
      #canvas({
        import draw: *

        // Styling defaults
        set-style(
          rect: (inset: 6pt),
          line: (stroke: 0.9pt + black),
          mark: (fill: black),
        )

        let node-r = 0.25 // Radius of summing junctions

        // Main forward path coordinates
        let r-in = (-1.5, 0)
        let s1 = (0, 0)
        let s2 = (1.5, 0)
        let g1 = (3.2, 0)
        let s3 = (4.8, 0)
        let g2 = (6.5, 0)
        let p1 = (8.0, 0) // Tap point after G2
        let g3 = (9.5, 0)
        let p2 = (11.0, 0) // Tap point after G3
        let c-out = (12.0, 0)

        // Feedback elements coordinates
        let h1 = (6.0, -1.5)
        let h2 = (7.3, -2.8)
        let y-outer = -4.0

        // Summing Junctions
        circle(s1, radius: node-r, name: "s1")
        circle(s2, radius: node-r, name: "s2")
        circle(s3, radius: node-r, name: "s3")

        // Forward Path Rectangles
        rect((g1.at(0) - 0.6, -0.5), (g1.at(0) + 0.6, 0.5), name: "g1")
        content(g1, $G_1$)

        rect((g2.at(0) - 0.6, -0.5), (g2.at(0) + 0.6, 0.5), name: "g2")
        content(g2, $G_2$)

        rect((g3.at(0) - 0.6, -0.5), (g3.at(0) + 0.6, 0.5), name: "g3")
        content(g3, $G_3$)

        // Feedback Path Rectangles
        rect((h1.at(0) - 0.6, h1.at(1) - 0.5), (h1.at(0) + 0.6, h1.at(1) + 0.5), name: "h1")
        content(h1, $H_1$)

        rect((h2.at(0) - 0.6, h2.at(1) - 0.5), (h2.at(0) + 0.6, h2.at(1) + 0.5), name: "h2")
        content(h2, $H_2$)

        // Forward Path Connecting Lines & Arrows
        line(r-in, "s1.west", mark: (end: "stealth"))
        content((-1.2, 0.3), $R$)
        content((-0.4, 0.3), $+$)
        content((-0.3, -0.4), $-$)

        line("s1.east", "s2.west", mark: (end: "stealth"))
        content((0.7, 0.3), $+$)
        content((1.2, -0.4), $-$)

        line("s2.east", "g1.west", mark: (end: "stealth"))

        line("g1.east", "s3.west", mark: (end: "stealth"))
        content((4.0, 0.3), $+$)
        content((4.5, -0.4), $-$)

        line("s3.east", "g2.west", mark: (end: "stealth"))

        line("g2.east", "g3.west")
        circle(p1, radius: 0.05, fill: black) // Junction point 1

        line("g3.east", c-out, mark: (end: "stealth"))
        circle(p2, radius: 0.05, fill: black) // Junction point 2
        content((11.5, 0.3), $C$)

        // Minor Loop 1 (H1) Feedback Wires
        line(p1, (p1.at(0), h1.at(1)), "h1.east", mark: (end: "stealth"))
        line("h1.west", (s2.at(0), h1.at(1)), "s2.south", mark: (end: "stealth"))

        // Minor Loop 2 (H2) Feedback Wires
        line(p2, (p2.at(0), h2.at(1)), "h2.east", mark: (end: "stealth"))
        circle((p2.at(0), h2.at(1)), radius: 0.05, fill: black) // Junction point 3
        line("h2.west", (s3.at(0), h2.at(1)), "s3.south", mark: (end: "stealth"))

        // Outer Unity Feedback Loop Wires
        line((p2.at(0), h2.at(1)), (p2.at(0), y-outer), (s1.at(0), y-outer), "s1.south", mark: (end: "stealth"))

        // Descriptive Labels
        content((2.5, -2.1), text(fill: rgb("#2d5a3f"), size: 9pt)[minor loop 1])
        content((4.5, -3.3), text(fill: rgb("#8c3a1e"), size: 9pt)[minor loop 2])
        content((2.1, -3.7), text(fill: rgb("#2d3f5a"), size: 9pt)[outer unity loop])
      })
    ]
  ],
)[
  #sub-question(
    [Explain, in one or two sentences, why neither minor loop can be collapsed first by the standard closed-loop formula.],
    answer: answer-box()[
      This is because the loops overlap, neither is contained fully within the other.
    ],
  )
  #sub-question(
    [
      Move $H_2$ branch’s summing junction back through $G_1$, and move $H_1$ branch’s pick-off point forward through $G_3$.
      State the gain each moved branch must now carry, and sketch the resulting diagram, in which all three feedback branches start at $C$ and return to one junction.
    ],
    answer: answer-box()[
      Moving $H_2$ branch's summing junction requires us to introduce a $1/G_1$ block at the summing junction since this is in cascade with $H_2$ we combine the two to form the block $H_2/G_1$.
      Similarly moving $H_1$ branch's pick-off point through $G_3$ will introduce a $1/G_3$ block after the pick-off point and combining it with $H_1$ yields $H_1/G_3$.
      $
        H_2/G_1 & = 1/4 \
        H_1/G_3 & = #(0.5 / 5)s
      $
      #align(center)[
        #canvas({
          import draw: *

          // Styling defaults
          set-style(
            rect: (inset: 6pt),
            line: (stroke: 0.9pt + black),
            mark: (fill: black),
          )

          let node-r = 0.25 // Radius of summing junctions

          // Main forward path coordinates
          let r-in = (-1.5, 0)
          let s1 = (0, 0)
          let g1 = (4.2, 0)
          let g2 = (6.5, 0)
          let p1 = (11.0, 0) // Tap point after G2
          let g3 = (9.0, 0)
          let c-out = (12.0, 0)

          // Feedback elements coordinates
          let h1 = (6.0, -1.5)
          let h2 = (7.3, -2.8)
          let y-outer = -4.0

          // Summing Junctions
          circle(s1, radius: node-r, name: "s1")

          // Forward Path Rectangles
          rect((g1.at(0) - 0.6, -0.5), (g1.at(0) + 0.6, 0.5), name: "g1")
          content(g1, $G_1$)

          rect((g2.at(0) - 0.6, -0.5), (g2.at(0) + 0.6, 0.5), name: "g2")
          content(g2, $G_2$)

          rect((g3.at(0) - 0.6, -0.5), (g3.at(0) + 0.6, 0.5), name: "g3")
          content(g3, $G_3$)

          // Feedback Path Rectangles
          rect((h1.at(0) - 0.6, h1.at(1) - 0.5), (h1.at(0) + 0.6, h1.at(1) + 0.5), name: "h1")
          content(h1, $H_1/G_3$)

          rect((h2.at(0) - 0.6, h2.at(1) - 0.5), (h2.at(0) + 0.6, h2.at(1) + 0.5), name: "h2")
          content(h2, $H_2/G_1$)

          // Forward Path Connecting Lines & Arrows
          line(r-in, "s1.west", mark: (end: "stealth"))
          content((-1.2, 0.3), $R$)
          content((-0.4, 0.3), $+$)
          content((-0.3, -0.4), $-$)

          line("s1.east", "g1.west", mark: (end: "stealth"))

          line("g1.east", "g2.west", mark: (end: "stealth"))

          line("g2.east", "g3.west", mark: (end: "stealth"))
          circle(p1, radius: 0.05, fill: black) // Junction point 1

          line("g3.east", c-out, mark: (end: "stealth"))
          content((11.5, 0.3), $C$)

          // Minor Loop 1 (H1) Feedback Wires
          line(p1, (p1.at(0), h1.at(1)), "h1.east", mark: (end: "stealth"))
          circle((p1.at(0), h1.at(1)), radius: 0.05, fill: black) // Junction point 2
          line("h1.west", (s1.at(0), h1.at(1)))
          circle((s1.at(0), h1.at(1)), radius: 0.05, fill: black) // Junction point 1

          // Minor Loop 2 (H2) Feedback Wires
          line(p1, (p1.at(0), h2.at(1)), "h2.east", mark: (end: "stealth"))
          circle((p1.at(0), h2.at(1)), radius: 0.05, fill: black) // Junction point 3
          line("h2.west", (s1.at(0), h2.at(1)))
          circle((s1.at(0), h2.at(1)), radius: 0.05, fill: black) // Junction point 1

          // Outer Unity Feedback Loop Wires
          line((p1.at(0), h2.at(1)), (p1.at(0), y-outer), (s1.at(0), y-outer), "s1.south", mark: (end: "stealth"))

          // Descriptive Labels
          content((4.0, -1.0), text(fill: rgb("#2d5a3f"), size: 9pt)[minor loop 1])
          content((4.5, -2.3), text(fill: rgb("#8c3a1e"), size: 9pt)[minor loop 2])
          content((2.1, -3.7), text(fill: rgb("#2d3f5a"), size: 9pt)[outer unity loop])
        })
      ]

    ],
  )
  #sub-question(
    [Hence reduce the diagram to a single transfer function $T(s) = C(s)/R(s)$, and write down the characteristic equation.],
    ref: <characteristic>,
    answer: answer-box()[
      Reducing minor loop 1 gives:
      $
        T_(1)(s) & = frac(G_1 G_2 G_3, 1 + G_1 G_2 H_1) \
                 & = frac(frac(20, s(s + 4)), 1 + frac(2, s + 4)) \
                 & = frac(20/s, s + 6)
      $

      Including minor loop 2:
      $
        T_2 & = T_1/(1 + T_1 H_2/G_1) \
            & = frac(frac(20/s, s + 6), 1 + frac(5/s, s + 6)) \
            & = frac(20/s, s + 6 + 5/s) \
            & = frac(20, s^2 + 6s + 5)
      $

      Finally the outer unity loop:
      $
        T(s) & = T_2/(1 + T_(2)) \
             & = frac(frac(20, s^2 + 6s + 5), 1 + frac(20, s^2 + 6s + 5)) \
             & = frac(20, s^2 + 6s + 25)
      $

      The characteristic equation is:
      $
        s^2 + 6s + 25 = 0
      $
    ],
  )
  #sub-question-group(sq => [
    #sq(
      [Give $omega_n, zeta$, and the closed-loop poles, and find the steady-state error for a unit step input.],
      answer: answer-box()[
        The second order form is $s^2 + 2 zeta omega_n s + omega_n^2 = 0$.
        Matching terms with the answer we got in #subq-ref(<characteristic>):
        $
          omega_n & = sqrt(25) \
                  & = 5 \
             zeta & = frac(6, 2 omega_n) \
                  & = 0.6
        $

        The poles are
        $
          -3 plus.minus j 4
        $

        The error is given by:
        $
          E(s) & = R(s) - C(s) \
        $
        then
        $
          T(s) & = C(s)/R(s) \
          C(s) & = T(s)R(s) \
          E(s) & = [1 - T(s)]R(s) \
          E(s) & = [1 - frac(20, s^2 + 6s + 25)] R(s) \
               & = frac(s^2 + 6s + 5, s^2 + 6s + 25)
        $

        Applying the final value theorem and unit step function:
        $
          lim_(t -> oo) e_(s s)(t) & = lim_(s -> oo) s (E(s)1/s) \
                                   & = E(0) \
                                   & = frac(0^2 + 6 times 0 + 5, 0^2 + 6 times 0 + 25) \
                                   & = 1/5
        $
      ],
    )
    #sq(
      [The forward path contains a free integrator ($G_3$), which ordinarily forces the steady-state error to zero — why does it not do so here?],
      answer: answer-box()[
        This is because of the presence of non-unity feedback in the system.
      ],
    )
  ])
]

#numed-question(
  lead: [
    The figure below is the signal flow graph of a system with a feedforward branch from the input directly to node $x_3$.
    The branch gains are:
    $
         G_1 & = 2 \
      G_2(s) & = 6/(s + 3) \
         G_3 & = 4 \
         G_4 & = 1 \
         H_1 & = 1 \
         H_2 & = 0.25 \
         H_3 & = 1 \
    $

    #align(center)[
      #canvas({
        import draw: *

        // Styling defaults
        set-style(
          line: (stroke: 0.9pt + black),
          mark: (fill: black),
        )

        let node-r = 0.08 // Node circle radius

        // Main line node coordinates
        let r = (0, 0)
        let x1 = (2.2, 0)
        let x2 = (4.4, 0)
        let x3 = (6.6, 0)
        let c = (8.8, 0)

        // Main Line Direct Connections
        line(r, x1, mark: (end: "stealth"))
        content((1.1, 0.3), $1$)

        line(x1, x2, mark: (end: "stealth"))
        content((3.3, 0.3), $G_1$)

        line(x2, x3, mark: (end: "stealth"))
        content((5.5, 0.3), $G_2$)

        line(x3, c, mark: (end: "stealth"))
        content((7.7, 0.3), $G_3$)

        // Curved Feedforward Path G4 (top arc from R to x3)
        bezier(
          r,
          x3,
          (0.8, 2.8),
          (5.8, 2.8),
          mark: (end: "stealth"),
          stroke: 0.9pt + rgb("#243b63"),
        )
        content((3.5, 2.3), text(fill: rgb("#243b63"))[$G_4$])

        // Curved Feedback Path -H1 (bottom arc from x2 to x1)
        bezier(
          x2,
          x1,
          (3.9, -1.0),
          (2.7, -1.0),
          mark: (end: "stealth"),
          stroke: 0.9pt + rgb("#1e4a38"),
        )
        content((3.3, -1.0), text(fill: rgb("#1e4a38"))[$-H_1$])

        // Curved Feedback Path -H3 (bottom arc from x3 to x2)
        bezier(
          x3,
          x2,
          (6.1, -1.0),
          (4.9, -1.0),
          mark: (end: "stealth"),
          stroke: 0.9pt + rgb("#8c3a1e"),
        )
        content((5.5, -1.0), text(fill: rgb("#8c3a1e"))[$-H_3$])

        // Curved Feedback Path -H2 (bottom arc from C to x3)
        bezier(
          c,
          x3,
          (8.3, -1.0),
          (7.1, -1.0),
          mark: (end: "stealth"),
          stroke: 0.9pt + rgb("#1e7f38"),
        )
        content((7.7, -1.0), text(fill: rgb("#1e7f38"))[$-H_2$])

        // Node Points (Solid circles overlayed on junctions)
        circle(r, radius: node-r, fill: rgb("#243b63"), stroke: none)
        circle(x1, radius: node-r, fill: rgb("#243b63"), stroke: none)
        circle(x2, radius: node-r, fill: rgb("#243b63"), stroke: none)
        circle(x3, radius: node-r, fill: rgb("#243b63"), stroke: none)
        circle(c, radius: node-r, fill: rgb("#243b63"), stroke: none)

        // Node Name Labels Below
        content((0, -1.5), text(fill: rgb("#243b63"))[$R$])
        content((2.2, -1.5), text(fill: rgb("#243b63"))[$x_1$])
        content((4.4, -1.5), text(fill: rgb("#243b63"))[$x_2$])
        content((6.6, -1.5), text(fill: rgb("#243b63"))[$x_3$])
        content((8.8, -1.5), text(fill: rgb("#243b63"))[$C$])
      })
    ]
  ],
)[
  #sub-question(
    [List both forward paths and all three loops, giving the gain of each and the nodes it touches.],
    answer: answer-box()[
      The feed forward paths are:
      + $R arrow x_1 arrow x_2 arrow x_3 arrow C quad "Gain:" G_1 G_2 G_3$
      + $R arrow x_3 arrow C quad "Gain:" G_4 G_3$

      The loops are:
      + #text(rgb("#1e4a38"))[$"Loop 1  Gain:" -G_1 H_1$]
      + #text(rgb("#8c3a1e"))[$"Loop 2  Gain:" -G_2 H_3$]
      + #text(rgb("#1e7f38"))[$"Loop 3  Gain:" -G_3 H_2$]
    ],
  )
  #sub-question(
    [
      Exactly one pair of loops is non-touching.
      Identify it, and hence write down the determinant $Delta$ and simplify it to a single rational function of $s$.
    ],
    ref: <determinant>,
    answer: answer-box()[
      The pair of non touching loops is #text(rgb("#1e4a38"))[$" Loop 1  Gain:" -G_1 H_1$] and #text(rgb("#1e7f38"))[$"Loop 3  Gain:" -G_3 H_2$]

      Hence the determinant is:
      $
        Delta & = 1 - [-G_(1)H_(1) - G_(2)H_(3) - G_(3)H_(2)] + [G_(1)H_(1)G_(3)H_(2)] \
              & = 1 + 2 + 6/(s + 3) + 1 + 2 \
              & = 6 + 6/(s + 3) \
              & = frac(6s + 24, s + 3)
      $
    ],
  )
  #sub-question(
    [Find the cofactors $Delta_1$ and $Delta_2$, explaining in each case which loops survive, and hence obtain $T(s) = C(s)/R(s)$ by Mason’s gain formula.],
    answer: answer-box()[
      We look at the determinant obtained in #subq-ref(<determinant>) before substitution.

      The first path touches nodes $x_1, x_2, x_3$ causing all the gains to go to zero:
      $
        Delta_(1) & = 1 - cancel([-G_(1)H_(1) - G_(2)H_(3) - G_(3)H_(2)] + [G_(1)H_(1)G_(3)H_(2)]) \
                  & = 1
      $

      The second feed forward path touches node $x_3$ so the gains $G_2, G_3, H_2, H_3$ and $G_4$ go to zero:
      $
        Delta_(2) & = 1 - [-G_(1)H_(1) - cancel(G_(2)H_(3)) - cancel(G_(3)H_(2))] + cancel([G_(1)H_(1)G_(3)H_(2)]) \
                  & = 1 + 2 \
                  & = 3
      $

      The transfer function is hence given as:
      $
        T(s) & = frac(P_1 Delta_1 + P_2 Delta_2, Delta) \
             & = frac(48/(s + 3) + 12, (6s + 24)/(s + 3)) \
             & = frac(12s + 84, 6s + 24) \
             & = frac(2s + 14, s + 4)
      $
    ],
  )
  #sub-question-group(sq => [
    #sq(
      [State the pole, the zero and the d.c. gain of $T(s)$.],
      answer: answer-box()[
        The zero is $-7$.

        The pole is $-4$

        The dc gain is:
        $
          frac(0 + 14, 0 + 4) = 14/4 = 3.5
        $
      ],
    )
    #sq(
      [Recompute $T(s)$ with the feedforward branch ($G_4 = 0$) and say precisely what the branch contributed — and what it did not.],
      answer: answer-box()[
        With $G_4 = 0, P_2 = 0$ hence:
        $
          T(s) & = frac(48/(s + 3), (6s + 24)/(s + 3)) \
               & = frac(48, 6s + 24) \
               & = 8/(s + 4)
        $

        The branch contributed the zero in the original transfer function and increase the gain from 2 to 3.5.
        It had no effect on the closed loop pole.
      ],
    )
  ])
]

#numed-question(
  lead: [
    A position servo is modelled as shown below an adjustable amplifier of gain $K > 0$ drives a plant $G_p (s) = frac(4, s(s + 8))$, and a disturbance $D(s)$ — a load torque — enters at the plant input.
    The feedback is unity.

    #align(center)[
      #canvas({
        import draw: *

        // Styling defaults
        set-style(
          line: (stroke: 0.9pt + black),
          mark: (fill: black),
        )

        let node-r = 0.25 // Radius of summing junctions

        // Coordinates setup
        let r-in = (-1.5, 0)
        let s1 = (0, 0)
        let k-blk = (2.2, 0)
        let s2 = (4.2, 0)
        let d-in = (4.2, 2.0)
        let plant = (6.8, 0)
        let p-tap = (9.0, 0)
        let c-out = (10.0, 0)
        let y-feedback = -1.8

        // Summing Junction 1 (Left)
        circle(s1, radius: node-r, name: "s1")

        // Gain Block K
        rect((k-blk.at(0) - 0.6, -0.6), (k-blk.at(0) + 0.6, 0.6), name: "k")
        content(k-blk, $K$)

        // Summing Junction 2 (Middle - Disturbance addition)
        circle(s2, radius: node-r, name: "s2")

        // Plant Block 4 / s(s+8)
        rect((plant.at(0) - 1.1, -0.7), (plant.at(0) + 1.1, 0.7), name: "plant")
        content(plant, $ 4 / (s(s + 8)) $)

        // Input Signal R
        line(r-in, "s1.west", mark: (end: "stealth"))
        content((-1.2, 0.3), $R$)
        content((-0.4, 0.3), $+$)
        content((-0.3, -0.4), $-$)

        // Signal E (Error) from s1 to K
        line("s1.east", "k.west", mark: (end: "stealth"))
        content((1.0, 0.3), $E$)

        // Line from K to s2
        line("k.east", "s2.west", mark: (end: "stealth"))
        content((3.6, 0.3), $+$)

        // Disturbance Input D from top
        line(d-in, "s2.north", mark: (end: "stealth"))
        content((4.5, 1.7), $D$)
        content((4.5, 0.5), $+$)

        // Line from s2 to Plant
        line("s2.east", "plant.west", mark: (end: "stealth"))

        // Line from Plant to Output C
        line("plant.east", c-out, mark: (end: "stealth"))
        circle(p-tap, radius: 0.05, fill: black) // Tap point for feedback
        content((9.5, 0.3), $C$)

        // Unity Negative Feedback Loop
        line(p-tap, (p-tap.at(0), y-feedback), (s1.at(0), y-feedback), "s1.south", mark: (end: "stealth"))
      })
    ]
  ],
)[
  #sub-question(
    [Using superposition, derive $C(s)/R(s)$ (with $D=0$) and $C(s)/D(s)$ (with $R=0$).],
    answer: answer-box()[
      Setting $D = 0$:
      $
        C(s) = E dot K dot 4/(s(s + 8))
      $
      but $E = R(s) - C(s)$
      $
                              C(s) & = [R(s) - C(s)] dot K dot 4/(s(s + 8)) \
        C(s) [1 + (4K)/(s(s + 8))] & = R(s) [(4K)/(s(s + 8))] \
                         C(s)/R(s) & = [(4K)/(s(s + 8))] dot [(s(s + 8))/(s(s + 8) + 4K)] \
                                   & = frac(4K, s(s + 8) + 4K)
      $

      Setting $R = 0$
      $
        C(s) = [E K + D] dot frac(4, s(s + 8))
      $
      but $E = 0 - C(s)$
      $
                              C(s) & = [-K C(s) + D] dot frac(4, s(s + 8)) \
        C(s) [1 + (4K)/(s(s + 8))] & = D(s) [(4)/(s(s + 8))] \
                         C(s)/D(s) & = [(4)/(s(s + 8))] dot [(s(s + 8))/(s(s + 8) + 4K)] \
                                   & = frac(4, s(s + 8) + 4K)
      $
      When both inputs are active:
      $
        C(s) = frac(4K, s(s + 8) + 4K)R(s) + frac(4, s(s + 8) + 4K)D(s)
      $
    ],
  )
  #sub-question(
    [
      Write down the characteristic equation.
      Why is it the same for both inputs, even though the two transfer functions are different?
    ],
    ref: <equation>,
    answer: answer-box()[
      The characteristic equation is:
      $
        s^2 + 8s + 4K = 0
      $

      It is the same because the loop gain is the same in both scenarios
    ],
  )
  #sub-question-group(sq => [
    #sq(
      [Find the value of $K$ that gives a damping ratio $zeta = 0.5$, and state $omega_n$ and the closed-loop poles for that $K$. ],
      answer: answer-box()[
        $
                8 & = 2 times 0.5 omega_n \
          omega_n & = 8 \
               4K & = omega_n^2 \
                K & = 64/4 \
                  & = 16
        $
        Plugging this value of $K$ into the characteristic equation gives the poles as:
        $
          -4 plus.minus j(4sqrt(3))
        $
      ],
    )
    #sq(
      [What value of would make the servo critically damped instead?],
      ref: <k-value>,
      answer: answer-box()[
        For critically damped, the damping ratio is $zeta = 1$ hence:
        $
                8 & = 2 times 1 omega_n \
          omega_n & = 4 \
               4K & = omega_n^2 \
                K & = 16/4 \
                  & = 4
        $
      ],
    )
  ])
  #sub-question-group(
    lead: [With $K$ as found in #subq-ref(<k-value>), use the final value theorem to find],
    sq => [
      #sq(
        [The steady-state error for a unit step reference with $D = 0$],
        answer: answer-box()[
          Taking
          $
            C(s) = frac(16, s^2 + 8s + 16) R(s)
          $
          and
          $
            E & = R(s) - C(s) \
              & = [1 - frac(16, s^2 + 8s + 16)] R(s) \
              & = frac(s^2 + 8s, s^2 + 8s + 16)
          $
          Multiplying by the $1/s$ from the unit step and applying the final value theorem ($s = 0$) yields:
          $
            0 / 16 = 0
          $
        ],
      )
      #sq(
        [The steady-state output produced by a unit step disturbance with $R = 0$.],
        answer: answer-box()[
          Taking
          $
            C(s) = frac(4, s^2 + 8s + 16) D(s)
          $

          substituting $s = 0$ gives:
          $
            4 / 16 = 1 / 4
          $
        ],
      )
      #sq(
        [Show that $zeta = 2/sqrt(K)$, and comment on the design trade-off this exposes.],
        answer: answer-box()[
          Comparing terms of the standard form second order ODE and the characteristic in #subq-ref(<equation>) we see that:
          $
            omega_n^2 & = 4K \
              omega_n & = 2 sqrt(K)
          $
          then:
          $
               8 & = 2 zeta omega_n \
            zeta & = 4/omega_n \
            zeta & = 2/sqrt(K)
          $

          Increasing $K$ reduces the steady state error cause by disturbances $D eq.not 0$ but decreases the damping ratio $zeta$ leading to higher overshoot and longer settling oscillation.
          Decreasing $K$ increases $zeta$ but simultaneously increases vulnerability to disturbance.
        ],
      )
    ],
  )
]
