// =====================================================================
// assignment-template.typ
// ---------------------------------------------------------------------
// Usage:
//
//   #import "assignment-template.typ": *
//
//   #show: assignment.with(
//     reg-no: "12345678",
//     assignment-name: "FEE3411 Tutorial 1",
//   )
//
//   #numed-question()[
//     #sub-question(
//       [A leaf sub-question.],
//       answer: answer-box()[Optional answer.],
//     )
//
//     #sub-question-group(
//       sq => [
//         #sq([First child.], answer: answer-box()[...])
//         #sq([Second child.])
//       ],
//       lead: [Optional lead text; the group is numbered and its children
//              nest one level deeper.],
//     )
//   ]
// =====================================================================


// ---------------------------------------------------------------------
// assignment(...) — wrap the whole document with `#show:`
// ---------------------------------------------------------------------
// reg-no / assignment-name are captured directly by the header closure,
// so no state is needed.
#let assignment(
  reg-no: "",
  name: "",
  assignment-name: "",
  body,
) = {
  set document(title: assignment-name)

  set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 2.5cm),
    header: {
      set text(size: 9pt)
      grid(
        columns: (1fr, 1fr),
        align: (left, right),
        assignment-name, reg-no,
      )
      v(-0.7em)
      line(length: 100%, stroke: 0.4pt)
    },
    header-ascent: 1.2em,
    footer: context {
      set text(size: 9pt)
      align(center, counter(page).display("1"))
    },
  )

  // --- Title page (no header/footer/number) ---------------------------
  page(header: none, footer: none, numbering: none)[
    #set align(center)
    #v(4.5cm)
    #text(size: 22pt, weight: "bold")[#assignment-name]
    #v(2cm)
    #if reg-no != "" {
      text(size: 11pt)[Registration Number]
      v(0.2cm)
      text(size: 16pt, weight: "bold")[#reg-no]
    }
    #if name != "" {
      text(size: 11pt)[by]
      v(0.2cm)
      text(size: 16pt, weight: "bold")[#name]
    }
    #v(0.3cm)
    #text(size: 11pt)[Date]
    #v(0.2cm)
    #text(size: 12pt)[
      #datetime.today().display("[day] [month repr:long] [year]")
    ]
  ]

  // First body page is 1.
  counter(page).update(1)

  body
}


// ---------------------------------------------------------------------
// Counters
// ---------------------------------------------------------------------
// question-counter : top-level question number.
// subq-counter     : multi-level counter. Level 1 = first sub-question
//                    level, level 2 = nested, and so on. Stepping a level
//                    automatically resets all deeper levels.
#let question-counter = counter("question")
#let subq-counter = counter("subq")


// ---------------------------------------------------------------------
// numed-question(body, lead: none)
// ---------------------------------------------------------------------
#let numed-question(body, lead: none) = {
  question-counter.step()
  subq-counter.update(0)
  context {
    let n = question-counter.get().first() // plain integer
    block(width: 100%, above: 1.2em, below: 0.6em)[
      == Question #(n).                     // heading body = plain text
      #v(0.2em)
      #line(length: 100%, stroke: 0.4pt)
      #v(0.4em)
      #if lead != none {
        text(weight: "bold")[#lead]
        v(0.5em)
      }
      #body
    ]
  }
}


// ---------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------
// Number string at the *current* location, e.g. "2.1.3".
// Must be called inside context
#let subq-number() = {
  let q = question-counter.get().first()
  let s = subq-counter.get()
  (q, ..s).map(str).join(".")
}


// ---------------------------------------------------------------------
// Sub-questions
// ---------------------------------------------------------------------
// Shared renderer: number on the left, bold question + optional answer.
#let sq-block(question, answer) = block(
  width: 100%,
  above: 0.8em,
  below: 0.6em,
  breakable: true,
)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 0.8em,
    align: (right + top, left + top),
    text(weight: "bold")[#context subq-number()],
    {
      text(weight: "bold")[#question]
      if answer != none {
        v(0.5em)
        answer
      }
    },
  )
]

// sub-question(question, answer: none, ref: none)
//   Leaf sub-question. `ref` is an optional label for subq-ref().
#let make-sq(depth) = (question, answer: none, ref: none) => {
  subq-counter.step(level: depth + 1)
  let body = sq-block(question, answer)
  if ref != none [#body#ref] else { body }
}

