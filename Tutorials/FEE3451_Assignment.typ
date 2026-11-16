#import "assignment-template.typ": *

#numed-question(
  lead: [
    A standard WG16 (WR-90) air-filled rectangular waveguide is intended for X-band operation.
    Its inner dimensions are $a = 22.9 "mm"$ and $b = 10.2 "mm"$.
    The guide must operate in a single mode, with the operating frequency at least 25% above the dominant-mode cutoff frequency and not exceeding 95% of the next higher-order mode cutoff frequency.
    Determine the allowable operating frequency range.
  ],
)[
  #answer-box()[
    We know TEM mode is impossible for a hollow single conductor waveguide so the possible modes are TE and TM.
    TM modes require $m gt.eq 1$ and $n gt.eq 1$ making the lowest TM mode $"TM"_(11)$ whose cutoff is relatively high.
    The lowest TE mode is $"TE"_(10)$ with a cutoff frequency given by;
    $
      f_(c"TE"_10) = c/2a
    $
    ($c = 300"GHzmm"$ as in speed of light since the waveguide is air-filled)

    Subsituting the value of $a$ into the above expressions:
    $
      f_(c"TE"_10) & = c/2a \
                   & = frac(300, 2 times 22.9) \
                   & = #(calc.round(300 / (2 * 22.9), digits: 2)) "GHz" \
      f_(c"TE"_20) & = c/a \
                   & = frac(300, 22.9) \
                   & = #(calc.round(300 / 22.9, digits: 2)) "GHz"
    $

    Applying the given margins:
    $
      f_"min" & = 1.25 times #(calc.round(300 / (2 * 22.9), digits: 2)) \
              & = #(calc.round(1.25 * (300 / (2 * 22.9)), digits: 2)) "GHz" \
      f_"max" & = 0.95 times #(calc.round(300 / (2 * 22.9), digits: 2)) \
              & = #(calc.round(0.95 * (300 / 22.9), digits: 2)) "GHz" \
    $

    Therefore the allowable single mode frequency range is:
    $
      #(calc.round(1.25 * (300 / (2 * 22.9)), digits: 2)) "GHz" lt.eq f lt.eq #(calc.round(0.95 * (300 / 22.9), digits: 2)) "GHz"
    $

  ]
]

#numed-question(
  lead: [Table of normalised cut-off frequencies],
)[
  #answer-box()[
    The expression for cut off frequency in $"TE"$ mode is:
    $
      f_(c" TE"_("mn")) = frac(c, 2a) sqrt(m^2 + (frac(n a, b))^2)
    $

    For $"TE"_(10)$
    $
      f_(c" TE"_("10")) = frac(c, 2a)
    $

    An expression for the normailsed version is therefore:
    $
      frac(f_(c" TE"_("mn")), f_(c" TE"_("10"))) = sqrt(m^2 + (frac(n a, b))^2)
    $
    We take $a approx 2b$ hence simplifying further to:
    $
      frac(f_(c" TE"_("mn")), f_(c" TE"_("10"))) = sqrt(m^2 + (2n)^2)
    $

    #{
      let k = 6

      // 1. Compute values once as a matrix: matrix.at(m).at(n)
      let matrix = range(k + 1).map(m => range(k + 1).map(n => calc.sqrt(m * m + 4 * n * n)))

      // 2. Gradient from the row-major flattening (same order as table data)
      let colored = hsv_gradient(matrix.flatten())

      // 3. Precompute fills: header cells (row/col == 0) stay uncolored
      let fills = range(k + 2).map(row => range(k + 2).map(col => {
        if row == 0 or col == 0 {
          none
        } else {
          colored.at((row - 1) * (k + 1) + (col - 1)).at(1).transparentize(50%)
        }
      }))

      // 4. Build table cells in one pass
      let cells = ([*m \\ n*],)
      for n in range(k + 1) { cells.push([*#n*]) }
      for m in range(k + 1) {
        cells.push([*#m*])
        for n in range(k + 1) {
          let c = m * m + 4 * n * n
          let val = if c > 0 { simp-surd(c) } else { [0] }
          cells.push(val)
        }
      }

      // 5. Render
      align(center)[
        #table(
          columns: k + 2,
          align: center + horizon,
          fill: (col, row) => fills.at(row).at(col),
          ..cells
        )
      ]
    }
    I added the hsv gradient to see if I could spot something.
    It is clear that lower modes generally have lower cutoff frequencies this makes sense considering $m$ counts the number of half-wavelengths that fit across $a$ and $n$ counts the number of half-wavelenghts across $b$.
    This however does not mean the cut-off is monotonically increasing, case in point:
    $
      (0,3) & = 6 & > (2,2) = 2sqrt(5)
    $
    even though $3 < 4$ from $m + n$.

    Since $a approx 2b$ that means half-wavelengths across $b$ cost twice as much in frequency as half-wavelengths across $a$.
    The above explain why the degenerate modes occur as
    $
      (2,0) equiv (0,1) & = 2 \
      (4,0) equiv (0,2) & = 4 \
      (4,1) equiv (2,2) & = 2 sqrt(5)
    $
    Generally degeneracy happens when $m_(1)^2 + 4n_(1)^2 = m_(2)^2 + 4n_(2)^2$

    The $(0,0)$ entry is not a mode but a trivial solution of the transverse Helmholtz problem.
  ]
]

