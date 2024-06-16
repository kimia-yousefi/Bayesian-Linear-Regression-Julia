using Turing
using Distributions

@model function bayesian_linear_regression(x, y)
    # Priors
    β0 ~ Normal(0, 10)
    β1 ~ Normal(0, 10)
    σ  ~ truncated(Normal(0, 5), 0, Inf)

    # Likelihood
    for i in eachindex(y)
        y[i] ~ Normal(β0 + β1 * x[i], σ)
    end
end
