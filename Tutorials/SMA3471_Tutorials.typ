#import "assignment-template.typ": *
#import "@preview/nth:1.0.1": *

#show: assignment.with(assignment-name: "SMA3471 Tutorial")

= Exercise 1

#numed-question(
  lead: [A die is loaded such that the probability of a face showing up is proportional to the face number. Determine the probability of each sample point.],
)[
  #answer-box()[
    Since the probability of a face showing up is propotional to the face number:
    $
      P(X = x) = k times x
    $
    From Asimov's axioms we know that the sum probability of all possibilities is 1. Hence:
    $
      P(1) + P(2) + P(3) + P(4) + P(5) + P(6) & = 1 \
                     k(1 + 2 + 3 + 4 + 5 + 6) & = 1
    $
    Which gives:
    $
      21k & = 1 \
        k & = 1/21
    $
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto, auto),
        $x$, "1", "2", "3", "4", "5", "6",
        $P(X = x)$, $1/21$, $2/21$, $3/21$, $4/21$, $5/21$, $6/21$,
      )
    ]
  ]
]

#numed-question(
  lead: [Roll a fair die and let X be the square of the score that shows up. Write down the probability distribution of X hence compute:],
)[
  #answer-box()[
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto, auto),
        $x$, "1", "2", "3", "4", "5", "6",
        $x^2$, "1", "4", "9", "16", "25", "36",
        $P(X = x)$, $1/6$, $1/6$, $1/6$, $1/6$, $1/6$, $1/6$,
      )
    ]
  ]

  #sub-question(
    [$P(X < 15)$],
    answer: answer-box()[
      From the above table we see
      $
        P(X < 15) & = P(1) + P(2) + P(3) \
                  & = 1/6 times 3 \
                  & = 1/2
      $
    ],
  )

  #sub-question(
    [$P(3 < X < 30)$],
    answer: answer-box()[
      $
        P(3 < X < 15) & = P(2) + P(3) + P(4) + P(5) \
                      & = 1/6 times 4 \
                      & = 2/3
      $
    ],
  )
]

// Question 3
#numed-question(
  lead: [
    Let X be the random variable the number of fours observed when two dice are rolled together once.
    Show that X is a discrete random variable.
  ],
)[
  #answer-box()[
    #{
      let counts = (0, 0, 0)

      // Pre-calculate the grid cells and track counts
      let cells = ()

      // Header row cells
      cells.push([]) // empty top-left corner
      for y in range(1, 7) {
        cells.push([*#y*])
      }

      // Grid rows
      for x in range(1, 7) {
        cells.push([*#x*]) // row header
        for y in range(1, 7) {
          let n = if x == 4 and y == 4 { 2 } else if x == 4 or y == 4 { 1 } else { 0 }
          counts.at(n) += 1
          cells.push([($#x, #y$)])
        }
      }

      [The probability space of two dice rolled together is:]
      align(center)[
        #table(
          columns: 7,
          align: center + horizon,
          ..cells
        )
      ]
      [The above gives us a probability distribution:]
      align(center)[
        #table(
          columns: 4,
          "x", "0", "1", "2",
          [$P(X = x)$], [#simp-frac(counts.at(0), 36)], [#simp-frac(counts.at(1), 36)], [#simp-frac(counts.at(2), 36)],
        )
      ]
      [This in turn shows that $op("Range")(X) = {0, 1, 2}$.]
      [Since the range is finite containing 3 distinct numbers $X$ satisfies the mathematical definition of a discrete random variable.]
    }
  ]
]

// Question 4
#numed-question(
  lead: [The PMF of a discrete random variable X is given by $P(X = x) = k x$ for $x = 1, 2, 3, 4, 5, 6$. Find:],
)[
  #sub-question(
    [The value of the constant k],
    answer: answer-box()[
      The value of $k$ is #simp-frac(1, range(1, 7).sum()).

      #table(
        columns: 7,
        "x", ..range(1, 7).map(x => [#x]),
        [$P(X = x)$], ..range(1, 7).map(x => simp-frac(x, range(1, 7).sum())),
      )
    ],
  )

  #sub-question(
    [$P(X < 4)$],
    answer: answer-box()[
      $
        frac(1 + 2 + 3, 21) \
        #simp-frac(range(1, 4).sum(), range(1, 7).sum())
      $
    ],
  )

  #sub-question(
    [$P(3 lt.eq X < 6)$],
    answer: answer-box()[
      $
        frac(3 + 4 + 5, 21) \
        #simp-frac(range(3, 6).sum(), range(1, 7).sum())
      $
    ],
  )
]

// Question 5
#numed-question(
  lead: [
    A fair coin is flip until a head appears.
    Let N represent the number of tosses required to realize a head.
    Find:
  ],
)[
  #sub-question(
    [The PMF of N],
    answer: answer-box()[
      To get the first head on the n#super[th] toss it means all the other tosses were tails.
      Take $p$ to be the probability of getting head /*damn near impossible(double entendre on head)*/.
      The probability of getting head on the n#super[th] toss is therefore:
      $
        P(N = n) = (1 - p)^(n - 1) dot p
      $
      Substituting the given value:
      $
        P(N = n) = (frac(1, 2))^(n)
      $
    ],
  )

  #sub-question(
    [$P(N < 2)$],
    answer: answer-box()[
      It took less than 2 tosses to get head/*I refuse to grow up this double entendre is genuinely making me lol */ meaning it was one toss
      $
        P(1) = 1/2
      $
    ],
  )

  #sub-question(
    [$P(N gt.eq 2)$],
    answer: answer-box()[
      Using the complements rule:
      $
        P(not 1) & = 1 - 0.5 \
                 & = 0.5
      $
      /* We are therefore guaranteed head yaaay */
    ],
  )
]

