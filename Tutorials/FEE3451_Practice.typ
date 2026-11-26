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

            // Dielectric slab shaded region with jalt.doubleed left and right edges
            line(
              (x-min, half-h),
              (x-max, half-h),
              // Right jalt.doubleed edge (top to bottom)
              (x-max + 0.08, half-h * 0.72),
              (x-max - 0.07, half-h * 0.44),
              (x-max + 0.08, half-h * 0.16),
              (x-max - 0.06, -half-h * 0.14),
              (x-max + 0.08, -half-h * 0.44),
              (x-max - 0.07, -half-h * 0.72),
              (x-max, -half-h),
              // Bottom boundary
              (x-min, -half-h),
              // Left jalt.doubleed edge (bottom to top)
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
        answer: answer-box()[
          For TE modes $E_(z) = 0$ so:
          $
            arrow(H)_(t) & = - frac(gamma, k_(c)^2) nabla_(t) H_(z) \
            arrow(E)_(t) & = frac(j omega mu, k_(c)^2) hat(z) times nabla_(t) H_(z)
          $

          The transverse wavenumber is:
          $
            k_(c)^2 = cases(
              k_(y)^2 = gamma^2 + k^2 & ", " |y| lt.eq h/2,
              -alpha^2 = gamma^2 + k_(0)^2 & ", " |y| gt.eq h/2
            )
          $

          Since the slab is of infinite extent in the $x$ direction:
          $
            frac(partial, partial x) = 0
          $

          So the Helmholtz Equation reduces to:
          $
            frac(partial^2 H_(z), partial y^2) + k_(c)^2 H_(z) = 0
          $
          In the suspended dielectric slab waveguide even and odd modes exist since the structure is symmetrical above and below $y = 0$ thus the electromagnetic fields must respect this.
          The even mode is the fundamental mode and has no cutoff  frequency which can propagate if the slab is infinitesimally thin, the field has a max(or min) at the center.
          The odd mode is the next higher mode, the field has to cross zero at the center thus there is a minimum thickness required for it to propagate hence has a non-zero cut-off frequency.

          For odd TE modes, $H_(z)$ must be an odd function of $y$. Thus in the dielectric:
          $
            H_(z)(y) = A sin(k_(y)y), quad |y| lt.eq h/2
          $

          In air:
          $
            H_(z)(y) = cases(
              B exp{-alpha(y - h/2)} ", " y gt.eq h/2,
              -B exp{alpha(y + h/2)} ", " y lt.eq -h/2,
            )
          $
          The $-B$ in the second case is there to enforce the odd symmetry of this mode.

          Finding the gradient of $H_(z)$:
          $
            nabla_(t) H_(z) & = hat(y) frac(partial H_(z), partial y) \
                            & = cases(
                                -hat(y) B alpha exp{-alpha(y - h/2)} & ", " y gt.eq h/2,
                                hat(y) A k_(y) cos (k_(y)y) & ", " |y| lt.eq h/2,
                                -hat(y) B alpha exp{alpha(y + h/2)} & ", " y lt.eq -h/2,
                              )
          $

          Thus:
          $
            arrow(E)_(t) & = cases(
                             - hat(x) frac(j omega mu, alpha) B exp{-alpha(y - h/2)} & ", " y gt.eq h/2,
                             - hat(x) frac(j omega mu, k_(y)) A cos (k_(y)y) & ", " |y| lt.eq h/2,
                             - hat(x) frac(j omega mu, alpha) B exp{alpha(y + h/2)} & ", " y lt.eq -h/2,
                           ) \
            arrow(H)_(t) & = cases(
                             - hat(y) frac(gamma, alpha) B exp{-alpha(y - h/2)} & ", " y gt.eq h/2,
                             - hat(y) frac(gamma, k_(y)) A cos (k_(y)y) & ", " |y| lt.eq h/2,
                             - hat(y) frac(gamma, alpha) B exp{alpha(y + h/2)} & ", " y lt.eq -h/2,
                           )
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
          The $k_(y)h lt.double 1$ is physically impossible for odd modes, to prove this we use the eigenvalue equation for odd modes and analyze the roots.
          Since we already have the expression for $H_(z)$ and $arrow(E)_(t)$ for odd TE modes applying boundary condtions at $y = h/2$ yields:
          $
                  A sin(k_(y) h/2) & = B \
            A k_(y) cos(k_(y) h/2) & = - B alpha
          $

          The eigenvalue equation is thus:
          $
            A k_(y) cos(k_(y) h/2) & = - A sin(k_(y) h/2) alpha \
              k_(y) cot(k_(y) h/2) & = - alpha
          $

          $k_(y) > 0$ and $alpha > 0$ for a decaying evanescent field thus for the above condition to hold true:
          $
            cot(k_(y) h/2) < 0
          $

          The cotangent function is negative when its argument is between $pi/2$ and $pi$ for the lowest order mode.
          $
            pi/2 < frac(k_(y)h, 2) < pi \
            pi < k_(y)h < 2 pi
          $

          This contradicts $k_(y) lt.double 1$

          It is however feasible for even modes, deriving the expressions for $H_(z)$ and $arrow(E)_(t)$ for even modes and applying the boundary conditions yields the eigenvalue equation:
          $
            k_(y) tan(k_(y) h/2) = alpha
          $

          Because $alpha > 0$:
          $
            0 < frac(k_(y) h, 2) < pi/2 \
            0 < k_(y) h < pi
          $

          It is possible to get $k_(y) h lt.double 1$ with these conditions.

          Applying the small angle approximation $tan(x) approx x$:
          $
            alpha & approx k_(y) (frac(k_(y)h, 2)) \
                  & approx h/2 k_(y)^2 \
                  & approx h/2 (gamma^2 + k^2)
          $

          $gamma^2 = -k_0^2 - alpha^2$ however since the slab is thin the field decays slowly, $alpha^2$ is negligible thus $gamma^2 approx -k_0^2$ which gives:
          $
            alpha approx h/2(k^2 - k_(0)^2)
          $
          For a lossless medium $gamma = j beta$:
          $
            -beta^2 = -k_(0)^2 - alpha^2
          $
          once again since the field decays very slowly $alpha^2$ is negligible thus:
          $
            beta approx k_0
          $

          The negative sign in the question ($alpha tilde.op - h/2 (k^2 - k_0^2)$) is probably a typo
        ],
      )

      #sq(
        [For a slab of thickness 5 mm and dielectric constant 3, estimate the distance from the slab surface where the field intensities will have decayed to $tilde.op 37%$ of their values at the surface of the slab at an operating frequency of 0.30 GHz.],
        answer: answer-box()[
          $
            h = 5 times 10^(-3) "m" \
            epsilon_(r) = 3\
            f = 0.3 times 10^(9) "Hz"\
            c_(0) = frac(1, sqrt(mu_(0) epsilon_(0))) = 3 times 10^(8) "m s"^(-1)
          $
          Thus:
          $
            k_(0) & = frac(2 pi f, c) \
                  & = (2 pi times 0.3 times 10^(9))/(3 times 10^(8)) \
                  & = 2 pi" rad m"^(-1) \
                k & = k_0sqrt(epsilon_(r)) \
                  & = 2 pi sqrt(3)" rad m"^(-1)
          $
          The decay constant is hence:
          $
            alpha & = h/2(k^2 - k_(0)^2) \
                  & = 2.5 times 10^(-3) (12 - 4)pi^2 \
                  & = #fmt(2.5e-3 * 8 * calc.pi * calc.pi)" Np m"^(-1)
          $
          The distance $d$ from the slab at which it decays to $37\% approx 1/e$ is:
          $
            exp(- alpha d) & = exp(-1) \
                   alpha d & = 1 \
                         d & = #fmt(1 / (2.5e-3 * 8 * calc.pi * calc.pi))" m"
          $
        ],
      )
    ],
  )
]

