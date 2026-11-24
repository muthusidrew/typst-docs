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
          Based on the figure, the slab extends along the $y$-axis from $y = -h/2$ to $y = h/2$. Since the slab is infinite in the $x$-direction, $frac(partial, partial x) = 0$, so $nabla_t^2 = frac(partial^2, partial y^2)$.

          The transverse wavenumber is:
          $
            k_c^2 = cases(
              k_y^2 = gamma^2 + k^2 = k^2 - beta^2 & ", " |y| lt.eq h/2 " (dielectric)",
              -alpha^2 = gamma^2 + k_0^2 = k_0^2 - beta^2 & ", " |y| gt.eq h/2 " (air)"
            )
          $
          For odd TE modes, $H_z$ must be an odd function of $y$. Thus, in the core:
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
          The transverse electric field is $arrow(E)_t = frac(j omega mu, k_c^2) hat(z) times nabla_t H_z$. With $nabla_t = hat(y) frac(partial, partial y)$:
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
          )[Note on the exam paper's typo: The condition $k_y h lt.double 1$ cannot apply to odd modes. Odd modes have a cutoff at $k_y h = pi$. The small-angle approximation actually applies to the fundamental even mode (where $H_z$ is a cosine). Furthermore, the negative sign in the exam paper's $alpha$ expression is a typo; $alpha$ must be positive for the field to decay. Below, I show the derivation for the expected approximations.]

          For the lowest-order even TE mode, the fields in the core ($|y| lt.eq h/2$) are:
          $
            H_z = A cos(k_y y), quad E_x = frac(j omega mu, k_y) A sin(k_y y)
          $
          In the air ($y gt.eq h/2$):
          $
            H_z = B exp{-alpha (y - h/2)}, quad E_x = -frac(j omega mu, alpha) B exp{-alpha (y - h/2)}
          $
          Matching boundary conditions at $y = h/2$ gives the eigenvalue equation:
          $
            k_y tan(k_y h/2) = alpha
          $
          For $k_y h lt.double 1$, we use the small-angle approximation $tan(x) tilde.op x$:
          $
            alpha tilde.op k_y (frac(k_y h, 2)) = frac(h, 2) k_y^2
          $
          From the dispersion relation $k_y^2 = k^2 - k_0^2 - alpha^2$, since the slab is thin, the field decays slowly ($alpha$ is very small), so $alpha^2$ is negligible compared to $k^2 - k_0^2$. Thus:
          $
            k_y^2 tilde.op k^2 - k_0^2
          $
          Substituting this back yields:
          $
            alpha tilde.op frac(h, 2) (k^2 - k_0^2)
          $
          Since $alpha$ is very small, the propagation constant is:
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
          Calculate the decay constant $alpha$:
          $
            alpha & = frac(h, 2)(k^2 - k_0^2) \
                  & = frac(5 times 10^(-3), 2) ((2 pi sqrt(3))^2 - (2 pi)^2) \
                  & = 0.0025 (12 pi^2 - 4 pi^2) \
                  & = 0.0025 (8 pi^2) = 0.02 pi^2 " Np/m" tilde.op 0.1974 " Np/m"
          $
          The field intensity decays as $exp(-alpha d)$. We want the distance $d$ where it decays to $37%$, which is $1/e$:
          $
            exp(-alpha d) = exp(-1) arrow.double d = frac(1, alpha) = frac(1, 0.1974) tilde.op 5.07 " m"
          $
          The field intensities will have decayed to $tilde.op 37%$ of their surface values at a distance of approximately $5.07 " m"$ from the slab surface.
        ],
      )
    ],
  )
]