// Question 6
#numed-question(
  lead: [
    A discrete random variable Y has a PMF given by $P(Y = y) = c(3/4)^y$ for $y = 0, 1, 2, ...$.
    Find , $P(X < 3)$ and $P(X >= 3)$.
  ],
)[
  #sub-question(
    [The value of the constant c],
    answer: answer-box()[
      From Kolmogorov's axioms:
      $
             sum_(y=1)^(oo) P(Y=y) & = 1 \
         sum_(y=1)^(oo) c(3/4)^(y) & = 1 \
        c sum_(y=1)^(oo) (3/4)^(y) & = 1 \
      $

      The above summation is an infinite geometric series of the form:
      $
        sum_(y=1)^(oo) r^(y)
      $
      where $r = 3/4$.

      Since $|r| < 1$ the series converges to $frac(1, 1 - r)$:
      $
        sum_(y=1)^(oo) (3/4)^(y) & = frac(1, 1 - 3/4) \
                                 & = 1 / 0.25 \
                                 & = 4
      $

      Hence $4c = 1$ meaning $c = 1/4$.
    ],
  )

  #sub-question(
    [$P(X < 3)$],
    answer: answer-box()[
      $
        1/4[1 + 3/4 + 9/16] \
        #dec-to-frac((1 / 4) * (1 + 3 / 4 + 9 / 16))
      $
    ],
  )

  #sub-question(
    [$P(X gt.eq 3)$],
    answer: answer-box()[
      We use complements rule:
      $
        1 - P(X < 3) \
        1 - #dec-to-frac((1 / 4) * (1 + 3 / 4 + 9 / 16))\
        #dec-to-frac(1 - ((1 / 4) * (1 + 3 / 4 + 9 / 16)))
      $
    ],
  )
]

// Question 7
#numed-question(
  lead: [Verify that $f(x) = (2x) / (k(k+1))$ for $y = 0, 1, 2, ..., k$ can serve as a PMF of a random variable X.],
)[
  #answer-box()[
    We have to prove non-negativity for any valid value of $x$ and that the summation of $f(x)$ is 1.
    The term $k(k+1)$ is non-negative for any non-negative integer $k$ and $x in bb(N)_(0)$ $f(x)$ is non-negative.

    For the summation condition:
    $
      sum_(x=1)^(k) frac(2x, k(k + 1)) \
      frac(2, k(k + 1)) sum_(x=1)^(k) x\
    $

    The expression for the sum of the first $k$ natural numbers is:
    $
      frac(k(k + 1), 2)
    $

    Hence:
    $
      frac(2, k(k + 1)) dot frac(k(k + 1), 2) \
      1
    $

    Fulfilling the summation condition and proving $f(x)$ is indeed a PMF.
  ]
]

