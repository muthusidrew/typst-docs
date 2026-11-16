#set page(margin: 2cm, numbering: "1")
#set text(size: 11pt, font: "New Computer Modern")
#set heading(numbering: "1.1")

#align(center)[
  #text(size: 18pt, weight: "bold")[FEE 3411 — Assignment 1] \
  #v(0.3em)
  #text(size: 13pt)[Solutions & Study Notes]
]

#v(1em)
#outline(indent: 1em, depth: 2)

#pagebreak()

= Question 1 — Anatomy of a Real Control System

== (a) Block diagram

The tracker is a *sensor-based optical closed-loop tracking system*. The block diagram:

#rect(
  stroke: 0.5pt,
  inset: 8pt,
  radius: 2pt,
  width: 100%,
)[
  #align(center)[
    Sun light → [LDR pair + 741 comparator] → [Arduino] → [Relay driver] → [Servo motor] → [PV panel] \
    #v(0.3em)
    #text(size: 9pt)[feedback: panel position → comparator]
  ]
]

#v(0.5em)

#table(
  columns: (auto, 1fr),
  stroke: 0.3pt,
  inset: 5pt,
  [*Block*], [*Function*],
  [Reference], [Sun's position — implicitly defined as zero light-gradient between paired LDRs],
  [Error detector], [741 op-amp comparator — subtracts the two LDR signals],
  [Controller], [Arduino — processes error voltage, applies deadband, decides direction],
  [Actuator], [Servo motor driven through a relay module],
  [Plant], [Photovoltaic panel and its mounting structure],
  [Sensor], [LDR pair — measures the actual light gradient on the panel],
  [Disturbance], [Clouds, rain, wind, temperature],
  [Noise], [Reflections, artificial light, LDR mismatch],
)

*Signal table:*

#table(
  columns: (auto, auto, 1fr),
  stroke: 0.3pt,
  inset: 5pt,
  [*Signal*], [*Quantity*], [*Description*],
  [Reference], [—], [Implicit: zero error between LDRs],
  [Error], [V], [Difference between LDR outputs, amplified by 741],
  [Control], [logic / PWM], [Arduino command to relay driver],
  [Actuator output], [torque / angular velocity], [Servo motor shaft],
  [Plant output], [degrees], [Panel angular position],
  [Feedback], [V], [LDR signal representing actual light gradient],
)

== (b) Regulator or tracking system?

This is a *tracking system*. The reference (the sun's position) changes continuously throughout the day. A regulator would hold the output at a fixed setpoint; here the setpoint moves.

== (c) Error detector and actuator

- *Error detector:* LDR sensor pair + 741 op-amp comparator. The LDRs sense the light gradient. If the panel is misaligned, one LDR receives more light than the other, creating a voltage difference that the 741 amplifies into the error voltage.
- *Actuator:* Servo motor driven via a relay module. The servo provides precise angular positioning; the relay handles the higher current.

== (d) Open-loop scheme using a clock and almanac

*In favour:* No sensor required; works on overcast days (the panel is already positioned for when clouds pass); immune to reflections and partial shading fooling the LDRs.

*Against:* Energy-inefficient. On heavily overcast days or during rain, the system still consumes power to move the panel even though irradiance is too low to generate meaningful power — a net power loss. It also cannot correct for mechanical wear, backlash, or drift over time.

#pagebreak()

= Question 2 — Devices

== (a) Synchro transmitter and control transformer as error detector

*Operation:*

+ The synchro *transmitter* is mechanically coupled to the reference shaft. Its rotor is excited by an AC carrier. The three stator windings produce voltages whose amplitudes depend on the rotor angle.
+ These stator voltages are wired to the three stator windings of the synchro *control transformer*, whose rotor is coupled to the output (panel) shaft.
+ The control transformer's rotor output is an AC voltage whose amplitude is proportional to $sin(theta_"ref" - theta_"out")$. When the two angles match, the output is zero.

*Input:* two mechanical angles. *Output:* an AC error voltage (suppressed-carrier signal).

*Why "suppressed carrier":* the output is an AC signal at the carrier frequency whose amplitude is modulated by the error angle. When the error is zero, the carrier amplitude is zero — the carrier is "suppressed".

== (b) Stepper motor calculations

Three-stack variable-reluctance stepper, $N_r = 15$ rotor teeth, $m = 3$ stacks.

#align(center)[
  $ theta_s = (360 degree)/(N_r m) = (360 degree)/(15 times 3) = (360 degree)/45 = 8 degree $
]