// sub-question-group(sq => [ ... ], lead: none, ref: none)
//   Container for nested sub-questions.
//   lead : optional content. If given, a numbered bold heading is shown
//          (e.g. "2.1") and the children are numbered 2.1.1, 2.1.2, ...
//          If omitted, the group is invisible but still consumes a
//          numbering slot.
//   ref  : optional label for subq-ref(), pointing at the group itself.
//   Only one level of group nesting is supported by the public API
//   (sub-question-group = make-group(0); children are leaves from
//   make-sq(1)). For deeper nesting, expose make-group(1) here.
#let make-group(depth) = (body, lead: none, ref: none) => {
  subq-counter.step(level: depth + 1)

  if lead != none {
    let header = sq-block(lead, none)
    if ref != none [#header#ref] else { header }
  } else if ref != none {
    [#metadata(none)#ref]
  }

  let inner = make-sq(depth + 1)
  if type(body) == function { body(inner) } else { body }
}

#let sub-question = make-sq(0)
#let sub-question-group = make-group(0)


// ---------------------------------------------------------------------
// subq-ref(label, link-text: none)
// ---------------------------------------------------------------------
// Looks up the counter value at the labelled block's location, so no
// extra state is required.
//
//   #subq-ref(<laplace-u>)           // "1.2", clickable
//   #subq-ref(<laplace-u>, link-text: [part 1.2])
#let subq-ref(label, link-text: none) = context {
  let hits = query(label)
  if hits.len() == 0 {
    text(fill: red)[??]
  } else {
    let loc = hits.first().location()
    let q = question-counter.at(loc).first()
    let s = subq-counter.at(loc)
    let n = (q, ..s).map(str).join(".")
    link(label, if link-text == none { n } else { link-text })
  }
}


// ---------------------------------------------------------------------
// Answer box
// ---------------------------------------------------------------------
#let answer-box(..args) = {
  let body = if args.pos().len() > 0 { args.pos().first() } else { v(2cm) }
  block(
    width: 100%,
    stroke: 0.5pt,
    inset: 8pt,
    radius: 2pt,
    above: 0.6em,
    below: 0.6em,
    fill: gray.transparentize(90%),
  )[#body]
}

