#import "assignment-template.typ": *
#import "@preview/zap:0.6.0"
#import "@preview/cetz:0.5.1": canvas, draw
#import "@preview/cetz-plot:0.1.4": plot
#show: assignment.with(
  assignment-name: "Penance",
)


#numed-question(
  lead: [
    The network of @cct is driven by a $10 "V"$ battery in series with a small-signal source $v_(i)(t)$ which aids the battery.
    An inductor $L=0.5 "H"$ feeds a capacitor $C=0.05 "F"$ connected in parallel with a nonlinear resistor whose current-voltage law is
    $
      i_R = 0.01 v_R^2 quad (i_(R)" in amperes" v_(R)" in volts", v_(R) > 0).
    $
    The output is the capacitor voltage $v_C(t)$.

    #align(center)[
      #figure(
        zap.circuit({
          import zap: *
          cell("b", (0, 0), (0, 2), label: $10 "V"$)
          vsource("vt", "b.out", (rel: (0, 2)), current: "sin", label: $v(t)$)
          inductor("l", "vt.out", (rel: (3, 0)), label: $L$, i: (content: $i(t)$, invert: true, anchor: "west"))
          node("branch", (rel: "l.out", to: (2, 0)))
          wire("l.out", "branch")
          resistor(
            "r",
            "branch",
            (rel: (0, -4)),
            i: (content: $i_R$, invert: true, anchor: "west"),
            label: (content: [nonlinear \ resistor], anchor: "south"),
          )
          capacitor(
            "c",
            (rel: (2, -1), to: "branch"),
            (rel: (0, -2)),
            label: (content: $C$, anchor: "south"),
            u: (content: $v_C(t)$, invert: true, variant: "ieee"),
          )
          swire("branch", "c.in")
          swire((0, 0), "c.out")
        }),
      )<cct>
    ]
  ],
)[
  #sub-question(
    [With $v(t) = 0$, find the operating point: the dc resistor voltage $v_(R_0)$ and current $i_(R_0)$],
    answer: answer-box()[
      When $v(t) = 0$ the inductor becomes a short circuit(ignoring the transience of the DC source during powering up).
      Thus:
      $
        v_(R_0) & = 10 "V" \
        i_(R_0) & = 0.01 times 10^2 \
                & = 1 "A"
      $
    ],
  )

  #sub-question(
    [Linearize the resistor law about the operating point, and hence find the resistance to small signals.],
    answer: answer-box()[
      Linearizing
      $
        i_(R)(t) & = i_(R_(0)) + lr(frac(dif i_(R)(t), dif v_(R)(t))|)_(v_(R)(t) = v_(R_0)) (v_(R)(t) - v_(R_(0))) \
                 & = 1 + 0.02 times v_(R_(0)) (v_(R)(t) - v_(R_(0))) \
                 & = 1 + 0.2 (v_(R)(t) - 10) \
                 & = -1 + 0.2 v_(R)(t)
      $

      We know:
      $
        v_(R)(t) & = v_(R_(0)) + Delta v_(R)(t) \
                 & = 10 + Delta v_(R)(t) \
        i_(R)(t) & = i_(R_(0)) + Delta i_(R)(t) \
                 & = 1 + Delta i_(R)(t)
      $

      Hence:
      $
        1 + Delta i_(R)(t) & = -1 + 2 + 0.2 Delta v_(R)(t) \
            Delta i_(R)(t) & = 0.2 Delta v_(R)(t)
      $

      The resistance is:
      $
        R_(s) & = frac(Delta v_(R)(t), Delta i_(R)(t)) \
              & = 10/2 \
              & = 5 Omega
      $
    ],
  )

  #sub-question(
    [
      Draw the small-signal equivalent circuit and derive the transfer function $frac(Delta V_(C)(s), V_i(s))$.
      Hence find $omega_n, zeta$ and the poles of the small-signal model.
    ],
    answer: answer-box()[
      The small-signal equivalent circuit replaces the battery with a short.
      The non-linear resistor is replaced by $R_(s) = 5 Omega$.
      $
        Z_T(s) & = Z_(L) + (Z_(R)^(-1) + Z_(C)^(-1))^(-1) \
               & = 0.5 s + (1/5 + s/20)^(-1) \
               & = s/2 + frac(20, s + 4)
      $
      $
                        V_(C)(s) & = frac((Z_(R)^(-1) + Z_(C)^(-1))^(-1), Z_(T)) V_(i)(s) \
                                 & = frac(frac(20, s + 4), s/2 + frac(20, s + 4)) V_(i)(s) \
        frac(V_(C)(s), V_(i)(s)) & = frac(frac(20, s + 4), s/2 + frac(20, s + 4)) V_(i)(s) \
                                 & = frac(40, s^2 + 4s + 40)
      $

      This makes $omega_n = #simp-surd(40)$ and $zeta = 1/sqrt(10)$.

      From the standard form of second-order transfer functions the poles can be expressed as:
      $
        s_(1,2) & = - zeta omega_n plus.minus omega_n sqrt(zeta^2 - 1) \
                & = - 2 plus.minus j 6
      $
    ],
  )

  #sub-question(
    [
      The small-signal source can drive the resistor voltage up to $1 "V"$ either side of $v_(R_0)$.
      Compare the exact and linearised values of $Delta i_R$ at $Delta v_(R) = +1 "and" - 1 "V"$.
      Express each discrepancy as a percentage, and comment on whether the linear model is fit for use over this range.
    ],
    answer: answer-box()[
      At $v_(R) = 11 "V"$:
      $
        "Linearised": Delta i_(R) & = 0.2 times (11 - 10) \
                                  & = 0.2 "A" \
            "Actual": Delta i_(R) & = 0.01(11^2) - 0.01(10^2) \
                                  & = #calc.round(0.01 * calc.pow(11, 2) - 0.01 * calc.pow(10, 2), digits: 2) "A"
      $
      Percentage difference is $#calc.round(calc.abs((0.01 * calc.pow(11, 2) - 0.01 * calc.pow(10, 2)) - 0.2) / (0.01 * calc.pow(11, 2) - 0.01 * calc.pow(10, 2)) * 100, digits: 2)\%$

      At $v_(R) = 9 "V"$:
      $
        "Linearised": Delta i_(R) & = 0.2 times (9 - 10) \
                                  & = -0.2 "A" \
            "Actual": Delta i_(R) & = 0.01(9^2) - 0.01(10^2) \
                                  & = #calc.round(0.01 * calc.pow(9, 2) - 0.01 * calc.pow(10, 2), digits: 2) "A"
      $
      Percentage difference is $#calc.round(calc.abs((0.01 * calc.pow(9, 2) - 0.01 * calc.pow(10, 2)) - (-0.2)) / calc.abs(0.01 * calc.pow(9, 2) - 0.01 * calc.pow(10, 2)) * 100, digits: 2)\%$
    ],
  )
]