#numed-question()[
  #sub-question-group(
    lead: [
      The parallel-plate waveguide shown in @parallel-plate is made from 50 $mu"m"$ thick copper plates separated by a lossless nonmagnetic simple dielectric. If the plate width $W$ much larger than the plate separation $b$.
      #align(center)[
        #figure(
          canvas({
            import draw: *

            // Plate dimensions (oblique / isometric-like perspective)
            let w = 6.2 // front width along x
            let t = 0.22 // plate thickness along y
            let gap = 1.35 // inner spacing b between plates
            let dx = 3.2 // depth shift in x for back edge
            let dy = 2.05 // depth shift in y for back edge

            let plate-fill = rgb("#e3e5ec")
            let edge-fill = rgb("#d2d5df")
            let stroke-main = 0.9pt + black

            // Helper to draw a 3D-ish thin rectangular plate starting at bottom-front-left (ox, oy)
            let draw-plate(ox, oy) = {
              let f-bl = (ox, oy)
              let f-br = (ox + w, oy)
              let f-tr = (ox + w, oy + t)
              let f-tl = (ox, oy + t)

              let b-tl = (ox + dx, oy + t + dy)
              let b-tr = (ox + w + dx, oy + t + dy)
              let b-br = (ox + w + dx, oy + dy)

              // Top face (parallelogram)
              line(f-tl, f-tr, b-tr, b-tl, close: true, fill: plate-fill, stroke: stroke-main)

              // Front face
              line(f-bl, f-br, f-tr, f-tl, close: true, fill: edge-fill, stroke: stroke-main)

              // Right side face
              line(f-br, b-br, b-tr, f-tr, close: true, fill: edge-fill, stroke: stroke-main)
            }

            // Bottom plate (base at y = 0)
            draw-plate(0, 0)

            // Top plate (bottom face at y = t + gap)
            let top-oy = t + gap
            draw-plate(0, top-oy)

            // Medium label inside the region between plates
            content((w * 0.56, t + gap * 0.48), $mu, epsilon$)

            // Width dimension W above front edge of top plate
            let w-y = top-oy + t + 0.55
            line((0, top-oy + t + 0.08), (0, w-y + 0.12), stroke: 0.75pt + black)
            line((w, top-oy + t + 0.08), (w, w-y + 0.12), stroke: 0.75pt + black)
            line(
              (0, w-y),
              (w, w-y),
              stroke: 0.85pt + black,
              mark: (start: "stealth", end: "stealth", fill: black, scale: 0.8),
            )
            content((w / 2, w-y + 0.28), $W$)

            // Spacing dimension b on the left between bottom of top plate and top of bottom plate
            let b-x = -0.65
            let y-bot-top = t
            let y-top-bot = top-oy
            line((-0.12, y-bot-top), (b-x - 0.15, y-bot-top), stroke: 0.75pt + black)
            line((-0.12, y-top-bot), (b-x - 0.15, y-top-bot), stroke: 0.75pt + black)
            line(
              (b-x, y-bot-top),
              (b-x, y-top-bot),
              stroke: 0.85pt + black,
              mark: (start: "stealth", end: "stealth", fill: black, scale: 0.8),
            )
            content((b-x - 0.35, (y-bot-top + y-top-bot) / 2), $b$)

            // Coordinate axes at front-right corner of bottom plate (w, t)
            let ax-o = (w - 0.25, t)

            // y-axis (up)
            line(
              ax-o,
              (ax-o.at(0), ax-o.at(1) + 1.05),
              stroke: 0.9pt + black,
              mark: (end: "stealth", fill: black, scale: 0.75),
            )
            content((ax-o.at(0), ax-o.at(1) + 1.25), $y$)

            // x-axis (left along width)
            line(
              ax-o,
              (ax-o.at(0) - 1.15, ax-o.at(1)),
              stroke: 0.9pt + black,
              mark: (end: "stealth", fill: black, scale: 0.75),
            )
            content((ax-o.at(0) - 1.28, ax-o.at(1) + 0.18), $x$)

            // z-axis (into/back along depth)
            line(
              ax-o,
              (ax-o.at(0) + 0.85, ax-o.at(1) + 0.55),
              stroke: 0.9pt + black,
              mark: (end: "stealth", fill: black, scale: 0.75),
            )
            content((ax-o.at(0) + 0.98, ax-o.at(1) + 0.42), $z$)
          }),
          caption: "",
        )<parallel-plate>
      ]
    ],
    sq => [
      #sq(
        [State the conditions the plates must have in order that electric wall boundary conditions may be assumed for the plate surfaces hence, derive expressions for the field distributions in the transverse plane in the guide.],
        answer: answer-box()[
          + For TEM waves to propagate the plates must be perfectly electric conductors so that the tangential electric field can be zero at the surfaces.
          + The plate separation $b$ must be much less than the wavelength to ensure only the dominant mode propagates.

          For TEM mode $E_(z) = H_(z) = 0$ so the standard transverse field equations an indeterminate form.
          Since $E_(z) = 0$ $nabla_(t) times arrow(E)_(t) = 0$ meaning $E_(t)$ is irrotational and can be expressed as the gradient of a scalar potential:
          $
            arrow(E)_(t) = - nabla_(t) Phi (x, y)
          $

          In the source-free dielectric, Gauss' law requires $nabla_(t) dot arrow(E)_(t) = 0$ so $Phi$ satisfies Laplace's equation:
          $
            nabla_(t)^2 Phi = 0
          $

          Since $W gt.double b$ there is no variation in the $x$ direction hence $frac(partial, partial x) = 0$ simplifying Laplace's Equation to:
          $
            frac(dif^2 Phi, dif y^2) & = 0 \
                              Phi(y) & = A y + C
          $

          The transverse electric field is uniform in $y$:
          $
            arrow(E)_(t) & = - nabla_(t) Phi (x, y) \
                         & = - hat(y) frac(dif Phi, dif y) \
                         & = - hat(y) A \
                         & = hat(y) E_(y)
          $

          The boundary condition at $y = 0, y = b$ require the tangential electric field to vanish.
          The tangential components are $E_(x), E_(z)$ which are already zero.

          The transverse magnetic field is found from Faraday's law:
          $
            arrow(H)_(t) & = frac(gamma, j omega mu) hat(z) times arrow(E)_(t) \
                         & = 1/ Z_("TEM") hat(z) times arrow(E)_(t) \
                         & = -hat(x) frac(E_(y), Z_("TEM"))
          $
          where $Z_("TEM") = sqrt(frac(mu, epsilon))$ is the intrinsic impedance of the dielectric medium.

          Is what I would have given as the answer but since #subq-ref(<tm-att>) requires a $"TM"_n$ mode it makes sense to start with TM modes here.

          Thus $H_(z) = 0$ meaning:
          $
            arrow(H)_(t) & = - frac(j omega epsilon, k_(c)^2) hat(z) times nabla_(t) E_(z) \
            arrow(E)_(t) & = - frac(gamma, k_(c)^2) nabla_(t) E_(z)
          $

          Since $W lt.double b$ $frac(partial, partial x) = 0$ thus Helmholtz equation becomes:
          $
            frac(partial^2 E_(z), partial y^2) + k_(c)^2 E_(z) = 0
          $

          This yields the solution(the usual steps general form of the solution Dirichlet boundary conditions etc.):
          $
            E_(z) = A sin(frac(n pi, b) y)
          $

          The transverse gradient of $E_(z)$ is:
          $
            nabla_(t)E_(z) & = hat(y) frac(partial E_(z), partial y) \
                           & = hat(y) frac(n pi, b) A cos (frac(n pi, b)y) \
                           & = hat(y) k_(c) A cos(k_(c)y)
          $

          The expression for the transverse fields become:
          $
            arrow(E)_(t) & = - hat(y) frac(gamma, k_(c)) A cos(k_(c)y) \
            arrow(H)_(t) & = hat(x) frac(j omega epsilon, k_(c)) A cos(k_(c) y)
          $
        ],
      )

      #sq(
        [Derive expressions for the charge and current distributions in the plates under these conditions.],
        answer: answer-box()[
          The normal is into the dielectric so in the case of the bottom plate its from the metal into the dielectric meaning $hat(n) = hat(y)$.
          For the top plate $hat(n) = -hat(y)$.
          This results from the fact that the normal vector is always defined as pointing from Medium 1 into Medium 2 and the general form of the boundary condtion is:
          $
            hat(n) dot (arrow(D)_2 - arrow(D)_1) = rho_(s) \
            hat(n) times (arrow(H)_2 - arrow(H)_1) = arrow(J)_(s)
          $
          Inside a perfect conductor fields are zero so for convenience we medium 1 to be the perfect conductor for the expressions to reduce to:
          $
            hat(n) dot arrow(D)_(2) = rho_(s) \
            hat(n) times arrow(H)_(2) = arrow(J)_(s)
          $

          Thus for the bottom plate $y = 0$:
          $
            arrow(J)_(s) & = hat(n) times arrow(H) \
                         & = hat(y) times hat(x) H_(x)(0) \
                         & = - hat(z) H_(x)(0) \
                         & = - hat(z) frac(j omega epsilon, k_(c)) A \
                 rho_(s) & = hat(n) dot arrow(D) \
                         & = hat(y) dot (epsilon arrow(E)) \
                         & = hat(y) dot {epsilon (hat(y)E_(y)(0) + hat(z)E_(z)(0))} \
                         & = epsilon E_(y)(0) \
                         & = - frac(epsilon gamma, k_(c)) A
          $

          and for the top plate $y = b$:
          $
            arrow(J)_(s) & = hat(n) times arrow(H) \
                         & = - hat(y) times hat(x) H_(x)(b) \
                         & = hat(z) H_(x)(b) \
                         & = hat(z) frac(j omega epsilon, k_(c)) A cos(n pi) \
                         & = (-1)^(n) hat(z) frac(j omega epsilon, k_(c)) A \
                 rho_(s) & = hat(n) dot arrow(D) \
                         & = - hat(y) dot (epsilon arrow(E)) \
                         & = - hat(y) dot {epsilon (hat(y)E_(y)(b) + hat(z)E_(z)(b))} \
                         & = - epsilon E_(y)(b) \
                         & = (-1)^(n)frac(epsilon gamma, k_(c)) A
          $
        ],
      )

      #sq(
        [Obtain an expression for the attenuation constant for propagating $"TM"_n$ modes in the guide as a function of the ratio $f/f_"cn"$, where $f$ is the operating frequency and $f_"cn"$ the cut-off frequency, hence determine the value of $f/f_"cn"$ for which the attenuation constant is minimum.],
        ref: <tm-att>,
        answer: answer-box()[

        ],
      )
    ],
  )
]

