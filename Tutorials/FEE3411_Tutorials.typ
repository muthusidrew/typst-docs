#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "assignment-template.typ": *

#let heaviside(t) = if t < 0.0 { 0.0 } else { 1.0 }
#let graph_width = 8
#let x_abs = graph_width / 2
#let graph_height = 5

#numed-question()[
  #sub-question-group(sq => [
    #sq(
      [Sketch, on the same time axis, the unit impulse $delta (t)$,
        unit step $u(t)$, unit ramp $r(t) = t u(t)$ and unit parabola
        $p(t) = 1/2 t^2 u(t)$.],
      answer: answer-box()[
        #align(center, cetz.canvas({
          import cetz.draw: *
          plot.plot(
            size: (graph_width, graph_height),
            x-min: -x_abs,
            x-max: x_abs,
            y-min: -0.5,
            y-max: graph_height,
            x-label: $t$,
            x-tick-step: 1,
            y-tick-step: 1,
            axis-style: "school-book",
            {
              plot.add(
                domain: (-x_abs, x_abs),
                samples: 1000,
                t => heaviside(t),
                style: (stroke: blue + 1.5pt),
                label: $u(t)$,
              )
              plot.annotate(resize: false, {
                line((0, 0), (0, 1), stroke: red + 2pt, mark: (end: ">", fill: blue), label: $delta(t)$)
              })
              plot.add(
                domain: (-x_abs, x_abs),
                samples: 1000,
                t => t * heaviside(t),
                style: (stroke: green + 1.5pt),
                label: $r(t)$,
              )
              plot.add(
                domain: (-x_abs, x_abs),
                samples: 1000,
                t => 1 / 2 * calc.pow(t, 2) * heaviside(t),
                style: (stroke: purple + 1.5pt),
                label: $p(t)$,
              )
            },
          )
        }))
      ],
    )

    #sq(
      [Write down the Laplace transform of each.],
      ref: <laplace-transform>,
      answer: answer-box()[
        Multiplying by $t$ in the time domain is the equivalent of
        differentiating in the complex frequency domain:
        $
          cal(L){t^n f(t)} = (-1)^n frac(dif^n F(s), dif s^n)
        $
        Hence:
        $
          cal(L){delta(t)} & = 1 \
              cal(L){u(t)} & = 1/s \
              cal(L){r(t)} & = 1/s^2 \
              cal(L){p(t)} & = 1/s^3
        $
      ],
    )
  ])

  #sub-question(
    [Show that each signal in the list is the time integral of the one
      before it. Using the integration property only deduce the transforms
      $1/s$, $1/s^2$, $1/s^3$ from $cal(L){delta} = 1$],
    answer: answer-box()[
      The Dirac delta is defined by
      $
        delta(t) = cases(infinity & t = 0, 0 & t eq.not 0),
        quad integral_(-infinity)^(infinity) delta(t) dif t = 1.
      $
      Integrating from $-infinity$ to $t$: for $t < 0$ the integration
      window contains no impulse, giving $0$; for $t gt.eq 0$ it
      encloses the impulse, giving $1$. Hence
      $
        integral_(-infinity)^t delta(tau) dif tau
        = cases(1 & t gt.eq 0, 0 & t < 0) = u(t).
      $
      Repeating for $u$: for $t gt.eq 0$,
      $
        integral_(-infinity)^t u(tau) dif tau
        = integral_0^t 1 dif tau = t,
      $
      and for $t < 0$ the integrand vanishes, so the result is
      $t u(t) = r(t)$. Likewise
      $
        integral_(-infinity)^t r(tau) dif tau
        = integral_0^t tau dif tau
        = 1/2 t^2 = 1/2 t^2 u(t) = p(t).
      $

      Each signal is therefore the running integral of the one before it.
      The Laplace integration property
      $
        cal(L) {integral_0^t f(tau) thin dif tau} = F(s) / s
      $
      then gives, cascading from $F_delta(s) = 1$,
      $
        cal(L){u(t)} & = (1)/s = 1/s, \
        cal(L){r(t)} & = (1/s)/s = 1/s^2, \
        cal(L){p(t)} & = (1/s^2)/s = 1/s^3,
      $
      matching what was stated in #subq-ref(<laplace-transform>).
    ],
  )

  #sub-question(
    [Why does a control engineer test with these signals rather than,
      say, a sine wave or a recorded real input?],
    answer: answer-box()[
      + They generate every other signal. Any input can be written as a
        superposition of impulses, hence knowing the system's response to
        $delta(t)$ determines its response to any input via convolution.
      + They correspond to real operating conditions:
        - A unit step is a sudden change in setpoint.
        - An impulse is a momentary kick.
        - A ramp is a steadily moving reference.
      + They have trivial transforms, hence the response of any LTI system
        to them can be computed in closed form and the resulting
        expressions expose steady-state behaviour directly.
    ],
  )
]