#align(center)[
  $ "Pulses per revolution" = (360 degree)/(8 degree) = 45 $
]

#align(center)[
  $ "Speed" = 500/45 = 11.11 "rev/s" = 666.67 "rpm" $
]

== (c) Hydraulic vs pneumatic actuator transfer functions

#table(
  columns: (auto, 1fr, 1fr),
  stroke: 0.3pt,
  inset: 5pt,
  [], [*Hydraulic linear actuator*], [*Spring-loaded pneumatic diaphragm*],
  [Input], [Valve spool displacement], [Pressure signal],
  [Transfer function], [$ K / (s (tau s + 1)) $], [$ K / (tau s + 1) $],
  [Free integrator?], [*Yes* ($1/s$)], [*No*],
  [Step response], [Ramp — moves at constant speed], [Settles to a new position],
  [Physical reason],
  [Valve controls flow; flow integrates to position],
  [Pressure balances spring; position proportional to pressure],
)

*Key structural difference:* the hydraulic actuator is *flow-controlled*, so flow integrates into position — hence the free integrator $1/s$. The pneumatic actuator is *pressure-controlled*, and the spring balances the pressure force — position is proportional to pressure, so no integrator.

#pagebreak()

= Question 3 — Modelling Two Physical Systems

== (a) Series RLC network

KVL around the loop with output $v_o (t)$ across the capacitor:

#align(center)[
  $ v_i (t) = R C (dif v_o)/t + L C (dif^2 v_o)/t^2 + v_o (t) $
]

#align(center)[
  $ L C (dif^2 v_o)/t^2 + R C (dif v_o)/t + v_o (t) = v_i (t) $
]

Taking Laplace transforms with zero initial conditions:

#align(center)[
  $ frac(V_o (s), V_i (s)) = frac(1, L C s^2 + R C s + 1) $
]

*Characteristic equation:*

#align(center)[
  $ L C s^2 + R C s + 1 = 0 $
]

Substituting $R = 4$, $L = 1$, $C = 0.125$:

#align(center)[
  $ 0.125 s^2 + 0.5 s + 1 = 0 quad <==> quad s^2 + 4 s + 8 = 0 $
]

== (b) Mass–spring–damper

Newton's second law:

#align(center)[
  $ M (dif^2 x)/t^2 + B (dif x)/t + K x = f(t) $
]

Transfer function:

#align(center)[
  $ frac(X(s), F(s)) = frac(1, M s^2 + B s + K) $
]

Characteristic equation:

#align(center)[
  $ M s^2 + B s + K = 0 $
]

With $M = 1$, $B = 4$, $K = 8$:

#align(center)[
  $ s^2 + 4 s + 8 = 0 $
]

== (c) Comparison

The symbolic characteristic equations reveal the *electrical–mechanical analogy*:

#table(
  columns: (auto, auto, 1fr),
  stroke: 0.3pt,
  inset: 5pt,
  [Electrical], [Mechanical], [Role],
  [$L$], [$M$], [energy storage (kinetic)],
  [$R$], [$B$], [energy dissipation],
  [$1 slash C$], [$K$], [energy storage (potential / elastic)],
)

Numerically, both systems share:

#align(center)[
  $ s^2 + 4 s + 8 = 0 quad ==> quad s = -2 plus.minus j 2 $
]

From the standard form $s^2 + 2 zeta omega_n s + omega_n^2 = 0$:

#align(center)[
  $ omega_n = sqrt(8) = 2 sqrt(2) approx 2.828 "rad/s", quad zeta = 4/(2 sqrt(8)) = 1/sqrt(2) approx 0.707 $
]

#align(center)[
  $ omega_d = omega_n sqrt(1 - zeta^2) = 2 "rad/s" $
]

*What the characteristic equation tells us:* same poles → same *mode shape*. Both are stable, underdamped, with the same natural frequency, damping ratio, and damped frequency. The transient modes are $e^(-2t) cos(2t)$ and $e^(-2t) sin(2t)$ in both cases.

*What it does not tell us:* the amplitude or steady-state value. Those are set by the numerator (zeros and gain). Neither system in this question has finite zeros — only different constant gains:

#align(center)[
  $ G_"RLC" (s) = 8 G_"MSD" (s) $
]

The d.c. gains are $G_"RLC" (0) = 1$ and $G_"MSD" (0) = 1 slash 8 = 0.125$. So the RLC step response is exactly 8× the MSD step response — same shape, different amplitude.

#pagebreak()

= Question 4 — Armature-Controlled DC Servomotor

== (a) Armature circuit and mechanical equations

*Symbols:* $R_a$ armature resistance, $L_a$ armature inductance, $K_t$ torque constant, $K_b$ back-emf constant, $J_m$ rotor inertia, $b$ viscous friction, $v_a$ armature voltage, $i_a$ armature current, $theta_m$ shaft angle.

*Armature circuit:*

#align(center)[
  $ v_a (t) = R_a i_a (t) + L_a (dif i_a)/t + K_b (dif theta_m)/t $
]

*Mechanical torque balance:*

#align(center)[
  $ J_m (dif^2 theta_m)/t^2 + b (dif theta_m)/t = K_t i_a (t) $
]

*Assumptions:*
+ Constant magnetic field (no saturation).
+ Torque proportional to current, back-emf proportional to speed (linear magnetics).

== (b) Transfer function $Theta_m (s) slash V_a (s)$

Laplace with zero initial conditions:

#align(center)[
  $ V_a = (R_a + L_a s) I_a + K_b s Theta_m $
]

#align(center)[
  $ (J_m s^2 + b s) Theta_m = K_t I_a $
]

Eliminate $I_a$:

#align(center)[
  $ frac(Theta_m (s), V_a (s)) = frac(K_t, (J_m s^2 + b s)(R_a + L_a s) + K_t K_b s) $
]

== (c) Neglecting armature inductance ($L_a -> 0$)

#align(center)[
  $ frac(Theta_m (s), V_a (s)) = frac(K_m, s (tau_m s + 1)) $
]

where

#align(center)[
  $ K_m = frac(K_t, R_a b + K_t K_b), quad tau_m = frac(R_a J_m, R_a b + K_t K_b) $
]

*Numerical values* ($R_a = 2$, $K_t = 0.5$, $K_b = 0.5$, $J_m = 0.02$, $b = 0.01$):

#align(center)[
  $ R_a b + K_t K_b = 0.02 + 0.25 = 0.27 $
]

#align(center)[
  $ K_m = 0.5 slash 0.27 = 1.852 "rad/(s·V)" $
]

#align(center)[
  $ tau_m = (2 times 0.02) slash 0.27 = 0.148 "s" $
]

== (d) Load inertia through a gear train

*Gear ratio* $n = theta_L slash theta_m = 1 slash 10$ (speed reduction).

Derivation: power conservation $T_m omega_m = T_L omega_L$ gives $T_L = T_m slash n$. Substituting $omega_L = n omega_m$ into the load dynamics $T_L = J_L (dif omega_L)/t + b_L omega_L$:

#align(center)[
  $ T_m = J_L n^2 (dif omega_m)/t + b_L n^2 omega_m $
]

So the reflected inertia and friction are:

#align(center)[
  $ J_"reflected" = J_L n^2, quad b_"reflected" = b_L n^2 $
]