#numed-question()[
  #sub-question(
    [
      An electromagnetic wave is propagating through an air-filled rectangular waveguide with perfectly conducting walls and the cross-section shown in @rect-guide. Given that the axial electric and magnetic field intensity distributions in the guide may be expressed as
      $
        E_z & = E_(m n) sin(frac(m pi, a) x) sin(frac(n pi, b) y), quad m = 1, 2, 3, dots.c, quad n = 1, 2, 3, dots.c \
        H_z & = H_(m n) cos(frac(m pi, a) x) cos(frac(n pi, b) y), quad m = 0, 1, 2, dots.c, quad n = 0, 1, 2, dots.c
      $
      respectively, obtain solutions for the transverse field distributions for a general transverse-electric mode in the guide.

      #align(center)[
        #figure(
          canvas({
            import draw: *

            // Coordinate axes (left side)
            let ax-o = (-4.2, -0.55)
            let ax-arrow = (mark: (end: "stealth", fill: black, scale: 0.8), stroke: 0.9pt + black)

            // y-axis (up)
            line(ax-o, (ax-o.at(0), ax-o.at(1) + 1.45), ..ax-arrow)
            content((ax-o.at(0), ax-o.at(1) + 1.68), $y$)

            // x-axis (right)
            line(ax-o, (ax-o.at(0) + 1.55, ax-o.at(1)), ..ax-arrow)
            content((ax-o.at(0) + 1.78, ax-o.at(1)), $x$)

            // z-axis (down-left)
            line(ax-o, (ax-o.at(0) - 1.05, ax-o.at(1) - 0.75), ..ax-arrow)
            content((ax-o.at(0) - 1.25, ax-o.at(1) - 0.92), $z$)

            // Rectangular waveguide cross-section (right side)
            let wx0 = -1.6
            let wy0 = -0.8
            let a = 4.6 // inner width
            let b = 2.6 // inner height
            let wall = 0.2 // wall thickness

            // Outer shaded wall
            rect(
              (wx0 - wall, wy0 - wall),
              (wx0 + a + wall, wy0 + b + wall),
              fill: rgb("#dcdde3"),
              stroke: 0.9pt + black,
            )

            // Inner hollow guide opening
            rect(
              (wx0, wy0),
              (wx0 + a, wy0 + b),
              fill: white,
              stroke: 0.9pt + black,
            )

            // Width dimension 'a' below waveguide
            let dim-a-y = wy0 - wall - 0.75
            line((wx0 - wall, wy0 - wall - 0.08), (wx0 - wall, dim-a-y - 0.15), stroke: 0.75pt + black)
            line((wx0 + a + wall, wy0 - wall - 0.08), (wx0 + a + wall, dim-a-y - 0.15), stroke: 0.75pt + black)
            line(
              (wx0 - wall, dim-a-y),
              (wx0 + a + wall, dim-a-y),
              stroke: 0.85pt + black,
              mark: (start: "stealth", end: "stealth", fill: black, scale: 0.8),
            )
            content((wx0 + a / 2, dim-a-y + 0.25), $a$)

            // Height dimension 'b' to the right of waveguide
            let dim-b-x = wx0 + a + wall + 1.05
            line((wx0 + a + wall + 0.08, wy0 + b + wall), (dim-b-x + 0.22, wy0 + b + wall), stroke: 0.75pt + black)
            line((wx0 + a + wall + 0.08, wy0 - wall), (dim-b-x + 0.22, wy0 - wall), stroke: 0.75pt + black)
            line(
              (dim-b-x, wy0 - wall),
              (dim-b-x, wy0 + b + wall),
              stroke: 0.85pt + black,
              mark: (start: "stealth", end: "stealth", fill: black, scale: 0.8),
            )
            content((dim-b-x + 0.35, wy0 + b / 2), $b$)
          }),
          caption: "",
        )<rect-guide>
      ]
    ],
    answer: answer-box()[
      In TE mode, $E_(z) = 0$ hence:
      $
        arrow(H)_(t) & = - frac(gamma, k_(c)^2) nabla_(t) H_(z) \
        arrow(E)_(t) & = frac(j omega mu, k_(c)^2) hat(z) times nabla_(t) H_(z)
      $

      Finding the gradient of $H_(z)$:
      $
        nabla_(t) H_(z) & = hat(x) frac(partial H_(z), partial x) + hat(y) frac(partial H_(z), partial y) \
        & = - hat(x)H_("mn") frac(m pi, a)sin(frac(m pi, a) x) cos(frac(n pi, b)y) - hat(y)H_("mn") frac(n pi, b)cos(frac(m pi, a) x) sin(frac(n pi, b)y)
      $

      Thus:
      $
        arrow(H)_(t) & = hat(x)H_(x) + hat(y)H_(y) \
               H_(x) & = frac(gamma, k_(c)^2)H_("mn") frac(m pi, a)sin(frac(m pi, a) x) cos(frac(n pi, b)y) \
               H_(y) & = frac(gamma, k_(c)^2)H_("mn") frac(n pi, b)cos(frac(m pi, a) x) sin(frac(n pi, b)y) \
        arrow(E)_(t) & = hat(x)E_(x) + hat(y)E_(y) \
               E_(x) & = - frac(j omega mu, k_(c)^2)H_("mn") frac(m pi, a)sin(frac(m pi, a) x) cos(frac(n pi, b)y) \
               E_(y) & = frac(j omega mu, k_(c)^2)H_("mn") frac(n pi, b)cos(frac(m pi, a) x) sin(frac(n pi, b)y) \
      $
    ],
  )

  #sub-question-group(
    lead: [
      The waveguide in @rect-guide is the WR-430 designed for applications in the R band (1.70 - 2.60 GHz) and has the cross-section dimensions given in @rect-guide-dim.
      #align(center)[
        #figure(
          table(
            columns: 2,
            "inner dimension", "outer dimension",
            [$a_i = 109.22 " mm"$], [$a_o = 113.28 " mm"$],
            [$b_i = 54.61 " mm"$], [$b_o = 58.67 " mm"$],
          ),
          caption: "",
        )<rect-guide-dim>
      ]
    ],
    sq => [
      #sq(
        [Determine the cut-off frequencies of the TEM, $"TE"_(10)$, $"TE"_(01)$, and $"TE"_(20)$ modes.],
        answer: answer-box()[
          The expression for cut-off frequencies in a rectangular waveguide is given as:
          $
            f_(c) = frac(c, 2a) sqrt(m^2 + (frac(n a, b))^2)
          $
          The TEM does not propagate in this wave guide.

          For $"TE"_(10)$:
          $
            f_(c) & = frac(3 times 10^(8), 2 times 109.22 times 10^(-3)) \
                  & = #fmt((3e8 / (2 * 109.22e-3)) * 1e-9) "GHz"
          $

          For $"TE"_(01)$:
          $
            f_(c) & = frac(3 times 10^(8), 2 times 109.22 times 10^(-3)) times frac(109.22, 54.61) \
                  & = #fmt((3e8 / (2 * 109.22e-3)) * (109.22 / 54.61) * 1e-9) "GHz"
          $

          For $"TE"_(20)$:
          $
            f_(c) & = frac(3 times 10^(8), 2 times 109.22 times 10^(-3)) times 2 \
                  & = #fmt((3e8 / (2 * 109.22e-3)) * 2 * 1e-9) "GHz"
          $
        ],
      )

      #sq(
        [Obtain the highest frequency theoretically allowable for single-mode operation hence determine the reduction in the usable bandwidth the WR-430 specification presents.],
        answer: answer-box()[
          The highest frequency theoretically allowable in this waveguide for single mode operation is #fmt((3e8 / (2 * 109.22e-3)) * (109.22 / 54.61) * 1e-9) GHz which is the cut-off for the next higher mode above the dominant $"TE"_(10)$ mode.

          The wave guide however operates between 1.70 and 2.60 GHz giving a bandwidth of #fmt(2.60 - 1.70) GHz, the max theoretical bandwidth is #fmt(((3e8 / (2 * 109.22e-3)) * (109.22 / 54.61) - (3e8 / (2 * 109.22e-3))) * 1e-9) GHz the reduction in usable bandwidth is hence:
          $
            "% reduction" &= frac(#fmt(((3e8 / (2 * 109.22e-3)) * (109.22 / 54.61) - (3e8 / (2 * 109.22e-3))) * 1e-9) - #fmt(2.60 - 1.70), #fmt(((3e8 / (2 * 109.22e-3)) * (109.22 / 54.61) - (3e8 / (2 * 109.22e-3))) * 1e-9)) times 100
            &= #fmt((((((3e8 / (2 * 109.22e-3)) * (109.22 / 54.61) - (3e8 / (2 * 109.22e-3))) * 1e-9) - (2.60 - 1.70)) / (((3e8 / (2 * 109.22e-3)) * (109.22 / 54.61) - (3e8 / (2 * 109.22e-3))) * 1e-9)) * 100)\%
          $

        ],
      )

      #sq(
        [Comment on the $"TE"_(01)$ and $"TE"_(20)$ modes in the guide.],
        answer: answer-box()[
          The cut-off frequencies for $"TE"_(01)$ and $"TE"_(20)$ modes are equal due to the aspect ratio of the guide $a_(i) = 2 b_(i)$ which makes the $"TE"_(01)$ and $"TE"_(20)$ modes degenerate modes
        ],
      )
    ],
  )
]