// Question 8 tst
#numed-question(
  lead: [For each of the following determine c so that the function can serve as a PMF of a random variable X.],
)[
  #sub-question(
    [$f(x) = c$ for $x = 1, 2, 3, 4, 5$],
    answer: answer-box()[
      $
        c sum_(x=1)^(5) 1 & = 1 \
                       5c & = 1 \
                        c & = 1/5
      $
      #align(center)[
        #table(
          columns: 6,
          "x", ..range(1, 6).map(x => [#x]),
          [$P(X = x)$], ..range(1, 6).map(x => [$frac(1, 5)$]),
        )
      ]
      $
        P(X = x) = 1/6
      $
    ],
  )
  #sub-question(
    [$f(x) = c x$ for $x = 1, 2, 3, 4, 5$],
    answer: answer-box()[
      $
        c sum_(x=1)^(5) x & = 1 \
                      15c & = 1 \
                        c & = 1/15
      $
      #align(center)[
        #table(
          columns: 6,
          "x", ..range(1, 6).map(x => [#x]),
          [$P(X = x)$], ..range(1, 6).map(x => [#simp-frac(x, range(1, 6).sum())]),
        )
      ]
      $
        P(X = x) = x/15
      $
    ],
  )
  #sub-question(
    [$f(x) = c x^2$ for $x = 0, 1, 2, ..., k$],
    answer: answer-box()[
      $
                      c sum_(x=1)^(5) x^2 & = 1 \
        c dot (frac(k(k + 1)(2k + 1), 6)) & = 1 \
                                        c & = frac(6, k(k + 1)(2k + 1))
      $
      $
        P(X = x) = (frac(6, k(k + 1)(2k + 1))) x^2
      $
    ],
  )
  #sub-question(
    [$f(x) = c/2^x$ for $x = -1, 0, 1, 2$],
    answer: answer-box()[
      $
                                        c sum_(x=-1)^(2) frac(1, 2^(x)) & = 1 \
        #dec-to-frac(range(-1, 3).map(x => 1 / calc.pow(2, x)).sum()) c & = 1 \
                                                                      c & = 4/15
      $
      #align(center)[
        #table(
          columns: 5,
          "x", ..range(-1, 3).map(x => [#x]),
          [$P(X = x)$], ..range(-1, 3).map(x => [#dec-to-frac(4 / 15 * (1 / calc.pow(2, x)))]),
        )
      ]
      $
        P(X = x) = frac(4, 15) dot frac(1, 2^(x))
      $
    ],
  )
  #sub-question(
    [$f(x) = (x-2)/c$ for $x = 1, 2, 3, 4, 5$],
    answer: answer-box()[
      $
                               1/c sum_(x=1)^(5) x-2 & = 1 \
        1/c dot #(range(1, 6).map(x => x - 2)).sum() & = 1 \
                                                   c & = 5
      $
      #align(center)[
        #table(
          columns: 6,
          "x", ..range(1, 6).map(x => [#x]),
          [$P(X = x)$], ..range(1, 6).map(x => [#((x - 2) / 5)]),
        )
      ]
      $
        P(X = x) = (x - 2)/2
      $
      The above is an invalid PMF since the $P(1) = -0.2$ and $P(2) = 0$
    ],
  )
  #sub-question(
    [$f(x) = (x^2 - x + 1)/c$ for $x = 1, 2, 3, 4, 5$],
    answer: answer-box()[
      $
                               1/c sum_(x=1)^(5) x^2 - x + 1 & = 1 \
        1/c dot #(range(1, 6).map(x => x * x - x + 1)).sum() & = 1 \
                                                           c & = 45
      $
      #align(center)[
        #table(
          columns: 6,
          "x", ..range(1, 6).map(x => [#x]),
          [$P(X = x)$], ..range(1, 6).map(x => [#calc.round((x * x - x + 1) / 45, digits: 2)]),
        )
      ]
      $
        P(X = x) = frac(x^2 - x + 1, 45)
      $
    ],
  )
  #sub-question(
    [$f(x) = c(x^2 + 1)$ for $x = 0, 1, 2, 3$],
    answer: answer-box()[
      $
                               c sum_(x=1)^(5) x^2 + 1 & = 1 \
        c dot #(range(0, 4).map(x => x * x + 1)).sum() & = 1 \
                                                     c & = 18
      $
      #align(center)[
        #table(
          columns: 5,
          "x", ..range(0, 4).map(x => [#x]),
          [$P(X = x)$], ..range(0, 4).map(x => [#calc.round((x * x + 1) / 18, digits: 2)]),
        )
      ]
      $
        P(X = x) = frac(x^2 + 1, 18)
      $
    ],
  )
  #sub-question(
    [$f(x) = c x binom(5, x)$ for $x = 1, 2, 3$],
    answer: answer-box()[
      $
                                                        c sum_(x=1)^(3) frac(5!, (x - 1)(5 - x)!) & = 1 \
        c dot #(range(1, 4).map(x => calc.fact(5) / (calc.fact(x - 1) * calc.fact(5 - x))).sum()) & = 1 \
                                                                                                c & = 1/55
      $
      #align(center)[
        #table(
          columns: 4,
          "x", ..range(1, 4).map(x => [#x]),
          [$P(X = x)$],
          ..range(1, 4).map(x => [#calc.round(calc.fact(5) / (calc.fact(x - 1) * calc.fact(5 - x)) / 55, digits: 2)]),
        )
      ]
      $
        P(X = x) = frac(x, 55) binom(5, x)
      $
    ],
  )
  #sub-question(
    [$f(x) = c(1/6)^x$ for $x = 0, 1, 2, 3, ...$],
    answer: answer-box()[
      $
        c sum_(x=0)^(oo) (1/6)^(x) & = 1 \
            c dot frac(1, 1 - 1/6) & = 1 \
                         c dot 6/5 & = 1 \
                                 c & = 5/6
      $
      $
        P(X = x) = 5 dot (1/6)^(x + 1)
      $

    ],
  )
  #sub-question(
    [$f(x) = c 2^(-x)$ for $x = 0, 1, 2, ...$],
    answer: answer-box()[
      $
        c sum_(x=0)^(oo) (1/2)^(x) & = 1 \
            c dot frac(1, 1 - 1/2) & = 1 \
                           c dot 2 & = 1 \
                                 c & = 1/2
      $
      $
        P(X = x) = (1/2)^(x + 1)
      $
    ],
  )
]

// Question 9
#numed-question(
  lead: [A coin is loaded so that heads is three times as likely as the tails.],
)[
  #sub-question(
    [For 3 independent tosses of the coin find the PMF of the total number of heads realized and the probability of realizing at most 2 heads.],
    answer: answer-box()[
      Take $p$ as the probality we realize head /* manifesting (I may need help)*/.
      $p/3 + p = 1$ hence $p = 3/4$.
      For 3 independent tosses the are four possible counts for head: 0,1,2,3
      #{
        let n = 3
        let x-vals = range(0, n + 1)

        let pmf-vals = x-vals.map(x => {
          let possiblities = nCr(n, x)
          let num = possiblities * calc.pow(3, x)
          let den = calc.pow(4, n)
          [$frac(#str(num), #str(den))$]
        })
        align(center)[
          #table(
            columns: (auto, ..x-vals.map(_ => auto)),
            [$x$], ..x-vals.map(x => [#x]),
            [$P(X = x)$], ..pmf-vals,
          )
        ]
      }
      With the PMF given as:
      $
        P(X = x) = binom(3, x) dot (3/4)^(x) dot (1/4)^(3 - x)
      $

      Reading the table the probability we get head at most twice:
      $
        frac(1 + 9 + 27, 64) \
        37/64
      $
    ],
  )
  #sub-question(
    [
      A game is played such that you earn 2 points for a head and lose 5 points for a tail.
      Write down the probability distribution of the total scores after 4 independent tosses of the coin.
    ],
    answer: answer-box()[
      Since:
      $
        s = 2x - 5(n - x) = 7x - 5n
      $
      is one-to-one, each score corresponds to exactly one value of $x$.
      Hence the probability of a given score is:
      $
        P(S = s) = P(X = x) = binom(n, x) dot (3/4)^(x) dot (1/4)^(n - x)
      $
      where $n$ is the number of tosses and $x$ is the number of times heads lands in those tosses.

      #{
        let n = 4
        let x-vals = range(0, n + 1)
        let scores = x-vals.map(x => [#(7 * x - 5 * n)])
        let probabilities = x-vals.map(x => {
          let possiblities = nCr(n, x)
          let num = possiblities * calc.pow(3, x)
          let den = calc.pow(4, n)
          [$frac(#str(num), #str(den))$]
        })
        align(center)[
          #table(
            columns: (auto, ..x-vals.map(_ => auto)),
            [$s$], ..scores,
            [$P(S = s)$], ..probabilities,
          )
        ]
      }
    ],
  )
]

// Question 10
#numed-question(
  lead: [
    For an on-line electronics retailer, X = "the number of Zony digital cameras returned per day" follows the distribution given by
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto, auto),
        $x$, "0", "1", "2", "3", "4", "5",
        $P(X=x)$, "0.05", "0.1", $t$, "0.2", "0.25", "0.1",
      )
    ]
    Find:
  ],
)[
  #sub-question(
    [The value of $t$],
    answer: answer-box()[
      $
        #calc.round(0.05 + 0.1 + 0.2 + 0.25 + 0.1, digits: 2) + t & = 1 \
                                                                t & = 0.3
      $

    ],
  )

  #sub-question(
    [$P(X > 3)$],
    answer: answer-box()[
      $
        0.25 + 0.1 \
        0.35
      $
    ],
  )
]