#numed-question()[
  #sub-question(
    [
      The parallel-plate waveguide shown in Fig. Q2(b) is made from 50 $mu$m thick copper plates separated by a lossless nonmagnetic simple dielectric. If the plate width W much larger than the plate separation b, (16 marks)

      #align(center)[
        #canvas({
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
        })
      ]
      (i) State the conditions the plates must have in order that electric wall boundary conditions may be assumed for the plate surfaces hence, derive expressions for the field distributions in the transverse plane in the guide. \
      (ii) Derive expressions for the charge and current distributions in the plates under these conditions. \
      (iii) Obtain an expression for the attenuation constant for propagating $"TM"_n$ modes in the guide as a function of the ratio $f/f_{"cn"}$, where $f$ is the operating frequency and $f_{"cn"}$ the cut-off frequency, hence determine the value of $f/f_{"cn"}$ for which the attenuation constant is minimum.
    ],
    answer: answer-box()[
      #text(weight: "bold")[Part (i): Conditions and Field Distributions]

      *Conditions for electric wall boundary conditions:*
      1. The plates must be perfect electric conductors (PEC), meaning their conductivity is infinite (or very high, like copper). This forces the tangential electric field to be zero at the surfaces.
      2. The plate width $W$ must be much larger than the separation $b$ ($W lt.double$). This ensures that fringing fields at the edges can be neglected, reducing the problem to a 1D variation in the $y$-direction.

      Let the plates be at $y = 0$ and $y = b$, with the wave propagating in the $+z$ direction. For a TM mode, $H_z = 0$ and $E_z$ satisfies the Helmholtz equation:
      $
        nabla_t^2 E_z + k_c^2 E_z = 0
      $
      Since $W lt.double b$, there is no variation in the $x$-direction, so $nabla_t^2 = frac(partial^2, partial y^2)$. The general solution is:
      $
        E_z(y) = A cos(k_c y) + B sin(k_c y)
      $
      The boundary conditions at the perfect conductors are that the tangential electric field must be zero. The tangential components are $E_x$ and $E_z$.
      *   At $y=0$: $E_z(0) = 0 arrow.double A = 0$.
      *   At $y=b$: $E_z(b) = B sin(k_c b) = 0 arrow.double k_c b = n pi$, where $n = 1, 2, 3, dots$

      Thus, $k_c = frac(n pi, b)$ and:
      $
        E_z(y) = B sin(frac(n pi y, b))
      $
      The transverse fields are found from Maxwell's equations:
      $
        arrow(E)_t &= -frac(gamma, k_c^2) nabla_t E_z = -hat(y) frac(gamma, k_c^2) B k_c cos(k_c y) = -hat(y) frac(gamma, k_c) B cos(k_c y) \
        arrow(H)_t &= frac(j omega epsilon, k_c^2) hat(z) times nabla_t E_z = hat(x) frac(j omega epsilon, k_c^2) B k_c cos(k_c y) = hat(x) frac(j omega epsilon, k_c) B cos(k_c y)
      $

      #text(weight: "bold")[Part (ii): Charge and Current Distributions]

      Surface current $arrow(J)_s$ and surface charge $rho_s$ on the perfect conductors are given by boundary conditions:
      $
        arrow(J)_s & = hat(n) times arrow(H)_("tan") \
             rho_s & = hat(n) dot arrow(D)_("normal") = hat(n) dot (epsilon arrow(E))
      $
      *On the bottom plate ($y=0$):*
      The normal into the dielectric is $hat(n) = hat(y)$. The fields are $arrow(H) = hat(x) H_x(0)$ and $arrow(E) = hat(y) E_y(0)$.
      $
        arrow(J)_s & = hat(y) times hat(x) H_x(0) = -hat(z) frac(j omega epsilon, k_c) B \
             rho_s & = hat(y) dot (hat(y) epsilon E_y(0)) = epsilon (-frac(gamma, k_c) B) = -frac(epsilon gamma, k_c) B
      $
      *On the top plate ($y=b$):*
      The normal into the dielectric is $hat(n) = -hat(y)$. The fields are $H_x(b) = frac(j omega epsilon, k_c) B cos(n pi) = frac(j omega epsilon, k_c) B (-1)^n$ and $E_y(b) = -frac(gamma, k_c) B (-1)^n$.
      $
        arrow(J)_s &= -hat(y) times hat(x) H_x(b) = hat(z) frac(j omega epsilon, k_c) B (-1)^n \
        rho_s &= -hat(y) dot (hat(y) epsilon E_y(b)) = -epsilon (-frac(gamma, k_c) B (-1)^n) = frac(epsilon gamma, k_c) B (-1)^n
      $

      #text(weight: "bold")[Part (iii): Attenuation Constant for $"TM"_n$ Modes]

      The attenuation constant $alpha_c$ due to conductor loss is given by $alpha_c = frac(P_L, 2P)$, where $P_L$ is the power lost per unit length in the plates, and $P$ is the total power flowing down the guide.

      Using the fields from Part (i), the time-averaged power flow is:
      $
        P = frac(1, 2) "Re" integral_0^b integral_0^W (-E_y H_x^*) dif x dif y = frac(W beta omega epsilon, 2 k_c^2) B^2 integral_0^b cos^2(k_c y) dif y = frac(W beta omega epsilon b, 4 k_c^2) B^2
      $
      The power lost per unit length in both plates (each with surface resistance $R_s = sqrt(omega mu_0 / (2 sigma))$) is:
      $
        P_L = R_s integral_0^W |J_s(y=0)|^2 dif x + R_s integral_0^W |J_s(y=b)|^2 dif x
      $
      Since $|J_s|^2 = (frac(omega epsilon, k_c) B)^2$ on both plates:
      $
        P_L = 2 R_s W (frac(omega epsilon, k_c) B)^2
      $
      Substituting into $alpha_c = frac(P_L, 2P)$:
      $
        alpha_c &= frac(2 R_s W frac(omega^2 epsilon^2, k_c^2) B^2, 2 frac(W beta omega epsilon b, 4 k_c^2) B^2) = frac(2 R_s omega^2 epsilon^2, 2 beta omega epsilon b / 4) = frac(4 R_s omega epsilon, beta b)
      $
      Multiply numerator and denominator by $eta = sqrt(mu/epsilon)$:
      $
        alpha_c = frac(4 R_s, b eta) frac(omega sqrt(mu epsilon), beta) = frac(4 R_s, b eta) frac(k, beta) = frac(4 R_s, b eta) frac(1, sqrt(1 - (f_c/f)^2))}
      $
      *(Note: A factor of 2 can appear depending on whether the top plate is counted differently, but the functional dependence is what matters).*

      As a function of $f/f_{"cn"}$, let $x = f/f_{"cn"}$:
      $
        alpha_c(x) = frac(4 R_s, b eta) frac(1, sqrt(1 - 1/x^2)) = frac(4 R_s, b eta) frac(x, sqrt(x^2 - 1))
      $
      To find the minimum, we take the derivative with respect to $x$ and set it to zero. The function $frac(x, sqrt(x^2-1))$ is monotonically decreasing for $x > 1$. Therefore, the attenuation constant does not have a finite minimum; it approaches zero as $x arrow.r.double infinity$ (i.e., $f arrow.r.double infinity$).

      (Exam Note: If the question intended to ask for TE modes, the attenuation function is $alpha_c prop frac(1, x^2 sqrt(1 - 1/x^2))$. Differentiating this yields a minimum exactly at $f/f_{"cn"} = sqrt(3) tilde.op 1.732$. Since the question explicitly states TM modes, the theoretical minimum is at $f/f_{"cn"} arrow.r.double infinity$)
    ],
  )
]