#numed-question(
  lead: [For a $"TE"_1$ mode propagating in a parallel-plate transmission line in the $z$-direction, use the cosine time reference function and],
)[

  #sub-question(
    [Write down the instantaneous field expressions.],
    answer: answer-box()[
      A bit of context we had just found the expressions for a TE mode in a parallel plate wave-guide eg $H_(z)(y) = H_(n)cos(frac(n pi, b)y)$.
      So we start with the expression for $H_(z)(y, z, t)$ as:
      $
        H_(z)(y, z, t) & = Re(H_(z)(y) exp{j(omega t - beta z)}) \
                       & = H_(1) cos(frac(pi, b)y) cos(omega t - beta z)
      $
      We had seen that $arrow(H)_(t)(x, y) = hat(y)H_(y)(y)$ and $arrow(E)_(t)(x, y) = hat(x)E_(x)(y)$ and:
      $
        arrow(H)_(t) & = - frac(gamma, k_(c)^2) nabla_(t)H_(z) \
        arrow(E)_(t) & = frac(j omega mu, k_(c)^2) hat(z) times nabla_(t) H_(z)
      $

      Since $H_(z)$ only varies with $y$:
      $
        nabla_(t)H_(z) & = hat(y) frac(partial H_(z), partial y) \
                       & = - hat(y) pi/b H_(1) sin(pi/b y)
      $

      Thus:
      $
        H_(y) = - frac(gamma, k_(c)^2) frac(partial H_(z), partial y) \
      $

      For lossless media $gamma = j beta$ also $k_(c) = frac(n pi, b)$ in this case $n = 1$ which means $k_(c) = pi/b$:
      $
        H_(y) & = frac(j beta, (frac(pi, b))^2) pi/b H_(1) sin(pi/b y) \
              & = frac(j beta b, pi) H_1 sin(frac(pi, b)y)
      $
      Similarly:
      $
        E_(x) & = - frac(j omega mu, k_(c)^2) frac(partial H_(z), partial y) \
              & = frac(j omega mu b, pi) H_(1) sin(frac(pi, b)y)
      $

      Next:
      $
        H_(y)(y,z,t) & = Re(frac(j beta b, pi) H_1 sin(frac(pi, b)y)exp{j(omega t - beta z)}) \
                     & = Re(frac(beta b, pi) H_1 sin(frac(pi, b)y)j exp{j(omega t - beta z)})
      $
      $Re(j exp(j theta)) = cos(theta + pi/2) = - sin theta$ hence:
      $
        H_(y)(y,z,t) & = -beta frac(b, pi) H_1 sin(frac(pi, b)y) sin(omega t - beta z) \
        E_(x)(y,z,t) & = - omega mu frac(b, pi) H_1 sin(frac(pi, b)y) sin(omega t - beta z)
      $

      Since $arrow(E)_(t) = hat(x)E_(x)(y)$ it is normal to the $y z$ plane everywhere.

      Let's define a tiny step along a magnetic field line as $dif arrow(l) = hat(y) dif y + hat(z) dif z$.
      For this tiny step to be tangent to the magnetic field vector $arrow(H) = hat(y) H_(y) + hat(z) H_(z)$ the ratio of their components must be equal:
      $
        frac(dif y, dif z) = frac(H_(y), H_(z))
      $
    ],
  )

  #sub-question(
    [In a typical $Y$ plane, sketch the field lines.],
    answer: answer-box()[
      At t = 0:
      $
        frac(dif y, dif z) & = frac(H_(y)(y,z,0), H_(z)(y,z,0)) \
                           & = frac(beta frac(b, pi) H_1 sin(frac(pi, b)y) sin(beta z), H_(1) cos(frac(pi, b)y) cos(beta z))
      $

      Separating variables:
      $
        frac(cos(frac(pi, b)y) dif y, frac(b, pi) sin(frac(pi, b)y)) & = frac(beta sin(beta z) dif z, cos (beta z)) \
                    frac(dif (sin(frac(pi, b)y)), sin(frac(pi, b)y)) & = - frac(dif (cos(beta z)), cos (beta z)) \
             ln lr(|sin(frac(pi, b)y)|) = ln|cos(beta z)| + C_("TE")
      $

      #let e-into(pos, radius: 0.14) = {
        import draw: *
        let d = radius * 0.65
        circle(pos, radius: radius, fill: white, stroke: 0.7pt + black)
        line((pos.at(0) - d, pos.at(1) - d), (pos.at(0) + d, pos.at(1) + d), stroke: 0.7pt + black)
        line((pos.at(0) - d, pos.at(1) + d), (pos.at(0) + d, pos.at(1) - d), stroke: 0.7pt + black)
      }

      #let e-out(pos, radius: 0.14) = {
        import draw: *
        circle(pos, radius: radius, fill: white, stroke: 0.7pt + black)
        circle(pos, radius: radius * 0.25, fill: black, stroke: none)
      }
      // Helper: arrowhead at angle t on an ellipse centered (cx, cy), direction = +1 (CCW) or -1 (CW)
      #let ell-arrow(cx, cy, rx, ry, t, dir: 1) = {
        let p = (cx + rx * calc.cos(t), cy + ry * calc.sin(t))
        // tangent for CCW motion: (-rx sin t, ry cos t)
        let d = (
          -dir * rx * calc.sin(t),
          dir * ry * calc.cos(t),
        )
        let n = calc.sqrt(d.at(0) * d.at(0) + d.at(1) * d.at(1))
        let eps = 0.01
        draw.mark(
          p,
          (p.at(0) + eps * d.at(0) / n, p.at(1) + eps * d.at(1) / n),
          symbol: ">",
          fill: black,
          stroke: black,
          scale: 0.8,
        )
      }

      #align(center)[
        #figure(
          canvas({
            import draw: *

            let pi-x = 5.0
            let y-top = 3.4
            let z-max = 2.5 * pi-x // 5.0
            let rx = (pi-x / 2) - 0.15
            let ry = y-top / 4
            let cy = y-top / 2

            // Top plate (y/b = 1)
            line((0, y-top), (pi-x + 5.3, y-top), stroke: 0.9pt + black)

            // Vertical dashed reference lines at pi/2, pi, 3pi/2
            for x in (0.5 * pi-x, pi-x, 1.5 * pi-x) {
              line((x, 0), (x, y-top), stroke: (paint: black, thickness: 0.6pt, dash: "dashed"))
            }

            // Horizontal axis (beta z) and vertical axis (y/b)
            line((0, 0), (pi-x + 5.5, 0), stroke: 0.9pt + black, mark: (end: "stealth", fill: black))
            line((0, 0.), (0, y-top + 0.45), stroke: 0.9pt + black, mark: (end: "stealth", fill: black))

            // Axis ticks and labels
            line((-0.07, y-top), (0.07, y-top), stroke: 0.8pt + black)
            content((-0.25, y-top), [$1$])
            content((-0.25, 0.05), [$0$])
            content((0, y-top + 0.68), [$y/b$])
            content((pi-x + 5.72, 0), [$beta z$])

            for (x, lbl) in (
              (0.5 * pi-x, [$pi / 2$]),
              (pi-x, [$pi$]),
              (1.5 * pi-x, [$(3 pi) / 2$]),
            ) {
              line((x, -0.07), (x, 0.07), stroke: 0.8pt + black)
              content((x, -0.35), lbl)
            }

            // Origin marker ("x" label near bottom-left)
            e-into((0, 0), radius: 0.15)
            content((-0.18, -0.28), [x])

            // Left half-ellipse (center (0, cy), drawn 90deg -> -90deg, i.e. clockwise)
            arc(
              (0, cy + ry),
              start: 90deg,
              stop: -90deg,
              radius: (rx, ry),
              stroke: (paint: black, thickness: 0.85pt, dash: "dashed"),
            )
            ell-arrow(0, cy, rx, ry, 50deg)

            // Central ellipse centered at beta*z = pi (plain circle, no marks)
            circle(
              (pi-x, cy),
              radius: (rx, ry),
              stroke: (paint: black, thickness: 0.85pt, dash: "dashed"),
            )
            ell-arrow(pi-x, cy, rx, ry, 90deg) // top, pointing left (CCW)
            ell-arrow(pi-x, cy, rx, ry, 270deg) // bottom, pointing right (CCW)

            // Right half-ellipse (center (2*pi - x, cy), drawn 270deg -> 90deg, CCW)
            arc(
              (2 * pi-x, ry),
              start: 270deg,
              stop: 90deg,
              radius: (rx, ry),
              stroke: (paint: black, thickness: 0.85pt, dash: "dashed"),
            )
            ell-arrow(2 * pi-x, cy, rx, ry, 120deg)

            // Cross cluster around beta*z = pi/2
            let cx1 = 0.5 * pi-x
            for pt in ((cx1, cy), (cx1 - 0.32, cy), (cx1 + 0.32, cy), (cx1, cy + 0.34), (cx1, cy - 0.34)) {
              e-into(pt)
            }

            // Dot cluster around beta*z = 3pi/2
            let cx2 = 1.5 * pi-x
            for pt in ((cx2, cy), (cx2 - 0.32, cy), (cx2 + 0.32, cy), (cx2, cy + 0.34), (cx2, cy - 0.34)) {
              e-out(pt)
            }
          }),
        )
      ]
    ],
  )
]


