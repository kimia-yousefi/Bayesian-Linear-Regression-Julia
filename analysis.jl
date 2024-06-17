using Turing
using Plots
using Random

include("generate_data.jl")
include("model.jl")

Random.seed!(42)

model = bayesian_linear_regression(data.x, data.y)

chain = sample(model, NUTS(), 1000)

println(chain)

# Plot posterior distributions
p1 = plot(chain[:β0], title="Posterior of β0", legend=false)
p2 = plot(chain[:β1], title="Posterior of β1", legend=false)

savefig(p1, "plots/beta0_posterior.png")
savefig(p2, "plots/beta1_posterior.png")

# Regression line with uncertainty
x_grid = range(minimum(data.x), maximum(data.x), length=100)

β0_samples = chain[:β0].value
β1_samples = chain[:β1].value

y_pred = [β0_samples[i] .+ β1_samples[i] .* x_grid
          for i in 1:200]

mean_pred = mean(reduce(hcat, y_pred), dims=2)

scatter(data.x, data.y, label="Data")
plot!(x_grid, mean_pred, label="Bayesian fit")

savefig("plots/regression_fit.png")

println("Analysis completed.")