#numed-question(
  lead: [
    A process with transfer function
    $
      G_(p)(s) = frac(4, s + 2)
    $
    is perturbed by a sensor placed downstream of it so that the measurement lags the process by a pure transport delay of $tau = 0.2 "s"$
  ],
)[
  #sub-question(
    [
      Write down the transfer function $G(s)$ from input to measurement, and find the exact unit-step response $y(t)$.
      Explain why $G(s)$ cannot be drawn on a pole-zero map.
    ],
    answer: answer-box()[
      Since it is a pure transport delay the transfer function is essentially $G_(p)(s)$ by $e^(-0.2s)$.
      Hence:
      $
        G(s) = frac(4 e^(-0.2s), s + 2)
      $

      Response to the unit step function:
      $
        Y(s) & =frac(G(s), s) \
             & = e^(-0.2s) (frac(4, s(s + 2))) \
             & = e^(-0.2s) (frac(A, s) + frac(B, s + 2)) \
             & = e^(-0.2s) (2 dot frac(1, s) - 2 dot frac(1, s + 2)) \
        y(t) & = 2(1 - e^(-2(t - 0.2)))u(t - 0.2)
      $
      The transfer function contains a pure time delay term $e^{-0.2s}$, which is a transcendental function, not a rational polynomial.
      Therefore, it has an infinite number of poles and cannot be represented as a finite set of poles and zeros on a standard pole-zero map.
    ],
  )

  #sub-question(
    [
      Replace the delay by its first-order Padé approximation to obtain $G_(a)(s)$.
      State its poles and find the d.c. gain.
    ],
    answer: answer-box()[
      The first order Padé approximation is gives:
      $
        e^(-0.1s) approx frac(1 - 0.1 s, 1 + 0.1s)
      $
      Hence:
      $
        G_(a)(s) & = frac(1 - 0.1 s, 1 + 0.1s) (frac(4, (s + 2))) \
                 & = frac(40 - 4s, (s + 10)(s + 2)) \
                 & = frac(A, s + 2) + frac(B, s + 10) \
                 & = frac(6, s + 2) - 10 frac(1, s + 10) \
      $
      The poles are clearly:
      $
        s = -2, -10
      $

      The d.c gain is:
      $
        40/(10 times 2) \
        2
      $
    ],
  )

  #sub-question(
    [
      Find the unit step response $y_(a)(t)$ of $G_a(s)$
    ],
    answer: answer-box()[
      $
        Y_(a)(s) & = s G_(a)(s) \
                 & = frac(40 - 4s, s(s + 10)(s + 2)) \
                 & = frac(A, s + 2) + frac(B, s + 10) + frac(C, s) \
                 & = 2 dot 1/s - 3 dot 1/(s + 2) + 1/(s + 10) \
        y_(a)(t) & = 2 - 3e^(-2t) + e^(-10t)
      $
    ],
  )

  #sub-question(
    [
      Find $y_(a)(0^(+))$ and account for its sign.
      Evaluate $y$ and $y_a$ at $t = 0.2"s"$ and at $t = 1"s"$.
      Sketch both responses on one set of axes for $0 gt.eq t gt.eq 1 "s"$ and say where the approximation is good and where it fails.
    ],
    answer: answer-box()[
      Using the intial value theorem to find:
      $
        lim_(s -> oo) s Y_(a)(s) & = lim_(s -> oo) G_(a)(s) \
                                 & = lim_(s -> oo) frac(40 - 4s, (s + 10)(s + 2)) \
                                 & = lim_(s -> oo) frac(40/s^2 - 4/s, (1 + 12/s + 20/s^2)) \
                                 & = 0
      $

      At $t = 0.2$:
      $
            y(0.2) & = 2(1 - e^(-2(0.2 - 0.2)))u(0.2 - 0.2) \
                   & =#(2 * (1 - calc.pow(calc.e, -2 * (0.2 - 0.2))) * heaviside(0.2 - 0.2)) \
        y_(a)(0.2) & = 2 - 3e^(-2t) + e^(-10t) \
                   & = #calc.round(2 - 3 * calc.pow(calc.e, -2 * 0.2) + calc.pow(calc.e, -10 * 0.2), digits: 2)
      $

      At $t = 1$:
      $
            y(1) & = 2(1 - e^(-2(1 - 0.2)))u(1 - 0.2) \
                 & =#calc.round(2 * (1 - calc.pow(calc.e, -2 * (1 - 0.2))) * heaviside(1 - 0.2), digits: 3) \
        y_(a)(1) & = 2 - 3e^(-2 times 1) + e^(-10 times 1) \
                 & = #calc.round(2 - 3 * calc.pow(calc.e, -2 * 1) + calc.pow(calc.e, -10 * 1), digits: 3)
      $
      #align(center)[
        #figure(
          canvas({
            import draw: *
            plot.plot(
              size: (10, 10),
              x-min: 0,
              x-max: 1,
              y-min: -0.2,
              y-max: 2,
              x-label: $t$,
              {
                plot.add(
                  domain: (0, 1),
                  x => (2 * (1 - calc.pow(calc.e, -2 * (x - 0.2))) * heaviside(x - 0.2)),
                  label: $y(t)$,
                )
                plot.add(
                  domain: (0, 1),
                  x => (2 - 3 * calc.pow(calc.e, -2 * x) + calc.pow(calc.e, -10 * x)),
                  label: $y_(a)(t)$,
                )
              },
            )
          }),
        )<plots>
      ]
      #align(center)[
        #figure(
          canvas({
            import draw: *
            plot.plot(
              size: (10, 10),
              x-min: 0,
              x-max: 1,
              y-min: -0.2,
              y-max: 0.2,
              x-label: $t$,
              {
                plot.add(
                  domain: (0, 1),
                  x => (
                    (2 - 3 * calc.pow(calc.e, -2 * x) + calc.pow(calc.e, -10 * x))
                      - (2 * (1 - calc.pow(calc.e, -2 * (x - 0.2))) * heaviside(x - 0.2))
                  ),
                  label: "Difference",
                )
              },
            )
          }),
        )<difference>
      ]
      From @plots we see that $y_(a)(t)$ starts with a negative gradient.
      This is due to the zero introduced by the first Padé approximation process.
      We also note that $y_(a)(t)$ rises above the x-axis before $y(t)$.
      The difference between the two plots however is clearer in @difference.
      The approximation for the first $0.5 "s"$ fails but beyond that it is good.
    ],
  )
]