#let simp-frac(n, d) = {
  assert(d != 0, message: "denominator must be non-zero")
  let n = int(n)
  let d = int(d)
  if n == 0 { return $0$ }
  if d < 0 {
    n = -n
    d = -d
  }
  let g = calc.gcd(calc.abs(n), d)
  let sn = calc.quo(n, g) // integer division, not n / g
  let sd = calc.quo(d, g)
  if sd == 1 { return $#sn$ }
  $frac(#str(sn), #str(sd))$
}

#let dec-to-frac(
  val,
  max-denom: 100000,
  tol: 1e-6, // |x - n/d| tolerance
  snap-tol: 1e-12, // "is this float actually an integer?" tolerance
) = {
  // Exact integers
  if type(val) == int { return $#val$ }
  if val == calc.round(val) { return $#int(val)$ }

  let neg = val < 0
  let x = calc.abs(val)

  // Convergent state: h[-1]=1, h[-2]=0, k[-1]=0, k[-2]=1
  let h0 = 0
  let h1 = 1
  let k0 = 1
  let k1 = 0
  let y = x
  let best-n = 0
  let best-d = 1

  while true {
    // Snap to an integer if float error put us just below it
    let yr = calc.round(y)
    let a = if calc.abs(y - yr) < snap-tol { yr } else { calc.floor(y) }
    let r = y - a

    let h2 = a * h1 + h0
    let k2 = a * k1 + k0
    if k2 > max-denom { break }

    h0 = h1
    h1 = h2
    k0 = k1
    k1 = k2
    best-n = h1
    best-d = k1

    if calc.abs(x - best-n / best-d) < tol { break }
    if calc.abs(r) < snap-tol { break }
    y = 1 / r
  }

  let n = int(best-n)
  let d = int(best-d)
  let sgn = if neg { -1 } else { 1 }
  if d == 1 { $#(sgn * n)$ } else if neg { $-frac(#str(n), #str(d))$ } else { $frac(#str(n), #str(d))$ }
}

#let norm-cdf(z) = {
  // If z is negative, use symmetry: P(Z <= z) = 1 - P(Z <= -z)
  if z < 0 {
    return 1.0 - norm-cdf(-z)
  }

  // Abramowitz & Stegun (26.2.17) Constants
  let p = 0.2316419
  let b1 = 0.319381530
  let b2 = -0.356563782
  let b3 = 1.781477937
  let b4 = -1.821255978
  let b5 = 1.330274429

  let t = 1.0 / (1.0 + p * z)

  // Standard Normal PDF: phi(z) = (1 / sqrt(2 * pi)) * exp(-z^2 / 2)
  let pi = calc.pi
  let phi = (1.0 / calc.sqrt(2.0 * pi)) * calc.exp(-calc.pow(z, 2) / 2.0)

  // Calculate polynomial tail approximation
  let poly = b1 * t + b2 * calc.pow(t, 2) + b3 * calc.pow(t, 3) + b4 * calc.pow(t, 4) + b5 * calc.pow(t, 5)

  return 1.0 - phi * poly
}

#let hsv_gradient(
  values, // array of numbers (int or float)
  hue-max: 300deg, // maximum hue angle for the gradient
  saturation: 100%, // HSV saturation (0–100%)
  value: 100%, // HSV value/brightness (0–100%)
) = {
  // 1. Find the minimum and maximum of the input array
  let min-val = calc.min(..values)
  let max-val = calc.max(..values)
  let range = max-val - min-val

  // 2. Map each value to a hue and build the (value, rgb) tuple
  values.map(v => {
    // Avoid division by zero when all values are equal
    let ratio = if range == 0 { 0.5 } else { (v - min-val) / range }
    let hue = ratio * hue-max

    // Create an HSV color, convert it to a hex string, then to an RGB color
    let hsv-color = color.hsv(hue, saturation, value)
    let rgb-color = rgb(hsv-color.to-hex())

    (v, rgb-color)
  })
}

#let simp-surd(c) = {
  assert(c > 0, message: "surd: radicand must be positive")
  if c == 1 { return $1$ }

  // Pull out the largest square factor: c = k² · m, m squarefree.
  let k = 1
  let m = c
  let p = 2
  while p * p <= m {
    while calc.rem(m, p * p) == 0 {
      m = calc.quo(m, p * p)
      k = k * p
    }
    p = p + 1
  }

  if m == 1 { return $#str(k)$ } // c was a perfect square
  if k == 1 { return $sqrt(#str(m))$ } // c squarefree already
  $#str(k) sqrt(#str(m))$
}

#let nCr(x, k) = { calc.fact(x) / (calc.fact(k) * calc.fact(x - k)) }

#let hypergeometric(N, K, n, k) = {
  (nCr(K, k) * nCr(N - K, n - k) / nCr(N, n))
}

#let heaviside(t) = {
  if t < 0 { 0 } else { 1 }
}

// D > 0 integer. Returns (k, m) with D = k²·m, m squarefree.
#let surd-canonical(D) = {
  let k = 1
  let m = D
  let p = 2
  while p * p <= m {
    while calc.rem(m, p * p) == 0 {
      m = calc.quo(m, p * p)
      k = k * p
    }
    p = p + 1
  }
  (k: k, m: m)
}

// Roots as content. Each is either $frac(...)$ or $frac(±k√m, d)$.
#let solve-quadratic(a, b, c) = {
  assert(a != 0, message: "not a quadratic (a = 0)")
  let D = b * b - 4 * a * c
  if D < 0 { return ("Complex Numbers not implemented", none) }

  if D == 0 {
    let r = simp-frac(-b, 2 * a)
    return (r, r)
  }

  // Perfect square → rational roots
  let sq = calc.sqrt(float(D))
  if calc.abs(sq - calc.round(sq)) < 1e-9 {
    let k = int(calc.round(sq))
    return (simp-frac(-b - k, 2 * a), simp-frac(-b + k, 2 * a))
  }

  // D = k²·m, m > 1 squarefree → roots (-b ± k√m) / (2a)
  let (k, m) = surd-canonical(D)
  let denom = 2 * a
  let g = calc.gcd(calc.gcd(calc.abs(b), k), calc.abs(denom))
  let bb = calc.quo(b, g)
  let kk = calc.quo(k, g)
  let dd = calc.quo(denom, g)
  if dd < 0 {
    bb = -bb
    dd = -dd
  }

  let render-root(plus) = {
    let root-s = if kk == 1 {
      "sqrt(" + str(m) + ")"
    } else {
      str(kk) + " sqrt(" + str(m) + ")"
    }
    let num-s = if bb == 0 {
      if plus { root-s } else { "-" + root-s }
    } else {
      let op = if plus { "+" } else { "-" }
      str(-bb) + " " + op + " " + root-s
    }
    if dd == 1 {
      eval("$" + num-s + "$", mode: "markup")
    } else {
      eval("$frac(" + num-s + ", " + str(dd) + ")$", mode: "markup")
    }
  }

  (render-root(false), render-root(true))
}

#let fmt(c, d: 4) = {
  str(calc.round(c, digits: d))
}
