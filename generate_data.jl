using Random
using DataFrames

Random.seed!(123)

n = 100
β0_true = 2.0
β1_true = 3.5
σ_true = 1.0

x = randn(n)
ϵ = randn(n) .* σ_true
y = β0_true .+ β1_true .* x .+ ϵ

data = DataFrame(x = x, y = y)

println("Data generated successfully.")