= DeepSeek
// #numed-question()[
//   #sub-question(
//     [],
//     answer: answer-box()[
//
//       #text(weight: "bold")[Part (iii): Attenuation Constant for $"TM"_n$ Modes]
//
//       The attenuation constant $alpha_c$ due to conductor loss is given by $alpha_c = frac(P_L, 2P)$, where $P_L$ is the power lost per unit length in the plates, and $P$ is the total power flowing down the guide.
//
//       Using the fields from Part (i), the time-averaged power flow is:
//       $
//         P = frac(1, 2) "Re" integral_0^b integral_0^W (-E_y H_x^*) dif x dif y = frac(W beta omega epsilon, 2 k_c^2) B^2 integral_0^b cos^2(k_c y) dif y = frac(W beta omega epsilon b, 4 k_c^2) B^2
//       $
//       The power lost per unit length in both plates (each with surface resistance $R_s = sqrt(omega mu_0 / (2 sigma))$) is:
//       $
//         P_L = R_s integral_0^W |J_s(y=0)|^2 dif x + R_s integral_0^W |J_s(y=b)|^2 dif x
//       $
//       Since $|J_s|^2 = (frac(omega epsilon, k_c) B)^2$ on both plates:
//       $
//         P_L = 2 R_s W (frac(omega epsilon, k_c) B)^2
//       $
//       Substituting into $alpha_c = frac(P_L, 2P)$:
//       $
//         alpha_c &= frac(2 R_s W frac(omega^2 epsilon^2, k_c^2) B^2, 2 frac(W beta omega epsilon b, 4 k_c^2) B^2) = frac(2 R_s omega^2 epsilon^2, 2 beta omega epsilon b / 4) = frac(4 R_s omega epsilon, beta b)
//       $
//       Multiply numerator and denominator by $eta = sqrt(mu/epsilon)$:
//       $
//         alpha_c = frac(4 R_s, b eta) frac(omega sqrt(mu epsilon), beta) = frac(4 R_s, b eta) frac(k, beta) = frac(4 R_s, b eta) frac(1, sqrt(1 - (f_c/f)^2))}
//       $
//       *(Note: A factor of 2 can appear depending on whether the top plate is counted differently, but the functional dependence is what matters).*
//
//       As a function of $f/f_{"cn"}$, let $x = f/f_{"cn"}$:
//       $
//         alpha_c(x) = frac(4 R_s, b eta) frac(1, sqrt(1 - 1/x^2)) = frac(4 R_s, b eta) frac(x, sqrt(x^2 - 1))
//       $
//       To find the minimum, we take the derivative with respect to $x$ and set it to zero. The function $frac(x, sqrt(x^2-1))$ is monotonically decreasing for $x > 1$. Therefore, the attenuation constant does not have a finite minimum; it approaches zero as $x arrow.r.double infinity$ (i.e., $f arrow.r.double infinity$).
//
//       (Exam Note: If the question intended to ask for TE modes, the attenuation function is $alpha_c prop frac(1, x^2 sqrt(1 - 1/x^2))$. Differentiating this yields a minimum exactly at $f/f_{"cn"} = sqrt(3) tilde.op 1.732$. Since the question explicitly states TM modes, the theoretical minimum is at $f/f_{"cn"} arrow.r.double infinity$)
//     ],
//   )
// ]