#numed-question(
  lead: [
    A position servo is assembled from the following components:
    - Error detector (a pair of potentiometers, one on the command shaft (angle $theta_(r)$) and one on the load shaft (angle $theta$) with sensitivity $K_p = 5 " V rad"^(-1)$. Its output is subtracted from the command.
    - Tachogenerator on the load shaft, of constant $K_t = 0.6 " V s rad"^(-1)$. Its output is subtracted from the error-detector voltage at the amplifier input.
    - Current-drive amplifier and motor which together apply a torque $T_(m) = K e_(a)$ to the load $K = 2 " N m V"^(-1)$, where $e_(a)$ the amplifier input voltage. Because the motor is current-driven, its back e.m.f. has no effect on $T_m$.
    - Load of inertia $J = 0.2 " kg m"^2$ with viscous friction $B = 0.4 " N m s rad"^(-1)$. An external disturbance torque $T_(d)(t)$ also acts on the load, opposing $T_m$.
  ],
)[
  #sub-question(
    [
      Draw the block diagram of the servo, with inputs $Theta_r(s)$ and $T_d(s)$ and output $Theta(s)$.
      Label every block with its transfer function and every signal with its physical quantity.
    ],
    answer: answer-box()[
      #align(center)[
        #canvas(length: 1cm, {
          import draw: *

          // Styling
          let block-style = (fill: white, stroke: 0.8pt + black)
          let sum-radius = 0.32
          let arrow-style = (mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
          let line-style = (stroke: 0.8pt + black)

          // Helper for Summing Junction
          let sum-node(pos, name, signs: ("+", "-"), invert: false) = {
            let x = 1
            if invert { x = -1 } else { x = 1 }
            circle(pos, radius: sum-radius, name: name, ..block-style)
            // Crosshairs
            line((rel: (-45deg, sum-radius), to: pos), (rel: (135deg, sum-radius), to: pos), stroke: 0.5pt)
            line((rel: (45deg, sum-radius), to: pos), (rel: (-135deg, sum-radius), to: pos), stroke: 0.5pt)
            // Signs
            content((rel: (-0.52, x * 0.22), to: pos), text(size: 8pt)[$#signs.at(0)$])
            content((rel: (x * 0.22, x * -0.52), to: pos), text(size: 8pt)[$#signs.at(1)$])
          }

          // Helper for Rectangular Block
          let block(pos, w, h, label, name) = {
            rect(
              (pos.at(0) - w / 2, pos.at(1) - h / 2),
              (pos.at(0) + w / 2, pos.at(1) + h / 2),
              name: name,
              ..block-style,
            )
            content(pos, align(center, label))
          }

          // Coordinates
          let x-in = 0
          let x-sum1 = 1.5
          let x-kp = 3.5
          let x-sum2 = 5.5
          let x-k = 7.5
          let x-sum3 = 9.5
          let x-plant = 11.5
          let x-tap1 = 13.5
          let x-tap2 = 14.0
          let x-out = 14.6

          let y-main = 0
          let y-fb1 = -2.0
          let y-fb2 = -3.4
          let y-dist = 1.6

          // --- Forward Path ---
          // Input theta_r(s)
          content((x-in, y-main + 0.3), $theta_r (s)$)
          line((x-in, y-main), (x-sum1 - sum-radius, y-main), ..arrow-style)

          // Sum 1 (Position Error)
          sum-node((x-sum1, y-main), "sum1")
          line("sum1.east", (x-kp - 0.75, y-main), ..arrow-style)
          content((2.35, y-main + 0.3), $e_theta (s)$)

          // Block Kp (Error Detector)
          block((x-kp, y-main), 1.5, 1.0, [$K_p$], "kp")
          line("kp.east", (x-sum2 - sum-radius, y-main), ..arrow-style)

          // Sum 2 (Amplifier Input / Tacho Feedback)
          sum-node((x-sum2, y-main), "sum2")
          line("sum2.east", (x-k - 0.75, y-main), ..arrow-style)
          content((6.25, y-main + 0.3), $e_a (s)$)

          // Block K (Amplifier & Motor)
          block((x-k, y-main), 1.5, 1.0, [$K$], "k")
          line("k.east", (x-sum3 - sum-radius, y-main), ..arrow-style)
          content((8.8, y-main - 0.5), $T_m (s)$)

          // Sum 3 (Disturbance Torque)
          sum-node((x-sum3, y-main), "sum3", invert: true)

          // Disturbance Input Td(s)
          content((x-sum3, y-dist + 0.3), $T_d (s)$)
          line((x-sum3, y-dist), (x-sum3, y-main + sum-radius), ..arrow-style)
          line("sum3.east", (x-plant - 1.2, y-main), ..arrow-style)

          // Block Plant (Load Inertia & Viscous Friction)
          block((x-plant, y-main), 2.4, 1.2, [$frac(1, J s^2 + B s)$], "plant")

          // Output theta(s)
          line("plant.east", (x-out, y-main), ..arrow-style)
          content((x-out - 0.2, y-main + 0.3), $theta(s)$)

          // --- Inner Feedback Path (Tachogenerator) ---
          circle((x-tap1, y-main), radius: 0.06, fill: black)
          block((x-k, y-fb1), 1.5, 1.0, [$K_t s$], "kt")
          line((x-tap1, y-main), (x-tap1, y-fb1), "kt.east", ..arrow-style)
          line("kt.west", (x-sum2, y-fb1), (x-sum2, y-main - sum-radius), ..arrow-style)

          // --- Outer Feedback Path (Position Potentiometer) ---
          circle((x-tap2, y-main), radius: 0.06, fill: black)
          line(
            (x-tap2, y-main),
            (x-tap2, y-fb2),
            (x-sum1, y-fb2),
            (x-sum1, y-main - sum-radius),
            ..arrow-style,
          )

          // --- Component Values Annotation Box ---
          content(
            (x-in, y-fb2 + 4.5),
            anchor: "south-west",
            box(stroke: 0.5pt + gray, inset: 6pt, radius: 2pt, fill: luma(250))[
              #set text(size: 8.5pt)
              *Parameters:* \
              $K_p = 5 "V rad"^(-1)$ \
              $K_t = 0.6 "V s rad"^(-1)$ \
              $K = 2 "N m V"^(-1)$ \
              $J = 0.2 "kg m"^2$ \
              $B = 0.4 "N m s rad"^(-1)$
            ],
          )
        })
      ]
    ],
  )

  #sub-question(
    [
      With $T_(d) = 0$, find $frac(Theta(s), Theta_r(s))$ by block diagram reduction.
      Show intermediate steps.
    ],
    answer: answer-box()[
      With $T_d = 0$ the inner loop reduces to:
      $
        frac(frac(K, J s^2 + B s), 1 + K_(t)s frac(K, J s^2 + B s)) \
        frac(K, J s^2 + (B + K K_(t))s)
      $

      Including the outer loop:
      $
        frac(frac(K_(p) K, J s^2 + (B + K K_(t))s), 1 + frac(K_(p) K, J s^2 + (B + K K_(t))s))\
        frac(K_(p) K, J s^2 + (B + K K_(t))s + K_(p) K)
      $

      This yields:
      $
        frac(Theta(s), Theta_(r)(s)) = frac(K_(p) K, J s^2 + (B + K K_(t))s + K_(p) K)
      $

    ],
  )

  #sub-question(
    [
      With $theta_(r) = 0$, find $frac(Theta(s), T_(d)(s))$ draw the signal-flow graph and use Mason's gain formula to find $frac(Theta(s), T_d(s))$.
      Hence find the steady-state angular deflection caused by a constant disturbance torque of $0.5 " N m"$
    ],
    ref: <3-c>,
    answer: answer-box()[

      #align(center)[
        #canvas({
          import draw: *

          // Styling defaults
          set-style(
            line: (stroke: 0.9pt + black),
            mark: (fill: black),
          )

          let node-r = 0.08
          let navy = rgb("#243b63")

          // Main line node coordinates
          let r = (0.0, 0.0) // theta_r(s)
          let x1 = (2.4, 0.0) // e_theta(s)
          let x2 = (4.8, 0.0) // e_a(s)
          let x3 = (7.2, 0.0) // T_net(s)
          let x4 = (10.2, 0.0) // theta(s) before output branch
          let c = (12.4, 0.0) // theta(s) output
          let td = (4.8, 2.2) // T_d(s) disturbance input

          // Main Line Direct Connections
          line(r, x1, mark: (end: "stealth"))
          content((1.2, 0.32), $1$)

          line(x1, x2, mark: (end: "stealth"))
          content((3.6, 0.32), $K_p$)

          line(x2, x3, mark: (end: "stealth"))
          content((6.0, 0.32), $K$)

          line(x3, x4, mark: (end: "stealth"))
          content((8.7, 0.45), $frac(1, J s^2 + B s)$)


          // Disturbance Input Path -1 (top arc from T_d to T_net)
          bezier(
            td,
            x3,
            (5.6, 2.2),
            (6.8, 1.4),
            mark: (end: "stealth"),
            stroke: 0.9pt + rgb("#8c3a1e"),
          )
          content((6.4, 1.95), text(fill: rgb("#8c3a1e"))[$-1$])
          content((4.35, 2.2), text(fill: navy)[$T_d (s)$])

          // Inner Velocity Feedback -K_t s (bottom arc from x4 to e_a)
          bezier(
            x4,
            x2,
            (9.2, -1.6),
            (5.8, -1.6),
            mark: (end: "stealth"),
            stroke: 0.9pt + rgb("#1e4a38"),
          )
          content((7.5, -1.45), text(fill: rgb("#1e4a38"))[$-K_t s$])

          // Outer Position Feedback -1 (bottom arc from x4 to e_theta)
          bezier(
            x4,
            x1,
            (9.0, -3.1),
            (3.8, -3.1),
            mark: (end: "stealth"),
            stroke: 0.9pt + rgb("#1e7f38"),
          )
          content((6.4, -2.55), text(fill: rgb("#1e7f38"))[$-1$])

          // Node Points
          for pt in (r, x1, x2, x3, x4, td) {
            circle(pt, radius: node-r, fill: navy, stroke: none)
          }

          // Node Name Labels Below
          content((0.0, -3.1), text(fill: navy)[$theta_r (s)$])
          content((2.4, -3.1), text(fill: navy)[$e_theta (s)$])
          content((4.8, -3.1), text(fill: navy)[$e_a (s)$])
          content((7.2, -3.1), text(fill: navy)[$T_("net") (s)$])
          content((10.2, -3.1), text(fill: navy)[$theta (s)$])
        })
      ]
      Loop 1:
      $
        frac(-K_(t) K s, J s^2 + B s)
      $

      Loop 2:
      $
        frac(-K_(p) K, J s^2 + B s)
      $

      There are no non-touching loops present hence:
      $
        Delta & = 1 - (frac(-K_(t) K s, J s^2 + B s) - frac(K_(p) K, J s^2 + B s)) \
              & = 1 + frac(K_(t) K s, J s^2 + B s) + frac(K_(p) K, J s^2 + B s)
      $

      The feed forward path is:
      $
        P = frac(-1, J s^2 + B s)
      $

      Both loops touch this path.
      The transfer function is hence:
      $
        frac(Theta(s), T_(d)(s)) & = frac(frac(-1, J s^2 + B s), 1 + frac(K_(t) K s, J s^2 + B s) + frac(K_(p) K, J s^2 + B s)) \
                                 & = frac(-1, J s^2 + (B + K_(t)K)s + K_(p)K)
      $

      Finding the angle deflection caused by disturbance torque:
      $
        Theta(s) & = 0.5/s times frac(-1, 0.2 s^2 + (0.4 + 0.6 times 2)s + 5 times 2) \
                 & = 0.5/s times frac(-5, s^2 + 8s + 50) \
      $

      Final value theorem:
      $
        theta_"ss" & = lim_(s -> 0) s times 0.5/s times frac(-5, s^2 + 8s + 50) \
                   & = frac(0.5 times -5, 50) \
                   & = -0.05 " rad"
      $
    ],
  )

  #sub-question(
    [
      With the tachogenerator disconnected, recalculate $zeta$ and the steady-state deflection of $#subq-ref(<3-c>)$.
      Comment on what the tachogenerator does.
    ],
    answer: answer-box()[
      With the tachogenerator disconnected, its feedback path(or is branch) is removed:
      $
        Theta(s) & = 0.5/s times frac(-1, 0.2 s^2 + (0.4 + 0 times 2)s + 5 times 2) \
                 & = 0.5/s times frac(-5, s^2 + 2s + 50) \
      $

      The original damping ratio is:
      $
        zeta & = frac(8, 2 times sqrt(50)) \
             & = #calc.round(8 / (2 * calc.sqrt(50)), digits: 3)
      $

      With the tachogenerator removed:
      $
        zeta_("new") & = frac(2, 2 times sqrt(50)) \
                     & = #calc.round(2 / (2 * calc.sqrt(50)), digits: 3)
      $

      The new steady state value however does not change since it is not dependent on the tachogenerator.
      The tachogenerator purely increased the damping ratio reducing overshoot and decreasing the settling time not the value it settles at.

    ],
  )
]