// Question 11
#numed-question(
  lead: [Out of 5 components, 3 are domestic and 2 are imported. 3 components are selected at random (without replacement). Obtain the PMF of X = "number of domestic components picked" (make a table).],
)[
  #answer-box()[
    The probability of picking a domestic component is $3/5$.
    Since there is no replacement this is a hypergeometric.
    The probability $k$ successes in $n$ draws is thus:
    $
      P(X = k) = frac(binom(K, k) binom(N - K, n - k), binom(N, n))
    $
    where:
    $
      N & ": The total population size" \
      K & ": Number of success items in the population" \
      n & ": Samples size drawn" \
      k & ": number of observed successes in the sample"
    $

    There are 3 possibilities for the number of domestic components picked: 1, 2, 3.
    Zero is not a possibility since there are only 2 imported components out of the 5.
    #{
      let n = 3
      let x-vals = range(1, n + 1)

      align(center)[
        #table(
          columns: (auto, ..x-vals.map(_ => auto)),
          [$x$], ..x-vals.map(x => [#x]),
          [$P(X = x)$],
          ..x-vals.map(x => {
            let prob = dec-to-frac(hypergeometric(5, 3, 3, x))
            [#prob]
          }),
        )
      ]
    }
    The PMF is:
    $
      P(X = x) & = frac(binom(3, x) binom(2, 3 - x), binom(5, 3)) \
               & = frac(binom(3, x) binom(2, 3 - x), 10)
    $
  ]
]

= Exercise 2