#numed-question()[
  #sub-question(
    [
      Determine the current and charge on the plates of a parallel plate transmission line assuming perfectly conducting plates for a general $"TM"_n$ and $"TE"_n$ modes.
    ],
    answer: answer-box()[
      *Boundary conditions for perfect conducting plates:*
      - Bottom plate ($y = 0$): Outward unit normal into the guide is $hat(n) = +hat(y)$
      - Top plate ($y = b$): Outward unit normal into the guide is $hat(n) = -hat(y)$
      - Surface charge density: $rho_s = hat(n) dot arrow(D) = epsilon (hat(n) dot arrow(E))$
      - Surface current density: $arrow(J)_s = hat(n) times arrow(H)$

      #text(weight: "bold")[A. For general $"TM"_n$ modes:]
      $
        E_z (y, z, t) & = E_n sin(frac(n pi, b) y) cos(omega t - beta z) \
        E_y (y, z, t) & = beta frac(b, n pi) E_n cos(frac(n pi, b) y) sin(omega t - beta z) \
        H_x (y, z, t) & = -omega epsilon frac(b, n pi) E_n cos(frac(n pi, b) y) sin(omega t - beta z) \
                  E_x & = H_y = H_z = 0
      $
      Surface charge density:
      $
        rho_s (0, z, t) = +epsilon E_y (0, z, t)
      $
      Bottom plate:
      $
        rho_s (0, z, t) = beta epsilon frac(b, n pi) E_n sin(omega t - beta z)
      $
      $
        rho_s (b, z, t) = -epsilon E_y (b, z, t)
      $
      Top plate:
      $
        rho_s (b, z, t) & = (-1)^(n + 1) beta epsilon frac(b, n pi) E_n sin(omega t - beta z) \
                        & = (-1)^(n + 1) rho_s (0, z, t)
      $
      Surface current density ($arrow(J)_s = hat(n) times arrow(H)$):
      Bottom plate:
      $
        arrow(J)_s(0, z, t) & = (+hat(y)) times (hat(x) H_x(0, z, t)) \
                            & = -hat(z) H_x(0, z, t) \
                            & = hat(z) omega epsilon frac(b, n pi) E_n sin(omega t - beta z)
      $
      Top plate:
      $
        arrow(J)_s(b, z, t) & = (-hat(y)) times (hat(x) H_x(b, z, t)) \
                            & = hat(z) H_x(b, z, t) \
                            & = hat(z) (-1)^(n+1) omega epsilon frac(b, n pi) E_n sin(omega t - beta z) \
                            & = (-1)^(n+1) arrow(J)_s(0, z, t)
      $
      Axial current for a plate of width $w$ along \(x\):
      $
        I_z(y=0) & = w J_(s z)(0, z, t) \
                 & = w omega epsilon frac(b, n pi) E_n sin(omega t - beta z)
      $
      $
        I_z(y=b) & = w J_(s z)(b, z, t) \
                 & = (-1)^(n+1) w omega epsilon frac(b, n pi) E_n sin(omega t - beta z) \
                 & = (-1)^(n+1) I_z(y=0)
      $

      #text(weight: "bold")[B. For general $"TE"_n$ modes:]
      $
        H_z(y, z, t) & = H_n cos(frac(n pi, b) y) cos(omega t - beta z) \
        H_y(y, z, t) & = -beta frac(b, n pi) H_n sin(frac(n pi, b) y) sin(omega t - beta z) \
        E_x(y, z, t) & = -omega mu frac(b, n pi) H_n sin(frac(n pi, b) y) sin(omega t - beta z)
      $
      $
        H_x = E_y = E_z = 0
      $
      Surface charge density:
      Since $E_y = 0$ everywhere inside the guide for all $"TE"_n$ modes, the electric field everywhere is purely parallel to the plates:
      $
        rho_s(0, z, t) & = 0 \
        rho_s(b, z, t) & = 0
      $
      Thus zero surface charge on either plate for all $"TE"_n$ modes.

      Surface current density:
      At the plate surfaces, \(H_y = 0\) since $sin(frac(n pi, b) y) = 0$. Thus only \(H_z\) produces surface current.
      $
        arrow(J)_s(0, z, t) & = (+hat(y)) times (hat(z) H_z(0, z, t)) \
                            & = hat(x) H_z(0, z, t) \
                            & = hat(x) H_n cos(omega t - beta z)
      $
      $
        arrow(J)_s(b, z, t) & = (-hat(y)) times (hat(z) H_z(b, z, t)) \
                            & = -hat(x) H_z(b, z, t) \
                            & = -hat(x) H_n cos(n pi) cos(omega t - beta z) \
                            & = hat(x) (-1)^(n+1) H_n cos(omega t - beta z) \
                            & = (-1)^(n+1) arrow(J)_s(0, z, t)
      $
      Axial current:
      Since the surface current for $"TE"_n$ modes flows purely transversely ($hat(x)$) across the width of the plates:
      $
        I_z = arrow(J)_s dot hat(z) = 0
      $
      Thus no axial current flows down the guide for any $"TE"_n$ mode.
    ],
  )

  #sub-question(
    [
      Write down the instantaneous field expressions for the $"TM"_(11)$ mode propagating in the $+z$-direction in a hollow rectangular-section waveguide with inner dimensions $a times b$, $a gt b$. Hence sketch the field lines in typical $x y$- and $y z$-planes in the guide.
    ],
    answer: answer-box()[
      For the cutoff parameters and propagation constant:
      $
        k_c = frac(2 pi, lambda_c) = sqrt((frac(pi, a))^2 + (frac(pi, b))^2) = frac(pi, a) sqrt(1 + (frac(a, b))^2)
      $
      $
        beta = sqrt(omega^2 mu epsilon - k_c^2) = sqrt(omega^2 mu epsilon - [(frac(pi, a))^2 + (frac(pi, b))^2])
      $
      $
        f_(c, 11) = frac(c, 2 a) sqrt(1 + (frac(a, b))^2)
      $
      Using a cosine time reference function ($cal(R)[dots dot exp(j(omega t - beta z))]$), the instantaneous field expressions are:
      $
        E_z (x, y, z, t) &= E_(11) sin(frac(pi, a) x) sin(frac(pi, b) y) cos(omega t - beta z) \
        E_x (x, y, z, t) &= frac(beta, k_c^2) (frac(pi, a)) E_(11) cos(frac(pi, a) x) sin(frac(pi, b) y) sin(omega t - beta z) \
        E_y (x, y, z, t) &= frac(beta, k_c^2) (frac(pi, b)) E_(11) sin(frac(pi, a) x) cos(frac(pi, b) y) sin(omega t - beta z) \
        H_x (x, y, z, t) &= -frac(omega epsilon, k_c^2) (frac(pi, b)) E_(11) sin(frac(pi, a) x) cos(frac(pi, b) y) sin(omega t - beta z) \
        H_y (x, y, z, t) &= frac(omega epsilon, k_c^2) (frac(pi, a)) E_(11) cos(frac(pi, a) x) sin(frac(pi, b) y) sin(omega t - beta z) \
        H_z &= 0
      $
      In a typical $x y$-plane:
      $
        (frac(dif y, dif x))_E = frac(E_y, E_x) = frac((frac(pi, b)) sin(frac(pi, a) x) cos(frac(pi, b) y), (frac(pi, a)) cos(frac(pi, a) x) sin(frac(pi, b) y)) = (frac(a, b)) tan(frac(pi, a) x) cot(frac(pi, b) y)
      $
      $
        (frac(dif y, dif x))_H = frac(H_y, H_x) = -frac((frac(pi, a)) cos(frac(pi, a) x) sin(frac(pi, b) y), (frac(pi, b)) sin(frac(pi, a) x) cos(frac(pi, b) y)) = -(frac(b, a)) cot(frac(pi, a) x) tan(frac(pi, b) y)
      $
      $
        therefore (frac(dif y, dif x))_E (frac(dif y, dif x))_H = -1 arrow.double "They are orthogonal everywhere"
      $
      #figure(
        rect(width: 10cm, height: 4cm)[Placeholder for TM11 field lines sketch],
        caption: [Field lines in a typical xy-plane],
      )

      Now:
      $
        (frac(dif y, dif x))_E = frac((frac(pi, b)) sin(frac(pi, a) x) cos(frac(pi, b) y), (frac(pi, a)) cos(frac(pi, a) x) sin(frac(pi, b) y))
      $
      $
        frac(sin(frac(pi, b) y) dif y, frac(pi, b) cos(frac(pi, b) y)) = frac(sin(frac(pi, a) x) dif x, frac(pi, a) cos(frac(pi, a) x))
      $
      $
        -frac(dif (cos(frac(pi, b) y)), (frac(pi, b))^2 cos(frac(pi, b) y)) = -frac(dif (cos(frac(pi, a) x)), (frac(pi, a))^2 cos(frac(pi, a) x))
      $
      Integrating:
      $
        b^2 ln(cos(frac(pi, b) y)) - a^2 ln(cos(frac(pi, a) x)) = C_1
      $
      Likewise:
      $
        (frac(dif y, dif x))_H = -frac((frac(pi, a)) cos(frac(pi, a) x) sin(frac(pi, b) y), (frac(pi, b)) sin(frac(pi, a) x) cos(frac(pi, b) y))
      $
      $
        frac(frac(pi, b) cos(frac(pi, b) y) dif y, sin(frac(pi, b) y)) = -frac(frac(pi, a) cos(frac(pi, a) x) dif x, sin(frac(pi, a) x))
      $
      $
        frac(dif (sin(frac(pi, b) y)), sin(frac(pi, b) y)) = -frac(dif (sin(frac(pi, a) x)), sin(frac(pi, a) x))
      $
      $
        ln(sin(frac(pi, b) y)) = -ln(sin(frac(pi, a) x)) + C_2
      $
      $
        therefore sin(frac(pi, a) x) sin(frac(pi, b) y) = C_2
      $
    ],
  )
]

