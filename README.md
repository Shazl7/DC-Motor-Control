# DC Motor Speed Control Using MATLAB & Simulink

## Project Overview

This project focuses on modeling and controlling the speed of a DC motor using **MATLAB and Simulink**.

The project demonstrates the difference between open-loop and closed-loop control and investigates the performance of **P, PI, and PID controllers** for DC motor speed regulation.

---

## Project Objectives

* Develop a mathematical model of a DC motor.
* Obtain the motor transfer function.
* Analyze the open-loop response.
* Implement closed-loop speed control.
* Design and test P, PI, and PID controllers.
* Tune controller gains and observe their effect on system performance.
* Test the controller's ability to reject disturbances.
* Compare controller responses using time-domain performance metrics.

---

## DC Motor Model

The DC motor is modeled using its electrical and mechanical equations.

### Electrical Equation

$$
V(t) = L\frac{di(t)}{dt} + Ri(t) + E_b(t)
$$

where:

* \(V\) = Applied voltage
* \(L\) = Armature inductance
* \(R\) = Armature resistance
* \(i\) = Armature current
* \(E_b\) = Back EMF

### Back EMF

$$
E_b = K_e\omega
$$

### Motor Torque

$$
T_m = K_t i
$$

### Mechanical Equation

$$
J\frac{d\omega}{dt} + b\omega = T_m - T_L
$$

where:

* \(J\) = Moment of inertia
* \(b\) = Viscous friction coefficient
* \(T_L\) = Load torque
* \(\omega\) = Motor angular speed

---

## Motor Parameters

| Parameter                 | Value |
| ------------------------- | ----: |
| Armature Resistance \(R\) |   2 Ω |
| Armature Inductance \(L\) | 0.5 H |
| Torque Constant \(K_t\)   | 0.015 |
| Back EMF Constant \(K_e\) | 0.015 |
| Moment of Inertia \(J\)   |  0.02 |
| Viscous Friction \(b\)    |   0.2 |

---

## Transfer Function

The DC motor transfer function from input voltage to angular speed is:

$$
G(s)=\frac{\Omega(s)}{V(s)}
$$

Using the selected motor parameters:

$$
\boxed{
G(s)=\frac{0.015}
{0.01s^2+0.14s+0.400225}
}
$$

---

## Control Strategies

### 1. Open-Loop Control

The motor is first tested without feedback.

A **12 V step input** is applied to the motor model.

The steady-state speed is approximately:

$$
\omega_{ss}\approx0.45\ rad/s
$$

This experiment demonstrates the behavior of the motor without automatic correction.

---

### 2. P Controller

A proportional controller is implemented:

$$
u(t)=K_p e(t)
$$

where:

$$
e(t)=r(t)-y(t)
$$

The proportional gain \(K_p\) is increased to observe its effect on:

* Rise time
* Overshoot
* Steady-state error
* System response

Increasing \(K_p\) generally reduces the steady-state error, but excessive gain can introduce overshoot and oscillations.

---

### 3. PI Controller

The PI controller is defined as:

$$
C(s)=K_p+\frac{K_i}{s}
$$

The integral action accumulates the remaining error and helps eliminate steady-state error.

Different values of \(K_i\) are tested to investigate the effect of integral action on system response.

A high integral gain can cause overshoot and oscillations.

---

### 4. PID Controller

The PID controller is defined as:

$$
C(s)=K_p+\frac{K_i}{s}+K_ds
$$

The derivative term responds to the rate of change of the error:

$$
u_D=K_d\frac{de(t)}{dt}
$$

Derivative action adds damping to the system and can reduce overshoot and oscillations.

---

## Controller Tuning

The controllers are tested using different gain values.

The main parameters investigated are:

* \(K_p\) — Proportional gain
* \(K_i\) — Integral gain
* \(K_d\) — Derivative gain

The controller response is evaluated based on:

* Rise Time
* Settling Time
* Overshoot
* Peak Response
* Steady-State Error

---

## Disturbance Rejection

A disturbance is introduced into the control system to evaluate the controller's ability to maintain the desired motor speed.

When the disturbance changes the motor response, the feedback controller detects the resulting error and adjusts the control signal to bring the motor speed back toward the reference value.

This demonstrates the importance of feedback control in maintaining system performance under disturbances.

---

## Results

The project compares the performance of:

* Open-loop control
* P control
* PI control
* PID control

The results are presented using Simulink scopes and MATLAB analysis.

Performance metrics such as rise time, settling time, overshoot, and steady-state error are used to evaluate the different controllers.

---

## Tools & Technologies

* MATLAB
* Simulink
* Control System Toolbox
* PID Controller
* Transfer Functions
* Feedback Control Systems

---

## Project Structure

```text
DC-Motor-Control/
│
├── DC_Motor_Control.slx
├── DC_Motor_Control_Analysis.m
├── README.md
│
└── Results/
    ├── Open_Loop.png
    ├── P_Controller.png
    ├── PI_Controller.png
    ├── PID_Controller.png
    └── Disturbance_Rejection.png
```

---

## Key Learning Outcomes

Through this project, I gained practical experience in:

* Mathematical modeling of DC motors
* Transfer function development
* Open-loop and closed-loop control
* Feedback systems
* P, PI, and PID controllers
* Controller gain tuning
* Disturbance rejection
* MATLAB and Simulink simulation
* Time-domain performance analysis
* Comparing different control strategies