#numed-question(
  lead: [
    Suppose that the random variable X has p.d.f. given by
    $
      f(x) = cases(
        c x "," & 0 <= x <= 1,
        0 "," & "elsewhere"
      )
    $
    Find:
  ],
)[
  #sub-question(
    [The value of the constant $c$],
    answer: answer-box()[
      $
        integral_0^(1) c x dif x & = 1 \
                  c[x^2/2]_0^(1) & = 1 \
                       1/2 dot c & = 1 \
                               c & = 2
      $
    ],
  )

  #sub-question(
    [Determine $m$ so that $P(X <= m) = 1/2$.],
    answer: answer-box()[
      $
        integral_0^(m) 2x dif x & = 1/2 \
                        m^2 - 0 & = 1/2 \
                              m & = 1/sqrt(2)
      $
    ],
  )
]

#numed-question(
  lead: [
    Let X be a continuous random variable with PDF
    $
      f(x) = cases(
        x/5 + k"," & 0 <= x <= 3,
        0"," & "elsewhere"
      )
    $
    Find
  ],
)[
  #sub-question(
    [The value of the constant $k$],
    answer: answer-box()[
      $
        integral_0^(3) x/5 + k dif x & = 1 \
                [x^2/10 + k x]_0^(3) & = 1 \
                         (9/10 + 3k) & = 1 \
                                  3k & = 1/10 \
                                   k & = 1/30
      $
    ],
  )

  #sub-question(
    [Compute $P(1 < X < 3)$.],
    answer: answer-box()[
      $
        P(1 < X < 3) & = integral_1^(3) x/5 + 1/30 dif x \
                     & = 1/30 integral_1^(3) 6x + 1 dif x \
                     & = 1/30 [3x^2 + x]_1^(3) \
                     & = frac(30 - 4, 30) \
                     & = #simp-frac(26, 30)
      $
    ],
  )
]

#numed-question(
  lead: [
    A continuous random variable Y has the PDF given by
    $
      f(y) = cases(
        k(1 + y)"," & 4 <= y <= 7,
        0"," & "elsewhere"
      )
    $
    Find:
  ],
)[
  #sub-question(
    [The value of the constant $k$],
    answer: answer-box()[
      $
        k integral_4^(7) 1 + y dif y & = 1 \
                 k [y + y^2/2]_4^(7) & = 1 \
            k [(49/2 + 7) - (8 + 4)] & = 1 \
                            k [19.5] & = 1 \
                                   k & = 2/39
      $
    ],
  )

  #sub-question(
    [Compute $P(Y < 5)$ and $P(5 < Y < 6)$],
    answer: answer-box()[
      $
        P(Y < 5) & = 2/39 integral_4^(5) 1 + y dif y \
                 & = 2/39[y^2/2 + y]_4^(5) \
                 & = 2/39[12.5 + 5 - 8 - 4] \
                 & = 2/39 dot 11/2 \
                 & = #simp-frac(2 * 11, 39 * 2)
      $
      $
        P(5< Y < 6) & = 2/39 integral_5^(6) 1 + y dif y \
                    & = 2/39[y^2/2 + y]_5^(6) \
                    & = 2/39[18 + 6 - 12.5 - 5] \
                    & = 2/39 dot 13/2 \
                    & = #simp-frac(2 * 13, 39 * 2)
      $
    ],
  )
]

#numed-question(
  lead: [A continuous random variable X has the PDF given by
    $
      f(x) = cases(
        k(1 + x)^2"," & -2 <= x <= 0,
        4k"," & 0 < x <= 3/4,
        0"," & "elsewhere"
      )
    $
    Find:],
)[
  #sub-question(
    [The value of the constant $k$],
    answer: answer-box()[
      $
        k integral_(-2)^(0) (1 + x)^2 dif x + k integral_0^(3/4) 4 dif x & = 1 \
                      k [frac((1 + x)^(3), 3)]_(-2)^(0) + k [4x]_0^(3/4) & = 1 \
                                                          k [2/3] + k[3] & = 1 \
                                                              k dot 11/3 & = 1 \
                                                                       k & = 3/11
      $
    ],
  )

  #sub-question(
    [Compute $P(X > 1)$ and $P(-1 < X < 1)$.],
    answer: answer-box()[
      $
        P(X > 1) = 0
      $
      $
        P( -1 < X < 1) & = 3/11 integral_(-1)^(0) (1 + x)^2 dif x + 3/11 integral_0^(3/4) 4 dif x \
                       & = 3/11 dot [1/3] + 3/11 dot [3] \
                       & = 10/11
      $
    ],
  )
]