#heading(level: 2)[1. General Boundary Conditions]
Maxwell's equations at an interface between two media (Medium 1 and Medium 2) are governed by four boundary conditions. Let $hat(n)$ be the unit normal vector pointing from Medium 1 into Medium 2.

*Normal Components:*
$
  hat(n) dot (arrow(D)_2 - arrow(D)_1) & = rho_s quad "// Normal electric flux (Gauss's Law)" \
  hat(n) dot (arrow(B)_2 - arrow(B)_1) & = 0 quad "// Normal magnetic flux (Gauss's Law for Magnetism)"
$

*Tangential Components:*
$
  hat(n) times (arrow(E)_2 - arrow(E)_1) & = 0 quad "// Tangential electric field (Faraday's Law)" \
  hat(n) times (arrow(H)_2 - arrow(H)_1) & = arrow(J)_s quad "// Tangential magnetic field (Ampere's Law)"
$

#heading(level: 2)[2. Material Permutations]

#heading(level: 3)[A. Dielectric to Dielectric (Lossless)]
At a simple dielectric boundary, there are no free electrons to carry surface currents or accumulate surface charge. Therefore, $rho_s = 0$ and $arrow(J)_s = 0$.
$
         D_(1 n) & = D_(2 n) quad "// Normal " arrow(D) " is continuous" \
         B_(1 n) & = B_(2 n) quad "// Normal " arrow(B) " is continuous" \
  arrow(E)_(1 t) & = arrow(E)_(2 t) quad "// Tangential " arrow(E) " is continuous" \
  arrow(H)_(1 t) & = arrow(H)_(2 t) quad "// Tangential " arrow(H) " is continuous"
