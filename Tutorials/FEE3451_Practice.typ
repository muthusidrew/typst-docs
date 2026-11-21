#import "assignment-template.typ": *
#import "@preview/cetz:0.5.1": canvas, draw
#import "@preview/zap:0.6.0"

#show: assignment.with(
  assignment-name: "Save Face",
  name: "Philosopher",
)

= CAT
#numed-question()[
  #sub-question(
    [
      In the study of the wave propagation behaviour in waveguides of arbitrary but uniform cross-section, it is usual to split the electric and magnetic field intensities into axial and transverse components.
      Consider a transverse electric wave propagating in the $+z$-direction in a waveguide with its axis oriented along the $z$-axis.
      The waveguide is filled with a nonmagnetic simple and lossless dielectric medium.
      Derive expressions for spatial distributions of the transverse components of the electric and magnetic field intensities in terms of the axial components of the fields.
    ],
    answer: answer-box()[
      This solution may be longer than required since I am taking the time to show all the step by step working for study purposes.

      Start by splitting the $nabla$ operator into its axial components:
      $
        nabla = nabla_t + frac(partial, partial z)
      $

      Assuming a harmonic time dependent wave:
      $
        exp{j (omega t - gamma z)}
      $
      We see that $frac(partial, partial z)$ yields $-gamma$ hence:
      $
        nabla = nabla_t - hat(z) gamma
      $

      From Faraday's Law:
      $
        (nabla_(t) - hat(z) gamma) times (arrow(E)_(t) + hat(z)E_(z)) &= -j omega mu(arrow(H_t) + hat(z)H_z) \
        underbrace(nabla_(t) times arrow(E)_t, "axial") + underbrace(nabla_(t) times hat(z) E_z - hat(z) gamma times arrow(E)_t, "transverse") - underbrace(gamma E_z (hat(z) times hat(z)), 0) &= -j omega mu arrow(H)_t - j omega mu hat(z) H_z
      $

      Hence:
      $
        nabla_t times arrow(E)_t = - j omega mu hat(z) H_z
      $
      and
      $
        nabla_(t) times hat(z) E_z - hat(z) gamma times arrow(E)_t = -j omega mu arrow(H)_t
      $
      which can be simplified as follows
      $
        nabla_(t) times hat(z)E_(z) = E_(z)(nabla_(t) times hat(z)) + (nabla_(t)E_(z)) times hat(z)
      $
      Since $hat(z)$ is a unit vector it is a also a constant vector whose curl is zero, therefore:
      $
         -j omega mu arrow(H)_t & = - hat(z) times nabla_(t)E_(z) - hat(z)gamma times arrow(E)_(t) \
        j omega mu arrow(H)_(t) & = hat(z) times (nabla_(t)E_(z) + gamma arrow(E)_(t))
      $

      From Ampere's Law:
      $
        (nabla_(t) - hat(z) gamma) times (arrow(H)_(t) + hat(z)H_(z)) & = (sigma + j omega epsilon )(arrow(E_t) + hat(z)E_z) \
        underbrace(nabla_(t) times arrow(H)_t, "axial") + underbrace(nabla_(t) times hat(z) H_z - hat(z) gamma times arrow(H)_t, "transverse") - underbrace(gamma H_z (hat(z) times hat(z)), 0) &= (sigma + j omega epsilon)arrow(E)_t + (sigma + j omega epsilon) hat(z) E_z\
        nabla_(t) times arrow(H)_(t) &= (sigma + j omega epsilon) hat(z) E_(z)\
        nabla_(t) times hat(z) H_z - hat(z) gamma times arrow(H)_t &= (sigma + j omega epsilon) arrow(E)_t \
        hat(z) times (nabla_(t)H_(z) + gamma arrow(H)_(t)) &= - (sigma + j omega epsilon) arrow(E)_(t)
      $

      Next we find the expression for $arrow(E)_(t)$ as follows:
      $
        arrow(H)_(t) = frac(1, j omega mu)hat(z) times (nabla_(t)E_(z) + gamma arrow(E)_(t))
      $
      then:
      $
        - (sigma + j omega epsilon) arrow(E)_(t) &= hat(z) times (nabla_(t)H_(z) + gamma (frac(1, j omega mu)hat(z) times (nabla_(t)E_(z) + gamma arrow(E)_(t)))) \
        &= hat(z) times nabla_t H_z + frac(gamma, j omega mu) (hat(z) times (hat(z) times (nabla_(t)E_(z) + gamma arrow(E)_(t))))
      $

      Using BAC-CAB rule yields:
      $
        (hat(z) times underbrace((hat(z) times (nabla_(t)E_(z) + gamma arrow(E)_(t))), 0)) = hat(z) times (hat(z) dot (nabla_(t)E_(z) + gamma arrow(E)_(t))) - (nabla_(t)E_(z) + gamma arrow(E)_(t)) times underbrace((hat(z) dot hat(z)), 1)
      $
      The dot product above yields 0 since $hat(z)$ is orthogonal to the transverse vectors $nabla_(t)$ and $arrow(E)_(t)$ hence:
      $
        - (sigma + j omega epsilon) arrow(E)_(t) & = hat(z) times nabla_(t)H_(z) - frac(gamma, j omega mu) (nabla_(t)E_(z) + gamma arrow(E)_(t)) \
        - j omega mu (sigma + j omega epsilon) arrow(E)_(t) & = j omega mu hat(z) times nabla_(t)H_(z) - gamma nabla_(t)E_(z) + gamma^2 arrow(E)_(t) \
        (gamma^2 - j omega mu (sigma + j omega epsilon)) arrow(E)_(t) & = j omega mu hat(z) times nabla_(t)H_(z) - gamma nabla_(t)E_(z) \
      $
      Let the wavenumber be $k_c^2 = gamma^2 - j omega mu (sigma + j omega epsilon)$ such that:
      $
        arrow(E)_(t) = - frac(gamma, k_(c)^2) nabla_(t)E_(z) + frac(j omega mu, k_(c)^2) hat(z) times nabla_(t)H_z
      $

      Similarly for $arrow(H)_(t)$:
      $
        arrow(E)_(t) = -frac(1, sigma + j omega epsilon) hat(z) times (nabla_(t)H_(z) + gamma arrow(H)_(t))
      $
      then:
      $
        j omega mu arrow(H)_(t) & = hat(z) times (nabla_(t)E_(z) - gamma (frac(1, sigma + j omega epsilon) hat(z) times (nabla_(t)H_(z) + gamma arrow(H)_(t))))\
        &= hat(z) times nabla_(t)E_(z) - frac(gamma, sigma + j omega epsilon) (hat(z) times (hat(z) times (nabla_(t)H_(z) + gamma arrow(H)_(t)))) \
        &= hat(z) times nabla_(t)E_(z) + frac(gamma, sigma + j omega epsilon)(nabla_(t)H_(z) + gamma arrow(H)_(t)) \
        - j omega mu (sigma + j omega epsilon) arrow(H)_(t) &= -(sigma + j omega epsilon) hat(z) times nabla_(t)E_(z) - gamma nabla_(t)H_(z) - gamma^2 arrow(H)_(t)\
        (gamma^2 - j omega mu (sigma + j omega epsilon)) arrow(H)_(t) &= -(sigma + j omega epsilon) hat(z) times nabla_(t)E_(z) - gamma nabla_(t)H_(z) \
        arrow(H)_(t) &= - frac(gamma, k_(c)^2) nabla_(t) H_(z) - frac(sigma + j omega epsilon, k_(c)^2) hat(z) times nabla_(t) E_(z)
      $

      Since we are considering a transverse electric wave $E_(z) = 0$ and the medium is lossless $sigma = 0$:
      $
        arrow(H)_(t) & = - frac(gamma, k_(c)^2) nabla_(t) H_(z) \
        arrow(E)_(t) & = frac(j omega mu, k_(c)^2) hat(z) times nabla_(t)H_z
      $
    ],
  )

  #sub-question(
    [
      Show that the transmission line model of @guide-impedance can be used to represent the propagation characteristics of the transverse electric wave in a waveguide of rectangular cross-section if the characteristic impedance and propagation constant for this wave are written in analogy with transmission line theory in terms of the series impedance per unit length $Z'$ and shunt admittance per unit length $Y'$.
      The medium filling the guide has permittivity $epsilon$ and permeability $mu$.
      #figure(
        zap.circuit({
          import zap: *
          node("n1", (rel: (3, 0), to: (0, 0)))
          resistor("z", (0, 0), "n1", label: (content: ($Z'$)))
          node("n2", (rel: (0, -3), to: "n1"))
          resistor("y", "n1", (rel: (0, -3)), label: (content: ($Y'$)))
          wire("n1", (rel: (2, 0)))
          wire((rel: (-3, 0), to: "n2"), (rel: (5, 0)))
        }),
        caption: [],
      )<guide-impedance>
    ],
    answer: answer-box()[
      Starting from the telegrapher's equations:
      $
        frac(dif V, dif z) & = - Z'I \
        frac(dif I, dif z) & = - Y'V \
      $
      where $V$ and $I$ are the equivalent voltage and current.

      Assuming a wave propagating in the $+z$ direction with a time harmonic dependence $exp{j(omega t - gamma z)}$ and the waveguide has a width $a$ and height $b$.

      Since the dominant TE mode in a rectangular section waveguide is $"TE"_(10)$ and its expression for the axial magnetic field is:
      $
        H_(z) = H_(10) cos(frac(pi, a) x)
      $

      We know that
      $
        arrow(H)_(t) & = - frac(gamma, k_(c)^2) nabla_(t) H_(z) \
        arrow(E)_(t) & = frac(j omega mu, k_(c)^2) hat(z) times nabla_(t)H_z
      $

      Finding the transverse gradient of $H_(z)$:
      $
        nabla_(t)H_(z) & = hat(x) frac(partial H_(z), partial x) + hat(y) frac(partial H_(z), partial y) \
                       & = hat(x) (- H_(10) frac(pi, a) sin(frac(pi, a) x)) + hat(y)(0)
      $

      Thus:
      $
        arrow(H)_(t) & = hat(x) frac(gamma, k_(c)^2) H_(10) frac(pi, a) sin(frac(pi, a) x) \
                     & = H_x \
        arrow(E)_(t) & = frac(j omega mu, k_(c)^2) (hat(z) times hat(x)) (- H_(10) frac(pi, a) sin(frac(pi, a) x)) \
                     & = - hat(y) frac(j omega mu, k_(c)^2) H_(10) frac(pi, a) sin(frac(pi, a) x) \
                     & = E_(y)
      $
      The power flowing down the waveguide is given by Poynting's vector:
      $
        arrow(S) & = (hat(y)E_(y)) times (hat(x)H_(x)) \
                 & = (hat(y) times hat(x))(E_(y)H_(x)) \
                 & = - hat(z) E_(y)H_(x)
      $

      For power to flow down the guide in the $+hat(z)$ direction, $E_(y)H_(x)$ must be negative.

      The equivalent voltage can be defined as:
      $
        V_"eq" & = integral_(0)^(b) E_(y) thin dif y \
               & = E_(y) b
      $
      Since this defines the top plate as having the positive potential, $H_(x)$ must be physically negative to carry power forward.
      Thus from Ampere's circuital law:
      $
        I_"eq" & = integral.cont arrow(H) dot dif arrow(l) \
               & = - H_x a
      $

      From Faraday's Law:
      $
        nabla times arrow(E) & = -j omega mu arrow(H) \
        mat(
          delim: "|",
          hat(x), hat(y), hat(z);
          frac(partial, partial x), frac(partial, partial y), frac(partial, partial z);
          E_x, E_y, E_z
        )                    & = - j omega mu (hat(x)H_(x) + hat(y)H_(y) + hat(z)H_(z))
      $

      Isolating $H_(x)$:
      $
        frac(partial E_(z), partial y) - frac(partial E_(y), partial z) & = - j omega mu H_(x)
      $

      Since $E_(z) = 0$ and $frac(partial, partial z) = -gamma$:
      $
          -(-gamma)E_(y) & = - j omega mu H_(x) \
             gamma E_(y) & = - j omega mu H_(x) \
        gamma frac(V, b) & = j omega mu frac(I, a) \
                 gamma V & = j omega mu frac(b, a) I \
      $
      Since the wave has the dependence $e^(-gamma z)$ the voltage can be written as:
      $
        V = V_(0) e^(-gamma z)
      $
      Its derivative is:
      $
        frac(dif V, dif z) & = - gamma V_(0) e^(-gamma z) \
                           & = - gamma V
      $

      Hence:
      $
        frac(dif V, dif z) & = - (j omega mu frac(b, a)) I \
                        Z' & = j omega mu frac(b, a)
      $

      From Ampere-Maxwell with $sigma = 0$ for lossless medium:
      $
        nabla times arrow(H) & = j omega epsilon arrow(E) \
        mat(
          delim: "|",
          hat(x), hat(y), hat(z);
          frac(partial, partial x), frac(partial, partial y), frac(partial, partial z);
          H_x, H_y, H_z
        )                    & = j omega epsilon (hat(x)E_(x) + hat(y)E_(y) + hat(z)E_(z))
      $

      Isolating $E_(y)$ (the $hat(y)$ component):
      $
        -(frac(partial H_(z), partial x) - frac(partial H_(x), partial z)) = j omega epsilon E_(y)
      $

      Since $H_(x) = -frac(I, a)$ and $frac(partial, partial z) = -gamma$:
      $
        gamma frac(I, a) - frac(partial H_(z), partial x) = j omega epsilon frac(V, b)
      $

      From the transverse field relations:
      $
                                 E_(y) & = frac(j omega mu, k_(c)^2) frac(partial H_(z), partial x) \
        frac(partial H_(z), partial x) & = E_(y) frac(k_(c)^2, j omega mu) \
      $
      Thus:
      $
        gamma frac(I, a) - (frac(V, b)) frac(k_(c)^2, j omega mu) & = j omega epsilon frac(V, b) \
        gamma frac(I, a) & =(frac(V, b)) frac(k_(c)^2, j omega mu) + j omega epsilon frac(V, b)\
        gamma I & = (frac(k_(c)^2, j omega mu) + j omega epsilon)frac(a, b) V \
        frac(dif I, dif z) &= -(frac(k_(c)^2, j omega mu) + j omega epsilon)frac(a, b) V \
        Y' &= (underbrace(j omega epsilon, "capacitive\nsusceptance") - underbrace(frac(j k_(c)^2, omega mu), "parallel\ninductive\nreactance"))frac(a, b)
      $

      The propagation constant is given by:
      $
        gamma & = sqrt(Z'Y') \
              & = sqrt(j omega mu frac(b, a)(frac(k_(c)^2, j omega mu) + j omega epsilon)frac(a, b)) \
              & = sqrt(k_(c)^2 - omega^2 epsilon mu) \
              & = j sqrt(omega^2 epsilon mu - k_(c)^2) \
              & = j beta quad "where" quad k > k_(c) quad "propagating wave" alpha = 0, sigma = 0
      $

      The characteristic impedance:
      $
        Z_0 & = sqrt(frac(Z', Y')) \
            & = sqrt(frac(j omega mu frac(b, a), (frac(k_(c)^2, j omega mu) + j omega epsilon)frac(a, b))) \
            & = frac(b, a) sqrt(frac(-omega^2 mu^2, k_(c)^2 - omega^2 epsilon mu)) \
            & = frac(b, a) frac(j omega mu, gamma)
      $
    ],
  )
]

#numed-question()[
  #sub-question-group(
    lead: [
      A dielectric-slab waveguide consists of a lossless nonmagnetic simple dielectric slab of thickness $h$ and infinite extent in the $x z$-plane as shown in @dielectric.
      The dielectric medium has constitutive parameters $mu$, $epsilon$, $sigma$ and sits on a perfectly conducting grounded plane as shown.
      Given that the transverse components of the field intensities are related as
      $
        hat(z) times { nabla_t E_z + gamma arrow(E)_t } = j omega mu arrow(H)_t
      $
      and
      $
        hat(z) times { nabla_t H_z + gamma arrow(H)_t } = -j omega epsilon arrow(E)_t
      $
      where the symbols carry their usual meaning.


      #align(center)[
        #figure(
          canvas({
            import draw: *

            let w = 6.4
            let h = 1.4
            let x-orig = 3.2

            // Top and bottom boundaries (parallel plates / slab)
            line((0, h), (w, h), stroke: 1pt + black)
            line((0, 0), (w, 0), stroke: 1pt + black)

            // Left wavy break edge
            bezier(
              (0, h),
              (0, 0),
              (-0.14, h * 0.72),
              (0.14, h * 0.28),
              stroke: 0.9pt + black,
            )

            // Right wavy break edge
            bezier(
              (w, h),
              (w, 0),
              (w - 0.14, h * 0.72),
              (w + 0.14, h * 0.28),
              stroke: 0.9pt + black,
            )

            // Height dimension indicator h on the left
            line((-0.55, 0), (-0.15, 0), stroke: 0.75pt + black)
            line((-0.55, h), (-0.15, h), stroke: 0.75pt + black)
            line(
              (-0.35, 0),
              (-0.35, h),
              stroke: 0.85pt + black,
              mark: (start: "stealth", end: "stealth", fill: black),
            )
            content((-0.6, h / 2), $h$)

            // Coordinate Axes at (x-orig, 0)
            // y-axis (pointing up)
            line(
              (x-orig, 0),
              (x-orig, h + 1.05),
              stroke: 0.9pt + black,
              mark: (end: "stealth", fill: black),
            )
            content((x-orig, h + 1.3), $y$)

            // z-axis (pointing right)
            line(
              (x-orig, 0),
              (x-orig + 1.3, 0),
              stroke: 0.9pt + black,
              mark: (end: "stealth", fill: black),
            )
            content((x-orig + 1.05, 0.26), $z$)

            // x-axis symbol (into the page: circle with cross)
            let r = 0.12
            circle((x-orig, 0), radius: r, fill: white, stroke: 0.9pt + black)
            line(
              (x-orig - r * 0.707, -r * 0.707),
              (x-orig + r * 0.707, r * 0.707),
              stroke: 0.8pt + black,
            )
            line(
              (x-orig - r * 0.707, r * 0.707),
              (x-orig + r * 0.707, -r * 0.707),
              stroke: 0.8pt + black,
            )
            content((x-orig - 0.26, 0.26), $x$)
            content((x-orig + 2, -0.26), $sigma = 0$)
          }),
          caption: "",
        )<dielectric>
      ]
    ],
    sq => [
      #sq(
        [Derive the expressions for TE propagating modes in the guide.],
        answer: answer-box()[
          Since $E_(z) = 0$ in M modes:
          $
            j omega mu arrow(H)_(t) & = hat(z) times gamma arrow(E)_(t) \
                       arrow(H)_(t) & = frac(gamma, j omega mu) hat(z) times arrow(E)_(t)
          $
          Hence:
          $
            -j omega epsilon arrow(E)_(t) &= hat(z) times {nabla_(t)H_(z) + gamma (frac(gamma, j omega mu) hat(z) times arrow(E)_(t))} \
            &= hat(z) times nabla_(t)H_(z) + frac(gamma^2, j omega mu) (hat(z) times hat(z) times E_(t)) \
            &= hat(z) times nabla_(t) H_(z) - frac(gamma^2, j omega mu) arrow(E)_(t) \
            (frac(gamma^2, j omega mu)- j omega epsilon) arrow(E)_(t) &= hat(z) times nabla_(t) H_(z) \
            (gamma^2 + omega^2 epsilon mu) arrow(E)_(t) &= j omega mu hat(z) times nabla_(t) H_(z) \
            arrow(E)_(t) &= frac(j omega mu, k_(c)^2) hat(z) times nabla_(t) H_(z) \
            arrow(H)_(t) & = frac(gamma, j omega mu) hat(z) times (frac(j omega mu, k_(c)^2) hat(z) times nabla_(t) H_(z)) \
            &= - frac(gamma, k_(c)^2) nabla_(t) H_(z)
          $

          From Helmholtz:
          $
            (nabla_(t)^2 + k_(c)^2) H_(z) = 0
          $

          Since the medium is of infinite extent in the $x z$ plane:
          $
            frac(partial, partial x) = 0
          $
          Thus:
          $
            frac(dif^2, dif y^2) H_(z) + k_(c)^2 H_(z) = 0
          $
          $
            k_(c)^2 = cases(
              gamma^2 + k^2 = k_(d)^2 ", " "In the dielectric",
              gamma^2 + k_(0)^2 = k_(a)^2 ", " "In air"
            )
          $
          For the fields in both regions to be continuous across the plane $y = h$
          $
            k_(d)^2 - k_(a)^2 = (epsilon_(r) - 1)k_(0)^2
          $

          Since the medium is lossless $gamma = j beta$ and for propagating modes $k_(0) lt.eq beta lt.eq k^2$, meaning $k_(a)^2 < 0$.
          Hence:
          $
            k_(d)^2 + alpha^2 = (epsilon_(r) - 1)k_(0)^2
          $
          The general solutions are:
          $
            H_(z) = cases(
              A cos(k_(d) y) + B sin(k_(d) y) & ", " 0 lt.eq y lt.eq h,
              C exp{-alpha (y - h)} & ", " y gt.eq h
            )
          $

          Boundary condition at $y = 0$, the tangential electric field must be zero at the surface of the perfect conductor which is proportional to $frac(partial H_(z), partial y)$.
          Thus:
          $
            lr(frac(partial H_(z), partial y)|)_(y = 0) = -A k_(d) sin(0) + B k_(d) cos(0) = 0 arrow.r.double B = 0
          $
          So:

          $
            H_(z) = cases(
              A cos(k_(d) y) & ", " 0 lt.eq y lt.eq h,
              C exp{-alpha (y - h)} & ", " y gt.eq h
            )
          $

          Finding the gradient of $H_(z)$:
          $
            hat(y) frac(partial H_(z), partial y) = cases(
              - hat(y) A k_(d) sin(k_(d) y) & ", " 0 lt.eq h lt.eq h,
              - hat(y) alpha C exp{-alpha (y - h)} & ", " y gt.eq h
            )
          $

          Thus:
          $
            H_(t) & = cases(
                      hat(y) frac(A k_(d) gamma, k_(c)^2) sin(k_(d) y) & ", " 0 lt.eq y lt.eq h,
                      hat(y) frac(alpha C gamma, k_(c)^2) exp{-alpha (y - h)} & ", " y gt.eq h
                    ) \
                  & = cases(
                      hat(y) frac(gamma, k_(d))A sin(k_(d) y) & ", " 0 lt.eq y lt.eq h,
                      - hat(y) frac(gamma, alpha)C exp{-alpha (y - h)} & ", " y gt.eq h
                    ) \
            E_(t) & = cases(
                      hat(x) frac(A k_(d) j omega mu, k_(c)^2) sin(k_(d) y) & ", " 0 lt.eq y lt.eq h,
                      hat(x) frac(alpha C j omega mu, k_(c)^2) exp{-alpha (y - h)} & ", " y gt.eq h
                    ) \
                  & = cases(
                      hat(x) frac(j omega mu, k_(d))A sin(k_(d) y) & ", " 0 lt.eq y lt.eq h,
                      - hat(x) frac(j omega mu, alpha)C exp{-alpha (y - h)} & ", " y gt.eq h
                    )
          $
        ],
      )

      #sq(
        [Determine the cut-off frequency for a general TE mode in the guide.],
        answer: answer-box()[
          At the $y = h$ plane $arrow(E)_(t)$ and $H_(z)$ must be continuous:
          $
                                     A cos(k_(d)h) & = C \
            frac(j omega mu, k_(d)) A sin(k_(d) y) & = - frac(j omega mu, alpha) C
          $

          $
            frac(j omega mu, k_(d)) A sin(k_(d) y) & = - frac(j omega mu, alpha) A cos(k_(d)h) \
                                 k_(d) tan(k_(d)h) & = - alpha
          $
          Which is the eigenvalue equation for TE modes.

          At cut-off, $alpha = 0$ and $gamma = 0$ since the fields stop decaying thus:
          $
            k_(d) tan(k_(d) h) = 0
          $

          For non-trivial solutions:
          $
            k_(d)h = m pi quad m = 1, 2, 3, dots \
          $
          $
                                         k h & = m pi \
            omega_(c) sqrt(mu_(0) epsilon) h & = m pi \
                                       f_(c) & = frac(m, 2 h sqrt(mu_0 epsilon))
          $
        ],
      )

      #sq(
        [Determine the phasor representation of the surface current and surface charge densities on the conducting base for the propagating modes.],
        answer: answer-box()[
          The surface current is given by:
          $
            arrow(J)_(s) & = hat(n) times lr(arrow(H)|)_(y = 0) \
                         & = hat(y) times (hat(y)arrow(H)(0) + hat(z)H_(z)(0)) \
                         & = hat(x) H_(z)(0)
          $
          Since the field has the dependence $e^(-gamma z)$:
          $
            arrow(J)_(s) = hat(x) A e^(-gamma z) thin "A m"^(-1)
          $

          The surface charge:
          $
            rho_(s) & = hat(n) dot arrow(D) \
                    & = hat(y) dot (epsilon arrow(E)) \
                    & = hat(y) dot (hat(x) epsilon E_(x)) \
                    & = 0
          $
        ],
      )
    ],
  )
]