#numed-question(
  lead: [
    A continuous random variable X has the PDF given by
    $
      f(x) = cases(
        k x"," & 0 <= x <= 2,
        k(4 - x)"," & 2 < x <= 4,
        0"," & "elsewhere"
      )
    $
    Find:
  ],
)[
  #sub-question(
    [The value of the constant $k$],
    answer: answer-box()[
      $
                                              & = 1 \
        k [x^2/2]_0^(2) + k[4x - x^2/2]_2^(4) & = 1 \
                              k[2] + k[8 - 6] & = 1 \
                                      k dot 4 & = 1 \
                                            k & = 1/4
      $
    ],
  )

  #sub-question(
    [Compute $P(X > 3)$ and $P(1 < X < 3)$],
    answer: answer-box()[
      $
        P(X > 3) & = 1/4 integral_3^(4) 4 - x dif x \
                 & = 1/4 [4x - x^2/2]_3^(4) \
                 & = 1/4 [8 - 7.5] \
                 & = #simp-frac(1 * 1, 4 * 2)
      $
      $
        P(1 < X < 3) & = 1/4 integral_1^(2) x dif x + 1/4 integral_2^(3) 4 - x dif x \
                     & = 1/4 [x^2/2]_1^(2) + 1/4[4x - x^2/2]_2^(3) \
                     & = 1/4 dot [2 - 1/2] + 1/4 dot [7.5 - 6] \
                     & = 3/8 + 3/8 \
                     & = 3/4
      $
    ],
  )
]
= Exercise 3

#numed-question(
  lead: [The PDF of a continuous random variable $X$ is given by
    $
      f(x) = cases(
        C/sqrt(x)"," & 0 <= x <= 4,
        "0," & "elsewhere"
      )
    $
    Find:
  ],
)[
  #sub-question(
    [The value of the constant $C$],
    answer: answer-box()[
      $
        1 & = C integral_(0)^(4) frac(1, sqrt(x)) dif x \
          & = 2C lr(sqrt(x)|)_(0)^(4) \
          & = 4 C \
        C & = 1/4
      $
    ],
  )

  #sub-question(
    [The CDF of $X$ and $P(X >= 1)$.],
    answer: answer-box()[

    ],
  )
]

#numed-question(
  lead: [The PDF of a random variable $X$ is given by
    $
      g(x) = cases(
        k x (1 - x)"," & 0 <= x <= 1,
        "0," & "elsewhere"
      )
    $
    Find:
  ],
)[
  #sub-question(
    [The value of the constant $k$.],
    answer: answer-box()[

    ],
  )

  #sub-question(
    [The CDF of $X$ and the value of $m$ such that $G(x) = 1/2$.],
    answer: answer-box()[

    ],
  )
]

#numed-question(
  lead: [Find the CDF of a random variable Y whose PDF is given by;],
)[
  #sub-question(
    $
      f(x) = cases(
        1/3"," & 0 <= x <= 1,
        1/3"," & 2 <= x <= 4,
        "0," & "elsewhere"
      )
    $,
    answer: [#answer-box()],
  )
  #sub-question(
    $
      f(x) = cases(
        1/2"," & 0 <= x <= 1,
        1/2"," & 1 <= x <= 2,
        (3-x)/2"," & 2 <= x <= 3,
        "0," & "elsewhere"
      )
    $,
    answer: [#answer-box()],
  )
]

#numed-question(
  lead: [If the CDF of a random variable Y is given by $F(x) = 1 - 9/y^3$ for $Y >= 3$ and $F(x) = 0$ for $Y < 3$, find $P(X <= 5)$, $P(X > 8)$ and the PDF of X.],
)[
  #answer-box()
]

= Exercise 4

#numed-question(
  lead: [Suppose X has a probability mass function given by the table below
    #align(center)[
      #table(
        columns: 6,
        align: center,
        $x$, "2", "3", "4", "5", "6",
        $P(X=x)$, "0.01", "0.25", "0.4", "0.3", "0.04",
      )
    ]
    Find the mean and variance of; X],
)[
  #answer-box()
]

#numed-question(
  lead: [Suppose X has a probability mass function given by the table below
    #align(center)[
      #table(
        columns: 6,
        align: center,
        $x$, "11", "12", "13", "14", "15",
        $P(X=x)$, "0.4", "0.2", "0.2", "0.1", "0.1",
      )
    ]
    Find the mean and variance of; X],
)[
  #answer-box()
]

#numed-question(
  lead: [Let X be a random variable with $P(X = 1) = 0.2$, $P(X = 2) = 0.3$, and $P(X = 3) = 0.5$. What is the expected value and standard deviation of;],
)[
  #sub-question-group()[
    #sub-question([X], answer: [#answer-box()])
    #sub-question([$Y = 5X - 10$], answer: [#answer-box()])
  ]
]

#numed-question(
  lead: [A random variable W has the probability distribution shown below,
    #align(center)[
      #table(
        columns: 5,
        align: center,
        $w$, "0", "1", "2", "3",
        $P(W=w)$, "2d", "0.3", "d", "0.1",
      )
    ]
    Find the values of the constant d hence determine the mean and variance of W. Also find the mean and variance of $Y = 10X + 25$],
)[
  #answer-box()
]