#numed-question()[
  #sub-question(
    [
      (b) An electromagnetic wave is propagating through an air-filled rectangular waveguide with perfectly conducting walls and the cross-section shown in Fig. Q3(b). Given that the axial electric and magnetic field intensity distributions in the guide may be expressed as
      $
        E_z & = E_(m n) sin(frac(m pi, a) x) sin(frac(n pi, b) y), quad m = 1, 2, 3, dots.c, quad n = 1, 2, 3, dots.c \
        H_z & = H_(m n) cos(frac(m pi, a) x) cos(frac(n pi, b) y), quad m = 0, 1, 2, dots.c, quad n = 0, 1, 2, dots.c
      $
      respectively, obtain solutions for the transverse field distributions for a general transverse-electric mode in the guide. (9 marks)
    ],
    answer: answer-box()[
      For a general Transverse Electric ("TE") mode, the axial electric field is zero by definition, so $E_z = 0$.
      The given axial magnetic field is:
      $
        H_z = H_(m n) cos(frac(m pi, a) x) cos(frac(n pi, b) y)
      $
      The transverse field components are related to the axial components by:
      $
        arrow(E)_t & = frac(j omega mu, k_c^2) hat(z) times nabla_t H_z \
        arrow(H)_t & = -frac(gamma, k_c^2) nabla_t H_z
      $
      where $gamma$ is the propagation constant and $k_c^2 = (frac(m pi, a))^2 + (frac(n pi, b))^2$.

      First, calculate the transverse gradient of $H_z$:
      $
        nabla_t H_z &= hat(x) frac(partial H_z, partial x) + hat(y) frac(partial H_z, partial y) \
        &= hat(x) (-H_(m n) frac(m pi, a) sin(frac(m pi, a) x) cos(frac(n pi, b) y)) + hat(y) (-H_(m n) frac(n pi, b) cos(frac(m pi, a) x) sin(frac(n pi, b) y))
      $

      Now, substitute into the $arrow(E)_t$ equation:
      $
        arrow(E)_t &= frac(j omega mu, k_c^2) hat(z) times (hat(x) frac(partial H_z, partial x) + hat(y) frac(partial H_z, partial y)) \
        &= frac(j omega mu, k_c^2) (hat(y) frac(partial H_z, partial x) - hat(x) frac(partial H_z, partial y))
      $
      Thus, the transverse electric field components are:
      $
        E_x &= -frac(j omega mu, k_c^2) frac(partial H_z, partial y) = frac(j omega mu n pi, k_c^2 b) H_(m n) cos(frac(m pi, a) x) sin(frac(n pi, b) y) \
        E_y &= frac(j omega mu, k_c^2) frac(partial H_z, partial x) = -frac(j omega mu m pi, k_c^2 a) H_(m n) sin(frac(m pi, a) x) cos(frac(n pi, b) y)
      $

      Similarly, for the transverse magnetic field:
      $
        arrow(H)_t = -frac(gamma, k_c^2) nabla_t H_z = -frac(gamma, k_c^2) (hat(x) frac(partial H_z, partial x) + hat(y) frac(partial H_z, partial y))
      $
      Thus, the transverse magnetic field components are:
      $
        H_x &= -frac(gamma, k_c^2) frac(partial H_z, partial x) = frac(gamma m pi, k_c^2 a) H_(m n) sin(frac(m pi, a) x) cos(frac(n pi, b) y) \
        H_y &= -frac(gamma, k_c^2) frac(partial H_z, partial y) = frac(gamma n pi, k_c^2 b) H_(m n) cos(frac(m pi, a) x) sin(frac(n pi, b) y)
      $
    ],
  )

  #sub-question(
    [
      (c) The waveguide in Fig. Q3(b) is the "WR-430" designed for applications in the "R band" (1.70 - 2.60 GHz) and has the cross-section dimensions given in Table 3(c). (8 marks)
      $
        "inner dimension" & : quad a_i = 109.22 " mm", quad b_i = 54.61 " mm" \
        "outer dimension" & : quad a_o = 113.28 " mm", quad b_o = 58.67 " mm"
      $
      (i) Determine the cut-off frequencies of the "TEM", $"TE"_(10)$, $"TE"_(01)$, and $"TE"_(20)$ modes. \
      (ii) Obtain the highest frequency theoretically allowable for single-mode operation hence determine the reduction in the usable bandwidth the "WR-430" specification presents. \
      (iii) Comment on the $"TE"_(01)$ and $"TE"_(20)$ modes in the guide.
    ],
    answer: answer-box()[
      #text(weight: "bold")[Part (i): Cut-off frequencies]

      The cut-off frequency for a $"TE"_(m n)$ mode in a rectangular waveguide is given by:
      $
        f_("c," m n) = frac(c, 2) sqrt((frac(m, a))^2 + (frac(n, b))^2)
      $
      Using the inner dimensions $a = 109.22 " mm" = 0.10922 " m"$ and $b = 54.61 " mm" = 0.05461 " m"$, and $c = 3 times 10^8 " m/s"$:

      *For the "TEM" mode:*
      A hollow rectangular waveguide cannot support a "TEM" mode. Therefore, the "TEM" cut-off frequency is undefined (or infinity).

      *For the $"TE"_(10)$ mode ($m=1, n=0$):*
      $
        f_("c,10") = frac(c, 2a) = frac(3 times 10^8, 2 times 0.10922) = 1.373 " GHz"
      $

      *For the $"TE"_(01)$ mode ($m=0, n=1$):*
      $
        f_("c,01") = frac(c, 2b) = frac(3 times 10^8, 2 times 0.05461) = 2.747 " GHz"
      $

      *For the $"TE"_(20)$ mode ($m=2, n=0$):*
      $
        f_("c,20") = frac(2c, 2a) = frac(c, a) = frac(3 times 10^8, 0.10922) = 2.746 " GHz"
      $

      #text(weight: "bold")[Part (ii): Single-mode operation and bandwidth reduction]

      The dominant mode is $"TE"_(10)$ with $f_("c,10") = 1.373 " GHz"$.
      The next higher-order modes are $"TE"_(20)$ and $"TE"_(01)$, both with cut-off frequencies around $2.746 " GHz"$.
      For single-mode operation, the guide must operate strictly between $1.373 " GHz"$ and $2.746 " GHz"$.

      The theoretical single-mode bandwidth is:
      $
        Delta f_"theoretical" = 2.746 - 1.373 = 1.373 " GHz"
      $

      The usable bandwidth specified for the "WR-430" ("R band") is:
      $
        Delta f_"usable" = 2.60 - 1.70 = 0.90 " GHz"
      $

      The reduction in usable bandwidth is:
      $
        "Reduction" = Delta f_"theoretical" - Delta f_"usable" = 1.373 - 0.90 = 0.473 " GHz"
      $
      This represents a percentage reduction of $frac(0.473, 1.373) times 100% tilde.op 34.4%$.

      #text(weight: "bold")[Part (iii): Comment on $"TE"_(01)$ and $"TE"_(20)$ modes]

      The $"TE"_(01)$ and $"TE"_(20)$ modes have almost identical cut-off frequencies ($2.747 " GHz"$ and $2.746 " GHz"$ respectively). This is because the inner dimensions satisfy $a_i tilde.op 2 b_i$ ($109.22 " mm" tilde.op 2 times 54.61 " mm"$).
      When $a = 2b$, the propagation constant for $"TE"_(01)$ is $k_c = pi/b = 2pi/a$, which is exactly the same as for $"TE"_(20)$ ($k_c = 2pi/a$).
      Therefore, these two modes are **degenerate**. They will reach their cut-off frequencies at essentially the same operating frequency, which limits the single-mode bandwidth of the guide.
    ],
  )
]