#{
  let tp = 0.4
  let os = 20
  let z = -(calc.ln(20 / 100)) / (calc.sqrt(calc.pow(calc.pi, 2) + calc.pow(calc.ln(20 / 100), 2)))
  let wn = calc.pi / (tp * calc.sqrt(1 - z * z))
  let wd = wn * calc.sqrt(1 - z * z)
  let wng = calc.sqrt(calc.pow(wn, 2) - 3 / 4 * calc.pow(wn, 2))
  let zg = z * wn / wng
  let wnnew = calc.sqrt(wng * wng + 3 / 2 * calc.pow(wn, 2))
  let znew = z * wn / wnnew
  let wdnew = wnnew * calc.sqrt(1 - znew * znew)
  let osnew = 100 * calc.pow(calc.e, (-znew * calc.pi / calc.sqrt(1 - znew * znew)))
  numed-question(
    lead: [
      A unity-feedback loop contains a plant whose transfer function $G(s)$ is unknown.
      A step of $2 "V"$ is applied to the reference input at $t = 0$ and the output is recorded; the record is reproduced in @q4-figure.
      #align(center)[
        #figure(
          canvas({
            import draw: *
            plot.plot(
              size: (12, 8),
              x-min: 0,
              x-max: 2,
              y-min: 0,
              y-max: 2.2,
              tick-step: 0.2,
              x-minor-tick-step: 0.05,
              y-minor-tick-step: 0.05,
              x-grid: "both",
              y-grid: "both",
              x-label: $t$,
              y-label: $"V"$,
              {
                plot.add-hline(2, style: (stroke: (paint: black, dash: "dashed")), label: [Input])
                plot.add(
                  domain: (0, 2),
                  x => (
                    1.5
                      * (
                        1
                          - (
                            calc.pow(calc.e, -z * wn * x)
                              * (z * calc.sin(wd * x) / (calc.sqrt(1 - z * z)) + calc.cos(wd * x))
                          )
                      )
                  ),
                  samples: 100,
                  label: "Response",
                )
              },
            )
          }),
        )<q4-figure>
      ]
    ],
  )[
    #sub-question(
      [Fit a second-order model to the record, stating the readings you take from it, and write the closed-loop transfer function $T(s) = frac(Y(s), R(s))$ in standard form.],
      answer: answer-box()[
        From the graph we see that $t_(p) = tp "s"$.
        We also note that the percentage overshoot is $os \%$.

        We can calculate $zeta$ from the overshoot as:

        $
          zeta & = -(ln(os/100))/(sqrt(pi^2 + ln^2(os/100))) \
               & = #calc.round(z, digits: 3)
        $

        We know:
        $
          t_(p) & = frac(pi, omega_n sqrt(1 - zeta^2)) \
        $
        Therefore
        $
          omega_(n) & = frac(pi, t_(p) sqrt(1 - zeta^2)) \
                    & = #calc.round(wn, digits: 3)
        $
        The gain is then found as:
        $
          K & = y_("ss")/"Input" \
            & = 1.5/2 \
            & = #dec-to-frac(1.5 / 2) \
        $

        The second-order transfer function is hence:
        $
          T(s) & = K dot frac(omega_n^2, s^2 + 2 zeta omega_n + omega_n^2) \
          & = frac(#str(calc.round(3 / 4 * calc.pow(wn, 2), digits: 3)), s^2 + #str(calc.round(2 * z * wn, digits: 3))s + #str(calc.round(calc.pow(wn, 2), digits: 3)))
        $
      ],
    )

    #sub-question(
      [Deduce the plant transfer function $G(s)$, find its poles, and check your result against the steady state of the record.],
      answer: answer-box()[
        So $T(s)$ is the unity feedback loop transfer function given by:
        $
          T(s) & = frac(G(s), 1 + G(s))
        $

        Rearranging:
        $
          G(s) & = T(s) + T(s)G(s) \
          T(s) & = G(s) - T(s)G(s) \
          G(s) & = frac(T(s), 1 - T(s)) \
          & = frac(frac(#str(calc.round(3 / 4 * calc.pow(wn, 2), digits: 3)), s^2 + #str(calc.round(2 * z * wn, digits: 3))s + #str(calc.round(calc.pow(wn, 2), digits: 3))), 1 - frac(#str(calc.round(3 / 4 * calc.pow(wn, 2), digits: 3)), s^2 + #str(calc.round(2 * z * wn, digits: 3))s + #str(calc.round(calc.pow(wn, 2), digits: 3))))\
          & = frac(#str(calc.round(3 / 4 * calc.pow(wn, 2), digits: 3)), s^2 + #calc.round(2 * z * wn, digits: 3)s + #calc.round(wng * wng, digits: 3))
        $

        From the standard form of second-order transfer functions the poles can be expressed as:
        $
          s_(1,2) & = - zeta_(g) omega_(n,g) plus.minus omega_(n,g) sqrt(zeta_(g)^2 - 1) \
                  & = #calc.round(-zg * wng, digits: 3) plus.minus j #calc.round(wng * calc.sqrt(1 - zg * zg), digits: 3) \
        $
      ],
    )

    #sub-question(
      [
        The amplifier gain inside the plant is now doubled, so that the plant becomes $2G(s)$).
        Using your model, predict the new closed-loop d.c. gain, percentage overshoot and 2% settling time, and explain each change, or lack of one.
      ],
      answer: answer-box()[
        With the doubled gain:
        $
          2G(s) = frac(#str(calc.round(3 / 2 * calc.pow(wn, 2), digits: 3)), s^2 + #calc.round(2 * z * wn, digits: 3)s + #calc.round(wng * wng, digits: 3))
        $

        The feedback loop gain:
        $
          T(s) &= frac(frac(#str(calc.round(3 / 2 * calc.pow(wn, 2), digits: 3)), s^2 + #calc.round(2 * z * wn, digits: 3)s + #calc.round(wng * wng, digits: 3)), 1 + frac(#str(calc.round(3 / 2 * calc.pow(wn, 2), digits: 3)), s^2 + #calc.round(2 * z * wn, digits: 3)s + #calc.round(wng * wng, digits: 3)))\
          & = frac(#str(calc.round(3 / 2 * calc.pow(wn, 2), digits: 3)), s^2 + #calc.round(2 * z * wn, digits: 3)s + #calc.round(wnnew * wnnew, digits: 3))
        $

        The new closed-loop d.c gain is:
        $
          K & = #calc.round(3 / 2 * calc.pow(wn, 2), digits: 3)/#calc.round(wnnew * wnnew, digits: 3) \
            & =#dec-to-frac(3 / 2 * calc.pow(wn, 2) / (wnnew * wnnew))
        $

        The new percentage overshoot is:
        $
          \% "OS" & = 100 e^(frac(-zeta pi, sqrt(1 - zeta^2))) \
                  & = #calc.round(osnew, digits: 3)\% \
        $

        The $2\%$ settling time is then:
        $
          t_(s)(2\%) & approx 4/(zeta_("new") omega_(n, "new")) \
                     & approx #calc.round(4 / (znew * wnnew), digits: 3) "s"
        $

        The new gain causes the damping factor to reduce significantly from #calc.round(z, digits: 3) to #calc.round(znew, digits: 3) which causes the overshoot to increase dramatically from #os\%.
        The settling time remains the same, this can be attributed to $zeta omega_n = zeta_("new") omega_(n, "new")$.
        In reality however, the settling time for the doubled-gain system will be much longer due to the lower damping ratio.
        This shows the pitfall of the formula we use in approximating settling time for second-order transfer functions.
        The only improvement seen from increasing the gain is a higher settling voltage from the response.

        #align(center)[
          #figure(
            canvas({
              import draw: *
              plot.plot(
                size: (10, 8),
                x-min: 0,
                x-max: 2,
                y-min: -0.5,
                y-max: 2.5,
                tick-step: 0.2,
                x-minor-tick-step: 0.05,
                y-minor-tick-step: 0.05,
                x-grid: "both",
                y-grid: "both",
                x-label: $t$,
                y-label: $"V"$,
                {
                  plot.add-hline(2, style: (stroke: (paint: black, dash: "dashed")), label: [Input])
                  plot.add(
                    domain: (0, 2),
                    x => (
                      12
                        / 7
                        * (
                          1
                            - (
                              calc.pow(calc.e, -znew * wnnew * x)
                                * (znew * calc.sin(wdnew * x) / (calc.sqrt(1 - znew * znew)) + calc.cos(wdnew * x))
                            )
                        )
                    ),
                    samples: 100,
                    label: "Response",
                  )
                },
              )
            }),
          )
        ]
      ],
    )
  ]
}