#numed-question(
  lead: [A random variable X has the probability distribution shown below,
    #align(center)[
      #table(
        columns: 6,
        align: center,
        $x$, "1", "2", "3", "4", "5",
        $P(X=x)$, "7c", "5c", "4c", "3c", "c",
      )
    ]
    Find the values of the constant c hence determine the mean and variance of X.],
)[
  #answer-box()
]

#numed-question(
  lead: [The random variable Z has the probability distribution shown below,
    #align(center)[
      #table(
        columns: 6,
        align: center,
        $z$, "2", "3", "5", "7", "11",
        $P(Z=z)$, $1/6$, $1/3$, $1/4$, $x$, $y$,
      )
    ]
    If $E(Z) = 4 1/3$, find the values of x and y hence determine the variance of Z],
)[
  #answer-box()
]

#numed-question(
  lead: [A discrete random variable M has the probability distribution
    $
      f(m) = cases(
        m/36",", & m = 1, 2, 3, ..., 8,
        0",", & "elsewhere"
      )
    $
    find the mean and variance of M],
)[
  #answer-box()
]

#numed-question(
  lead: [For a discrete random variable Y the probability distribution is
    $
      f(y) = cases(
        (5-y)/10",", & y = 1, 2, 3, 4,
        0",", & "elsewhere"
      )
    $
    calculate $E(Y)$ and $op("var")(Y)$],
)[
  #answer-box()
]

#numed-question(
  lead: [Suppose X has a pmf given by
    $
      f(x) = cases(
        k x",", & "for " x = 1, 2, 3, 4,
        0",", & "elsewhere"
      )
    $
    find the value of the constant k hence obtain the mean and variance of X],
)[
  #answer-box()
]

#numed-question(
  lead: [A team of 3 is to be chosen from 4 girl and 6 boys. If X is the number of girls in the team, find the probability distribution of X hence determine the mean and variance of X],
)[
  #answer-box()
]

#numed-question(
  lead: [A fair six sided die has; '1' on one face, '2' on two of it's faces and '3' on the remaining three faces. The die is rolled twice. If T is the total score write down the probability distribution of T hence determine;],
)[
  #sub-question-group()[
    #sub-question([The probability that T is more than 4], answer: [#answer-box()])
    #sub-question([The mean and variance of T], answer: [#answer-box()])
  ]
]

#numed-question(
  lead: [The PDF of a continuous r.v R is given by
    $
      f(r) = cases(
        k r",", & "for " 0 <= r <= 4,
        0",", & "elsewhere"
      )
    $
    (a) Determine c. hence Compute $P(10 <= r <= 2)$, $E(X)$ and $op("Var")(X)$.],
)[
  #answer-box()
]

#numed-question(
  lead: [A continuous r.v M has the PDF given by
    $
      f(m) = cases(
        k(1 - m/10)",", & "for " M <= 10,
        0",", & "elsewhere"
      )
    $
    find the value of the constant k, the mean and the variance of X],
)[
  #answer-box()
]

#numed-question(
  lead: [A continuous r.v X has the PDF given by
    $
      f(x) = cases(
        k(1 - x)",", & "for " 0 <= x <= 1,
        0",", & "elsewhere"
      )
    $
    find the value of the constant k. Also find the mean and the variance of X],
)[
  #answer-box()
]

#numed-question(
  lead: [The lifetime of new bus engines, T years, has continuous PDF
    $
      f(t) = cases(
        d/t^3",", & "if " x >= 1,
        0",", & "if " x < 1
      )
    $
    find the value of the constant d hence determine the mean and standard deviation of T],
)[
  #answer-box()
]

#numed-question(
  lead: [An archer shoots an arrow at a target. The distance of the arrow from the centre of the target is a random variable X whose p.d.f. is given by
    $
      f(x) = cases(
        k(3 + 2x - x^2)",", & "if " x <= 3,
        0",", & "if " x > 3
      )
    $
    find the value of the constant k. Also find the mean and standard deviation of X],
)[
  #answer-box()
]

#numed-question(
  lead: [A continuous r.v X has the PDF given by
    $
      f(x) = cases(
        k(1 + x)",", & -1 <= x < 0,
        2k(1 - x)",", & 0 <= x <= 1,
        0",", & "elsewhere"
      )
    $
    find the value of the constant k. Also find the mean and the variance of X],
)[
  #answer-box()
]

#numed-question(
  lead: [A continuous r.v X has the PDF given by
    $
      f(x) = cases(
        e^(-x)",", & "for " x > 0,
        0",", & "elsewhere"
      )
    $
    find the mean and standard deviation of;],
)[
  #sub-question-group()[
    #sub-question([X], answer: [#answer-box()])
    #sub-question([$Y = e^(x/2)$], answer: [#answer-box()])
  ]
]


= Exercise 5

