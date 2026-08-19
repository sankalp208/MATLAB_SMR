# Thermodynamic Modelling of Hydrogen Production via Steam Methane Reforming

A MATLAB-based thermodynamic model of **Steam Methane Reforming (SMR)** developed to study equilibrium conversion and hydrogen production as a function of operating conditions.

The main objective was to take the reaction chemistry and thermodynamics of SMR and turn them into a working computational model that could be used to explore the effect of **temperature, pressure and steam-to-carbon ratio**.

## Reaction System

The model considers the two main reactions:

**Steam Methane Reforming**

```text
CH₄ + H₂O ⇌ CO + 3H₂
```

**Water-Gas Shift**

```text
CO + H₂O ⇌ CO₂ + H₂
```

Rather than solving individual component balances independently, I used **reaction extents** to describe the composition of the reacting system.

For two reactions, the unknowns are the extents of SMR and WGS. Once these are known, the moles and mole fractions of CH₄, H₂O, CO, CO₂ and H₂ can be calculated directly.

## Thermodynamic Model

The equilibrium constants are calculated using temperature-dependent correlations based on Gibbs free-energy relationships.

For a specified temperature, pressure and steam-to-carbon ratio, the model:

1. Calculates the equilibrium constants.
2. Expresses the component mole balances in terms of reaction extents.
3. Calculates the resulting mole fractions.
4. Forms the two equilibrium equations.
5. Uses MATLAB's `fsolve` to solve the nonlinear system.
6. Calculates methane conversion and hydrogen yield.

This gives a relatively compact way of solving the coupled SMR-WGS equilibrium problem.

## Base Case

The base case was evaluated at:

```text
Temperature        = 900 °C
Pressure           = 25 bar
Steam/Carbon       = 3
```

The model gives approximately:

```text
Methane conversion = 0.89
H₂ yield            = 3.08 mol H₂/mol CH₄
```

These results are within the expected range for the equilibrium behaviour discussed in the project.

## Parametric Study

I then varied the major operating parameters to understand the thermodynamic trade-offs.

### Temperature

Increasing temperature increases hydrogen production because the SMR reaction is endothermic and higher temperature favours the products.

### Pressure

Increasing pressure reduces hydrogen yield because the SMR reaction produces more gas-phase moles than it consumes.

However, high-pressure operation can still be practically attractive because of downstream hydrogen processing and compression considerations.

### Steam-to-Carbon Ratio

Increasing the steam-to-carbon ratio initially improves hydrogen production and also helps reduce the tendency for carbon formation.

The model shows diminishing improvement at higher steam-to-carbon ratios, with **S/C ≈ 3** being an important operating region.

## Code Structure

```text
main.m
mole_balance.m
equilibrium_constants.m
```

The main script defines the operating conditions and calls the equilibrium solver. The equilibrium constants and reaction material balances are separated into individual functions so that the thermodynamic and numerical parts of the model remain easy to modify.

The same calculation structure is then used for the temperature, pressure and steam-to-carbon parametric studies.

## Engineering Takeaway

The project was primarily about connecting three things:

**Chemical engineering theory → mathematical formulation → numerical implementation**

Concepts such as reaction equilibrium, Gibbs free energy, reaction extents and Le Chatelier's principle were converted into a nonlinear numerical model and then used to investigate practical operating trends.

The model also makes clear an important distinction between **thermodynamically favourable conditions and practical operating conditions**. For example, lower pressure favours SMR equilibrium, but industrial operation has to consider downstream hydrogen separation and compression requirements as well.

## Future Work

The current model is an equilibrium model, so the next logical steps would be to introduce:

* Reaction kinetics
* Catalyst behaviour and deactivation
* Energy balance
* Pressure drop
* Carbon formation
* Reactor sizing
* Downstream PSA modelling
* Full process simulation in Aspen Plus

## Tools

**MATLAB | Thermodynamics | Reaction Engineering | Chemical Equilibrium | Numerical Methods | Process Modelling**

Developed as an independent Chemical Engineering modelling project at **Birla Institute of Technology, Mesra**.