$

#heading(level: 3)[B. Dielectric to Perfect Electric Conductor ("PEC")]
Inside a "PEC", the fields are zero ($arrow(E) = 0$, $arrow(H) = 0$). The boundary conditions become:
$
    hat(n) dot arrow(D) & = rho_s quad "// Normal " arrow(D) " terminates on surface charge" \
    hat(n) dot arrow(B) & = 0 quad "// Normal " arrow(B) " is zero at the surface" \
  hat(n) times arrow(E) & = 0 quad "// Tangential " arrow(E) " must vanish" \
  hat(n) times arrow(H) & = arrow(J)_s quad "// Tangential " arrow(H) " induces surface current"
$

#heading(level: 3)[C. Dielectric to Perfect Magnetic Conductor ("PMC")]
Inside a "PMC", the magnetic fields are zero ($arrow(H) = 0$), but electric fields can exist. This is a theoretical/hypothetical material used in symmetry problems.
$
    hat(n) dot arrow(D) & = 0 quad "// Normal " arrow(D) " is zero at the surface" \
    hat(n) dot arrow(B) & = rho_(m s) quad "// Normal " arrow(B) " terminates on magnetic charge" \
  hat(n) times arrow(E) & = arrow(M)_s quad "// Tangential " arrow(E) " induces magnetic current" \
  hat(n) times arrow(H) & = 0 quad "// Tangential " arrow(H) " must vanish"
$

#heading(level: 2)[3. Polarization Permutations (Oblique Incidence)]

When a plane wave hits an interface at an angle $theta_i$, the boundary conditions must hold for all points along the interface. This leads to Snell's Law ($theta_i = theta_r$) and splits the problem into two orthogonal polarizations.

#heading(level: 3)[A. Perpendicular Polarization ("TE" Mode)]
*Definition:* The electric field is perpendicular to the plane of incidence (parallel to the interface).
*Fields:* $arrow(E)$ is purely tangential. $arrow(H)$ has both normal and tangential components.
*Boundary Conditions (Dielectric-Dielectric):*
$
                          E_(i) + E_(r) & = E_(t) quad "// Tangential " arrow(E) " is continuous" \
  H_(i) cos theta_i - H_(r) cos theta_r & = H_(t) cos theta_t quad "// Tangential " arrow(H) " is continuous"
$
*Key Result:* The reflection coefficient is:
$
  Gamma_("TE") = frac(n_1 cos theta_i - n_2 cos theta_t, n_1 cos theta_i + n_2 cos theta_t)
$

#heading(level: 3)[B. Parallel Polarization ("TM" Mode)]
*Definition:* The magnetic field is perpendicular to the plane of incidence (parallel to the interface).
*Fields:* $arrow(H)$ is purely tangential. $arrow(E)$ has both normal and tangential components.
*Boundary Conditions (Dielectric-Dielectric):*
$
                          H_(i) + H_(r) & = H_(t) quad "// Tangential " arrow(H) " is continuous" \
  E_(i) cos theta_i - E_(r) cos theta_r & = E_(t) cos theta_t quad "// Tangential " arrow(E) " is continuous"
$
*Key Result:* The reflection coefficient is:
$
  Gamma_("TM") = frac(n_2 cos theta_i - n_1 cos theta_t, n_2 cos theta_i + n_1 cos theta_t)
$

#heading(level: 3)[C. Normal Incidence]
*Definition:* The wave hits the interface straight on ($theta_i = 0$).
*Permutation:* At normal incidence, there is no distinction between "TE" and "TM" polarization because the plane of incidence is undefined. Both polarizations yield the exact same boundary conditions and reflection coefficients.
$
  Gamma = frac(eta_2 - eta_1, eta_2 + eta_1)
$

#heading(level: 2)[4. Waveguide Boundary Conditions]
When applying boundary conditions to waveguides, we use the specific tangential and normal components defined by the guide's walls (usually "PEC").

#heading(level: 3)[A. Transverse Electric ("TE") Modes]
*Definition:* $E_z = 0$. The electric field is entirely transverse to the direction of propagation.
*Boundary Conditions at the "PEC" walls:*
1. The tangential electric field must be zero. Since $E_z = 0$, we require $arrow(E)_t = 0$ at the walls.
2. This is equivalent to requiring the normal derivative of the axial magnetic field to be zero:
$
  frac(partial H_z, partial n) = 0 quad "at the walls"
$

#heading(level: 3)[B. Transverse Magnetic ("TM") Modes]
*Definition:* $H_z = 0$. The magnetic field is entirely transverse to the direction of propagation.
*Boundary Conditions at the "PEC" walls:*
1. The tangential electric field is zero. Since the tangential component of $arrow(E)$ is derived from $E_z$, we must have:
$
  E_z = 0 quad "at the walls"
$
2. (For the transverse fields to not blow up, this automatically forces the boundary conditions on $H_t$).