#numed-question(
  lead: [The annual salaries of employees in a large company are approximately normally distributed with a mean of \$50,000 and a standard deviation of \$10,000. If a random sample of 50 employees is taken what is the probability that their average salary is;],
)[
  #sub-question([less than \$45,000?], answer: [#answer-box()])
  #sub-question([between \$45,000 and \$65,000?], answer: [#answer-box()])
  #sub-question([more than \$70,000], answer: [#answer-box()])
]
#numed-question(
  lead: [Library usually has 13% of its books checked out. Find the probability that in a sample of 588 books greater than 14% are checked out. ANS = 0.2358],
)[
  #answer-box()
]

#numed-question(
  lead: [The length of similar components produced by a company are approximated by a normal distribution model with a mean of 5 cm and a standard deviation of 0.02 cm.],
)[
  #sub-question-group()[
    #sub-question(
      [If a component is chosen at random what is the probability that the length of this component is between 4.98 and 5.02 cm?],
      answer: [#answer-box()],
    )
    #sub-question(
      [what is the probability that the average length of a sample of 25 component is between 4.96 and 5.04 cm?],
      answer: [#answer-box()],
    )
  ]
]

#numed-question(
  lead: [The length of life of an instrument produced by a machine has a normal distribution with a mean of 12 months and standard deviation of 2 months. Find the probability that in a random sample of 4 instrument produced by this machine, the average length of life],
)[
  #sub-question-group()[
    #sub-question([less than 10.5 months.], answer: [#answer-box()])
    #sub-question([ between 11 and 13 months.], answer: [#answer-box()])
  ]
]

#numed-question(
  lead: [The time taken to assemble a car in a certain plant is a random variable having a normal distribution of 20 hours and a standard deviation of 2 hours. What is the probability that a car can be assembled at this plant in a period of time],
)[
  #sub-question-group()[
    #sub-question([less than 19.5 hours?], answer: [#answer-box()])
    #sub-question([between 20 and 22 hours?], answer: [#answer-box()])
  ]
]


#pagebreak()

= Exercise 6

#numed-question(
  lead: [Suppose $X tilde N(130, 25)$. Find;],
)[
  #sub-question-group()[
    #sub-question([$P(X < 140)$], answer: [#answer-box()])
    #sub-question([$P(X > 120)$], answer: [#answer-box()])
    #sub-question([$P(130 < X < 135)$], answer: [#answer-box()])
  ]
]

#numed-question(
  lead: [The random variable X is normally distributed with mean 500 and standard deviation 100. Find;],
)[
  #sub-question([$P(X < 400)$], answer: [#answer-box()])
  #sub-question([$P(X > 620)$], answer: [#answer-box()])
  #sub-question([the $90^"th"$ percentile], answer: [#answer-box()])
  #sub-question(
    [the lower and upper quartiles. Use graphs with labels to illustrate your answers.],
    answer: [#answer-box()],
  )
]

#numed-question(
  lead: [A radar unit is used to measure speeds of cars on a motorway. The speeds are normally distributed with a mean of 90 km/hr and a standard deviation of 10 km/hr. What is the probability that a car picked at random is travelling at more than 100 km/hr?],
)[
  #answer-box()
]

#numed-question(
  lead: [For a certain type of computers, the length of time between charges of the battery is normally distributed with a mean of 50 hours and a standard deviation of 15 hours. John owns one of these computers and wants to know the probability that the length of time will be between 50 and 70 hours],
)[
  #answer-box()
]

#numed-question(
  lead: [Entry to a certain University is determined by a national test. The scores on this test are normally distributed with a mean of 500 and a standard deviation of 100. Tom wants to be admitted to this university and he knows that he must score better than at least 70% of the students who took the test. Tom takes the test and scores 585. Will he be admitted to this university?],
)[
  #answer-box()
]

#numed-question(
  lead: [A large group of students took a test in Physics and the final grades have a mean of 70 and a standard deviation of 10. If we can approximate the distribution of these grades by a normal distribution, what percent of the student;],
)[
  #sub-question([scored higher than 80?], answer: [#answer-box()])
  #sub-question([should pass the test (grades $\geq 60$)?], answer: [#answer-box()])
  #sub-question([should fail the test (grades $< 60$)?], answer: [#answer-box()])
]

#numed-question(
  lead: [A machine produces bolts which are $N(4, 0.09)$ where measurements are in cm. Bolts are measured accurately and any bolt smaller than 3.5 cm or larger than 4.4 cm is rejected. Out of 500 bolts how many would be accepted? Ans 430],
)[
  #answer-box()
]

#numed-question(
  lead: [Suppose $"IQ" tilde N(100, 22.5)$. a woman wants to form an Egghead society which only admits people with the top 1% IQ score. What should she have to set the cut-off in the test to allow this to happen? Ans 134.9],
)[
  #answer-box()
]

#numed-question(
  lead: [A manufacturer does not know the mean and standard deviation of ball bearing he is producing. However a sieving system rejects all the bearings larger than 2.4 cm and those under 1.8 cm in diameter. Out of 1,000 ball bearings, 8% are rejected as too small and 5.5% as too big. What is the mean and standard deviation of the ball bearings produced? Ans mean=2.08 sigma=0.2],
)[
  #answer-box()
]