With $n = 1 slash 10$ and $J_L = 1.5$:

#align(center)[
  $ J_"reflected" = 1.5 times (1 slash 10)^2 = 0.015 "kg·m"^2 $
]

#align(center)[
  $ J_"total" = 0.02 + 0.015 = 0.035 "kg·m"^2 $
]

New time constant:

#align(center)[
  $ tau_m = (2 times 0.035) slash 0.27 approx 0.259 "s" $
]

*Comment:* the gear reduction makes the load inertia appear 100× smaller at the motor shaft. The time constant rises only modestly (from 0.148 s to 0.259 s). Reflected friction $b_L n^2$ (if present) would appear as additional damping in the denominator and would reduce $tau_m$ slightly.

#pagebreak()

= Appendix — Study Notes

== Pole–zero intuition

The characteristic equation (denominator = 0) gives the *poles*. Poles determine:

- stability (all in left half-plane → stable),
- natural frequency $omega_n$ and damping ratio $zeta$,
- *which modes appear* — i.e. the functional form $e^(-zeta omega_n t) cos(omega_d t)$ and $e^(-zeta omega_n t) sin(omega_d t)$.

Zeros (numerator roots) do *not* create new modes. They only change the *residues* — how much of each mode appears — and therefore the *shape* of the transient (overshoot, undershoot, initial slope). The overall gain factor scales the amplitude and sets the d.c. gain.

== Standard second-order form

Any second-order characteristic equation $a s^2 + b s + c = 0$ can be written as $s^2 + 2 zeta omega_n s + omega_n^2 = 0$ with

#align(center)[
  $ omega_n = sqrt(c slash a), quad zeta = b / (2 sqrt(a c)) $
]

The poles are $s = -zeta omega_n plus.minus j omega_n sqrt(1 - zeta^2)$ for $0 < zeta < 1$.

#table(
  columns: (auto, auto, auto),
  stroke: 0.3pt,
  inset: 5pt,
  [$zeta$], [Poles], [Response],
  [$0$], [$plus.minus j omega_n$], [undamped],
  [$0 < zeta < 1$], [$-zeta omega_n plus.minus j omega_d$], [underdamped],
  [$1$], [$-omega_n$ (double)], [critically damped],
  [$> 1$], [real, distinct], [overdamped],
)

== Time constant of a DC motor

$tau_m$ is the time to reach 63.2% of the final value after a step input. It measures how sluggish the motor is:

#align(center)[
  $ tau_m = frac(R_a J, R_a b + K_t K_b) $
]

- Larger $J$ → larger $tau_m$ (slower).
- The term $K_t K_b$ is the *electromechanical damping* — often dominant over viscous friction. Higher $K_t$ and $K_b$ → smaller $tau_m$ (more responsive).

== Moment of inertia, friction, and torque

Rotational equivalent of $F = m a + b v$:

#align(center)[
  $ T = J (dif omega)/t + b omega $
]

- $J$ resists *changes* in speed (sets how long acceleration takes).
- $b$ resists speed itself (sets steady-state speed for a given torque).
- Torque is split between accelerating the inertia and fighting friction.

== Gear reflection rule

With $n = omega_L slash omega_m$ (load speed / motor speed):

- Speed reduction ($n < 1$): $J_"reflected" = J_L n^2$ is *smaller* than $J_L$ — good for small motors.
- Speed increase ($n > 1$): $J_"reflected"$ is *larger* than $J_L$ — harder on the motor.

Same rule applies to friction: $b_"reflected" = b_L n^2$.

== Reflected load friction and the time constant

Adding reflected load friction increases the denominator:

#align(center)[
  $ tau_m = frac(R_a J_"total", R_a (b_m + b_L n^2) + K_t K_b) $
]

Since $b_L n^2$ appears in the denominator, more load friction → smaller $tau_m$ → faster settling. Note however that for a speed reduction ($n < 1$), $b_L n^2$ is much smaller than $b_L$, so the improvement is modest.