= EXAM
#numed-question()[
  #sub-question-group(
    lead: [
      When the thickness of a dielectric slab waveguide situated in air, is very small compared to the operating wavelength, the field intensities decay very slowly with distance from the slab surface.
      The propagation constant is then very nearly equal to that of the surrounding medium.
      Consider the nonmagnetic dielectric slab of infinite extent in the $x z$-plane shown in @diel-sus
      #align(center)[
        #figure(
          canvas({
            import draw: *

            let x-min = -3.8
            let x-max = 3.8
            let half-h = 0.85

            // Dielectric slab shaded region with jagged left and right edges
            line(
              (x-min, half-h),
              (x-max, half-h),
              // Right jagged edge (top to bottom)
              (x-max + 0.08, half-h * 0.72),
              (x-max - 0.07, half-h * 0.44),
              (x-max + 0.08, half-h * 0.16),
              (x-max - 0.06, -half-h * 0.14),
              (x-max + 0.08, -half-h * 0.44),
              (x-max - 0.07, -half-h * 0.72),
              (x-max, -half-h),
              // Bottom boundary
              (x-min, -half-h),
              // Left jagged edge (bottom to top)
              (x-min - 0.08, -half-h * 0.72),
              (x-min + 0.07, -half-h * 0.44),
              (x-min - 0.08, -half-h * 0.16),
              (x-min + 0.06, half-h * 0.14),
              (x-min - 0.08, half-h * 0.44),
              (x-min + 0.07, half-h * 0.72),
              close: true,
              fill: rgb("#dcdde3"),
              stroke: 0.9pt + black,
            )

            // z-axis (horizontal through origin)
            line(
              (x-min - 0.45, 0),
              (x-max + 1.4, 0),
              stroke: 0.9pt + black,
              mark: (end: "stealth", fill: black),
            )
            content((x-max + 1.65, 0), $z$)

            // y-axis (vertical through origin)
            line(
              (0, -half-h - 1.15),
              (0, half-h + 1.55),
              stroke: 0.9pt + black,
              mark: (end: "stealth", fill: black),
            )
            content((0, half-h + 1.8), $y$)

            // x-axis symbol at origin (into the page: circle with cross)
            let r = 0.12
            circle((0, 0), radius: r, fill: rgb("#dcdde3"), stroke: 0.9pt + black)
            line(
              (-r * 0.707, -r * 0.707),
              (r * 0.707, r * 0.707),
              stroke: 0.8pt + black,
            )
            line(
              (-r * 0.707, r * 0.707),
              (r * 0.707, -r * 0.707),
              stroke: 0.8pt + black,
            )
            content((0.28, -0.26), $x$)

            // Medium parameter labels
            content((-1.35, half-h + 0.42), $epsilon_0, mu_0$)
            content((-1.35, half-h * 0.42), $epsilon, mu$)
            content((-1.35, -half-h - 0.42), $epsilon_0, mu_0$)

            // Right side h/2 dimension markers
            let dim-x = x-max + 0.45
            line((x-max + 0.18, half-h), (dim-x + 0.25, half-h), stroke: 0.75pt + black)
            line((x-max + 0.18, -half-h), (dim-x + 0.25, -half-h), stroke: 0.75pt + black)

            // Upper h/2 arrow
            line(
              (dim-x, 0),
              (dim-x, half-h),
              stroke: 0.8pt + black,
              mark: (start: "stealth", end: "stealth", fill: black, scale: 0.75),
            )
            content((dim-x + 0.45, half-h / 2), $h\/2$)

            // Lower h/2 arrow
            line(
              (dim-x, -half-h),
              (dim-x, 0),
              stroke: 0.8pt + black,
              mark: (start: "stealth", end: "stealth", fill: black, scale: 0.75),
            )
            content((dim-x + 0.45, -half-h / 2), $h\/2$)
          }),
          caption: "",
        )<diel-sus>
      ]
    ],
    sq => [
      #sq(
        [Obtain solutions for the spatial distributions of the transverse field intensities for odd TE modes propagating in the $+z$-direction in the slab.],
      )

      #sq(
        [
          Show that when $k_y h lt.double 1$, where $k_y$ is the cut-off wavenumber in the transverse plane, the following relations hold approximately for these modes:
          $
            beta tilde.op k_0 \
            alpha tilde.op -frac(h, 2)(k^2 - k_0^2)
          $
          where $k = omega sqrt(mu epsilon)$ and $k_(0) = omega sqrt(mu_(0) epsilon_(0))$ and the symbols carry their usual meaning
        ],
      )

      #sq(
        [For a slab of thickness 5 mm and dielectric constant 3, estimate the distance from the slab surface where the field intensities will have decayed to $tilde.op 37%$ of their values at the surface of the slab at an operating frequency of 0.30 GHz.],
      )
    ],
  )
  = DeepSeek
  #sub-question-group(
    lead: [
      When the thickness of a dielectric slab waveguide situated in air, is very small compared to the operating wavelength, the field intensities decay very slowly with distance from the slab surface.
      The propagation constant is then very nearly equal to that of the surrounding medium.
      Consider the nonmagnetic dielectric slab of infinite extent in the $x z$-plane shown in @diel-susa
      #align(center)[
        #figure(
          canvas({
            import draw: *

            let x-min = -3.8
            let x-max = 3.8
            let half-h = 0.85

            // Dielectric slab shaded region with jagged left and right edges
            line(
              (x-min, half-h),
              (x-max, half-h),
              // Right jagged edge (top to bottom)
              (x-max + 0.08, half-h * 0.72),
              (x-max - 0.07, half-h * 0.44),
              (x-max + 0.08, half-h * 0.16),
              (x-max - 0.06, -half-h * 0.14),
              (x-max + 0.08, -half-h * 0.44),
              (x-max - 0.07, -half-h * 0.72),
              (x-max, -half-h),
              // Bottom boundary
              (x-min, -half-h),
              // Left jagged edge (bottom to top)
              (x-min - 0.08, -half-h * 0.72),
              (x-min + 0.07, -half-h * 0.44),
              (x-min - 0.08, -half-h * 0.16),
              (x-min + 0.06, half-h * 0.14),
              (x-min - 0.08, half-h * 0.44),
              (x-min + 0.07, half-h * 0.72),
              close: true,
              fill: rgb("#dcdde3"),
              stroke: 0.9pt + black,
            )

            // z-axis (horizontal through origin)
            line(
              (x-min - 0.45, 0),
              (x-max + 1.4, 0),
              stroke: 0.9pt + black,
              mark: (end: "stealth", fill: black),
            )
            content((x-max + 1.65, 0), $z$)

            // y-axis (vertical through origin)
            line(
              (0, -half-h - 1.15),
              (0, half-h + 1.55),
              stroke: 0.9pt + black,
              mark: (end: "stealth", fill: black),
            )
            content((0, half-h + 1.8), $y$)

            // x-axis symbol at origin (into the page: circle with cross)
            let r = 0.12
            circle((0, 0), radius: r, fill: rgb("#dcdde3"), stroke: 0.9pt + black)
            line(
              (-r * 0.707, -r * 0.707),
              (r * 0.707, r * 0.707),
              stroke: 0.8pt + black,
            )
            line(
              (-r * 0.707, r * 0.707),
              (r * 0.707, -r * 0.707),
              stroke: 0.8pt + black,
            )
            content((0.28, -0.26), $x$)

            // Medium parameter labels
            content((-1.35, half-h + 0.42), $epsilon_0, mu_0$)
            content((-1.35, half-h * 0.42), $epsilon, mu$)
            content((-1.35, -half-h - 0.42), $epsilon_0, mu_0$)

            // Right side h/2 dimension markers
            let dim-x = x-max + 0.45
            line((x-max + 0.18, half-h), (dim-x + 0.25, half-h), stroke: 0.75pt + black)
            line((x-max + 0.18, -half-h), (dim-x + 0.25, -half-h), stroke: 0.75pt + black)

            // Upper h/2 arrow
            line(
              (dim-x, 0),
              (dim-x, half-h),
              stroke: 0.8pt + black,
              mark: (start: "stealth", end: "stealth", fill: black, scale: 0.75),
            )
            content((dim-x + 0.45, half-h / 2), $h\/2$)

            // Lower h/2 arrow
            line(
              (dim-x, -half-h),
              (dim-x, 0),
              stroke: 0.8pt + black,
              mark: (start: "stealth", end: "stealth", fill: black, scale: 0.75),
            )
            content((dim-x + 0.45, -half-h / 2), $h\/2$)
          }),
          caption: "",
        )<diel-susa>
      ]
    ],
    sq => [
      #sq(
        [Obtain solutions for the spatial distributions of the transverse field intensities for odd TE modes propagating in the $+z$-direction in the slab.],
        answer: answer-box()[
          For a TE mode, $E_z = 0$. The axial magnetic field $H_z$ satisfies the Helmholtz equation:
          $
            nabla_t^2 H_z + k_c^2 H_z = 0
          $
          Based on the figure, the slab extends along the \(y\)-axis from $y = -h/2$ to $y = h/2$. Since the slab is infinite in the \(x\)-direction, $frac(partial, partial x) = 0$, so \(nabla_t^2 = frac(partial^2, partial y^2)\).

          The transverse wavenumber is:
          $
            k_c^2 = cases(
              k_y^2 = gamma^2 + k^2 = k^2 - beta^2 & ", " |y| lt.eq h/2 " (dielectric)",
              -alpha^2 = gamma^2 + k_0^2 = k_0^2 - beta^2 & ", " |y| gt.eq h/2 " (air)"
            )
          $
          For **odd TE modes**, \(H_z\) must be an odd function of \(y\). Thus, in the core:
          $
            H_z(y) = A sin(k_y y), quad |y| lt.eq h/2
          $
          In the air cladding, the field must decay exponentially and be odd:
          $
            H_z(y) = cases(
              B exp{-alpha (y - h/2)} & ", " y gt.eq h/2,
              -B exp{alpha (y + h/2)} & ", " y lt.eq -h/2
            )
          $
          The transverse electric field is $arrow(E)_t = frac(j omega mu, k_c^2) hat(z) times nabla_t H_z$. With \(nabla_t = hat(y) frac(partial, partial y)\):
          $
            arrow(E)_t = frac(j omega mu, k_c^2) (hat(z) times hat(y)) frac(partial H_z, partial y) = -hat(x) frac(j omega mu, k_c^2) frac(partial H_z, partial y)
          $
          Thus, $E_x$ in the core ($|y| lt.eq h/2$):
          $
            E_x = -frac(j omega mu, k_y^2) (A k_y cos(k_y y)) = -frac(j omega mu, k_y) A cos(k_y y)
          $
          In the upper air cladding ($y gt.eq h/2$):
          $
            E_x = -frac(j omega mu, -alpha^2) (-alpha B exp{-alpha (y - h/2)}) = -frac(j omega mu, alpha) B exp{-alpha (y - h/2)}
          $
        ],
      )

      #sq(
        [
          Show that when $k_y h lt.double 1$, where $k_y$ is the cut-off wavenumber in the transverse plane, the following relations hold approximately for these modes:
          $
            beta tilde.op k_0 \
            alpha tilde.op -frac(h, 2)(k^2 - k_0^2)
          $
          where $k = omega sqrt(mu epsilon)$ and $k_(0) = omega sqrt(mu_(0) epsilon_(0))$ and the symbols carry their usual meaning
        ],
        answer: answer-box()[
          #text(
            style: "italic",
          )[Note on the exam paper's typo: The condition \(k_y h lt.double 1\) cannot apply to odd modes. Odd modes have a cutoff at \(k_y h = pi\). The small-angle approximation actually applies to the fundamental **even** mode (where \(H_z\) is a cosine). Furthermore, the negative sign in the exam paper's \(\alpha\) expression is a typo; \(\alpha\) must be positive for the field to decay. Below, I show the derivation for the expected approximations.]

          For the lowest-order even TE mode, the fields in the core (\(|y| lt.eq h/2\)) are:
          $
            H_z = A cos(k_y y), quad E_x = frac(j omega mu, k_y) A sin(k_y y)
          $
          In the air (\(y gt.eq h/2\)):
          $
            H_z = B exp{-alpha (y - h/2)}, quad E_x = -frac(j omega mu, alpha) B exp{-alpha (y - h/2)}
          $
          Matching boundary conditions at \(y = h/2\) gives the eigenvalue equation:
          $
            k_y tan(k_y h/2) = alpha
          $
          For \(k_y h lt.double 1\), we use the small-angle approximation \(tan(x) tilde.op x\):
          $
            alpha tilde.op k_y (frac(k_y h, 2)) = frac(h, 2) k_y^2
          $
          From the dispersion relation \(k_y^2 = k^2 - k_0^2 - alpha^2\), since the slab is thin, the field decays slowly (\(\alpha\) is very small), so \(alpha^2\) is negligible compared to \(k^2 - k_0^2\). Thus:
          $
            k_y^2 tilde.op k^2 - k_0^2
          $
          Substituting this back yields:
          $
            alpha tilde.op frac(h, 2) (k^2 - k_0^2)
          $
          Since \(alpha\) is very small, the propagation constant is:
          $
            beta = sqrt(k_0^2 + alpha^2) tilde.op k_0
          $
        ],
      )

      #sq(
        [For a slab of thickness 5 mm and dielectric constant 3, estimate the distance from the slab surface where the field intensities will have decayed to $tilde.op 37%$ of their values at the surface of the slab at an operating frequency of 0.30 GHz.],
        answer: answer-box()[
          Given:
          $h = 5 " mm" = 5 times 10^(-3) " m"$, $epsilon_r = 3$, $f = 0.30 " GHz" = 0.3 times 10^9 " Hz"$, $c = 3 times 10^8 " m/s"$.

          Calculate the free-space and dielectric wavenumbers:
          $
            k_0 = frac(2 pi f, c) = frac(2 pi (0.3 times 10^9), 3 times 10^8) = 2 pi " rad/m"
          $
          $
            k = k_0 sqrt(epsilon_r) = 2 pi sqrt(3) " rad/m"
          $
          Calculate the decay constant \(alpha\):
          $
            alpha & = frac(h, 2)(k^2 - k_0^2) \
                  & = frac(5 times 10^(-3), 2) ((2 pi sqrt(3))^2 - (2 pi)^2) \
                  & = 0.0025 (12 pi^2 - 4 pi^2) \
                  & = 0.0025 (8 pi^2) = 0.02 pi^2 " Np/m" tilde.op 0.1974 " Np/m"
          $
          The field intensity decays as \(exp(-alpha d)\). We want the distance \(d\) where it decays to \(37%\), which is \(1/e\):
          $
            exp(-alpha d) = exp(-1) arrow.double d = frac(1, alpha) = frac(1, 0.1974) tilde.op 5.07 " m"
          $
          The field intensities will have decayed to \(tilde.op 37%\) of their surface values at a distance of approximately \(5.07 " m"\) from the slab surface.
        ],
      )
    ],
  )
]
