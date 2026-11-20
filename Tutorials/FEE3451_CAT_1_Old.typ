#import "assignment-template.typ": *
#import "@preview/zap:0.6.0"

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

      Assuming a wave propagating in the $+z$ direction with a time harmonic dependence $exp{j(omega t - gamma z)}$.

      Consider the dominant TE mode in a rectangular section waveguide $"TE"_(10)$ and its expression for for the axial magnetic field:
      $
        H_(z) = H_(10) cos(frac(pi, a))x
      $

      We know that
      $
        arrow(H)_(t) & = - frac(gamma, k_(c)^2) nabla_(t) H_(z) \
        arrow(E)_(t) & = frac(j omega mu, k_(c)^2) hat(z) times nabla_(t)H_z
      $

      Finding the gradient of $H_(z)$:
      $
        nabla_(t)H_(z) = hat(x)
      $

    ],
  )
  #sub-question(
    [
      Show that the transmission line model of Fig. Q1(c) can be used to represent the propagation characteristics of the transverse electric wave in a waveguide of rectangular cross-section if the characteristic impedance and propagation constant for this wave are written in analogy with transmission line theory in terms of the series impedance per unit length \(Z'\) and shunt admittance per unit length \(Y'\). The medium filling the guide has permittivity \(epsilon\) and permeability \(mu\). (11 marks)
    ],
    answer: answer-box()[
      To show that the transverse electric (TE) wave can be modeled as a transmission line, we must show that its transverse fields satisfy the standard telegrapher's equations:
      $
        frac(d V, d z) = - Z' I
      $
      $
        frac(d I, d z) = - Y' V
      $
      where \(V\) and \(I\) are equivalent voltage and current, and \(Z'\) and \(Y'\) are the series impedance and shunt admittance per unit length.

      Assume a wave propagating in the \(+z\) direction with dependence \(exp(-gamma z)\). We select the transverse field components \(E_y\) and \(H_x\) to represent our equivalent voltage and current. Let:
      $
        V = E_y
      $
      $
        I = -H_x
      $

      From Maxwell's curl equations in a source-free, lossless medium (\(sigma = 0\)):
      $
        nabla times arrow(E) = -j omega mu arrow(H)
      $
      $
        nabla times arrow(H) = j omega epsilon arrow(E)
      $

      Taking the \(x\)-component of Faraday's law:
      $
        frac(partial E_z, partial y) - frac(partial E_y, partial z) = -j omega mu H_x
      $
      Since it is a TE wave, \(E_z = 0\). Using \(partial / partial z = -gamma\):
      $
        -(-gamma E_y) = -j omega mu H_x
      $
      $
        frac(d V, d z) = gamma V = -j omega mu I
      $
      From this, we can identify the equivalent series impedance per unit length:
      $
        Z' = j omega mu
      $

      Next, taking the \(y\)-component of Ampere's law:
      $
        frac(partial H_x, partial z) - frac(partial H_z, partial x) = j omega epsilon E_y
      $
      Substituting \(partial / partial z = -gamma\) and \(H_x = -I\):
      $
        -gamma (-I) - frac(partial H_z, partial x) = j omega epsilon E_y
      $
      From the transverse field relations derived earlier, we know that for a TE wave:
      $
        E_y = frac(j omega mu, k_c^2) frac(partial H_z, partial x) arrow frac(partial H_z, partial x) = frac(k_c^2, j omega mu) E_y
      $
      Substituting this into our Ampere's law equation:
      $
        gamma I - frac(k_c^2, j omega mu) V = j omega epsilon V
      $
      $
        frac(d I, d z) = gamma I = (j omega epsilon + frac(k_c^2, j omega mu)) V
      $
      $
        frac(d I, d z) = - ( -j omega epsilon + frac(j k_c^2, omega mu) ) V
      $
      From this, we identify the equivalent shunt admittance per unit length:
      $
        Y' = j omega epsilon - j frac(k_c^2, omega mu)
      $

      Now, for a standard transmission line, the propagation constant and characteristic impedance are given by:
      $
        gamma = sqrt(Z' Y')
      $
      $
        Z_0 = sqrt(frac(Z', Y'))
      $

      Let us verify the propagation constant:
      $
        sqrt(Z' Y') & = sqrt((j omega mu)(j omega epsilon - j frac(k_c^2, omega mu))) \
                    & = sqrt(-omega^2 mu epsilon + k_c^2) \
                    & = sqrt(k_c^2 - k^2)
      $
      This is exactly the propagation constant \(gamma\) for a waveguide.

      Let us verify the characteristic impedance:
      $
        Z_0 = sqrt(frac(j omega mu, j omega epsilon - j frac(k_c^2, omega mu)))
      $
      Multiply numerator and denominator by \(j omega mu\):
      $
        Z_0 = sqrt(frac(-(omega mu)^2, -(omega^2 mu epsilon) + k_c^2)) = sqrt(frac(omega^2 mu^2, k_c^2 - k^2)) = sqrt(frac(omega^2 mu^2, gamma^2)) = frac(j omega mu, gamma)
      $
      This is exactly the wave impedance of a TE mode, $Z_{T E}$).

      #text(weight: "bold")[Conclusion:]
      Because the transverse fields of the TE mode perfectly satisfy the telegrapher's equations with a series impedance \(Z' = j omega mu\) and shunt admittance \(Y' = j omega epsilon - j frac(k_c^2, omega mu)\), the rectangular waveguide can be accurately represented by the 1D transmission line model of Fig. Q1(c).
    ],
  )
]
