# Bayesian Linear Regression in Julia

This project implements a Bayesian linear regression model using the Julia
programming language and the Turing.jl probabilistic programming framework.

## Model
y = β₀ + β₁ x + ε  
ε ~ Normal(0, σ²)

Priors:
- β₀, β₁ ~ Normal(0, 10)
- σ ~ Half-Normal(5)

## Features
- Synthetic data generation
- Bayesian inference via MCMC (NUTS)
- Posterior analysis
- Uncertainty-aware regression fit

## Why Julia?
Julia allows expressive statistical modeling with near C-level performance,
making it well-suited for Bayesian inference and simulation-based statistics.

## Output
Posterior distributions and regression fit plots are saved in the `plots/` directory.