#numed-question()[
  #sub-question(
    [
      For a $"TE"_1$ mode propagating in a parallel-plate transmission line in the $z$-direction:
      (i) Write down the instantaneous field expressions.
      (ii) In a typical $Y$ plane, sketch the field lines.
      Use the cosine time reference function.
    ],
    answer: answer-box()[
      #text(weight: "bold")[Part (i): Instantaneous field expressions]

      Using a cosine time reference function:
      $
        H_z(y, z, t) & = cal(R)e[H_z exp{j(omega t - beta z)}] \
                     & = H_1 cos(frac(pi, b) y) cos(omega t - beta z)
      $
      $
        H_y(y, z, t) & = cal(R)e[H_y exp{j(omega t - beta z)}] \
                     & = -beta frac(b, pi) H_1 sin(frac(pi, b) y) sin(omega t - beta z)
      $
      $
        E_x(y, z, t) & = cal(R)e[E_x exp{j(omega t - beta z)}] \
                     & = -omega mu frac(b, pi) H_1 sin(frac(pi, b) y) sin(omega t - beta z)
      $
      $arrow(E)_t$ is hence everywhere normal to the $y z$-plane while $arrow(H)$ lines in this plane will have a slope:
      $
        frac(dif y, dif z) = frac(H_y, H_z)
      $

      #text(weight: "bold")[Part (ii): Sketch of field lines in a typical Y plane]

      At $t = 0$:
      $
        frac(dif y, dif z) = frac(H_y (y, z, 0), H_z (y, z, 0)) = frac(beta frac(b, pi) sin(frac(pi, b) y) sin(beta z), cos(frac(pi, b) y) cos(beta z))
      $
      Separating variables:
      $
        frac(cos(frac(pi, b) y) dif y, frac(b, pi) sin(frac(pi, b) y)) = frac(beta sin(beta z) dif z, cos(beta z)) arrow.double frac(frac(pi, b) cos(frac(pi, b) y) dif y, sin(frac(pi, b) y)) = frac(beta sin(beta z) dif z, cos(beta z))
      $
      $
        frac(dif (sin(frac(pi, b) y)), sin(frac(pi, b) y)) = - frac(dif (cos(beta z)), cos(beta z))
      $
      $
        ln(sin(frac(pi, b) y)) = -ln(cos(beta z)) + C_("TE")
      $
      #text(weight: "bold")[Field line characteristics:]
      - Magnetic Field Loops ($H$): Form closed loops centered around $y/b = 1/2$ and $z = pi/(2 beta), 3 pi/(2 beta), dots.c$
      - Electric Field Intensity ($E$): Reaches maximum amplitude at $y/b = 1/2$ and alternates direction between $+x$ and $-x$ every half guide wavelength ($lambda_g / 2$).

      #figure(
        rect(width: 10cm, height: 4cm)[Placeholder for TE1 field lines sketch],
        caption: [Field lines in a typical Y plane],
      )
    ],
  )

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
