using DataFrames
using Gadfly
using Colors

include("theory.jl")
include("transitions.jl")

tr_chains_d1(θ, N_H, N_E, p_H, p_E) = tr_chains(θ, N_H, N_E, p_H, p_E, 1)
tr_chains_d2(θ, N_H, N_E, p_H, p_E) = tr_chains(θ, N_H, N_E, p_H, p_E, 2)
tr_chains_d10(θ, N_H, N_E, p_H, p_E) = tr_chains(θ, N_H, N_E, p_H, p_E, 10)
tr_chains_d50(θ, N_H, N_E, p_H, p_E) = tr_chains(θ, N_H, N_E, p_H, p_E, 50)
tr_chains_d100(θ, N_H, N_E, p_H, p_E) = tr_chains(θ, N_H, N_E, p_H, p_E, 100)
conj_chains_d1(λ_E, λ_H, p_H, p_E) = conj_chains(λ_E, λ_H, p_H, p_E, 1)
theory_chains_d1(λ_E, λ_H, p_H, p_E) = theory_chains_upper(λ_E, λ_H, p_H, p_E, 1)
conj_chains_d50(λ_E, λ_H, p_H, p_E) = conj_chains(λ_E, λ_H, p_H, p_E, 50)
theory_chains_d50(λ_E, λ_H, p_H, p_E) = theory_chains_upper(λ_E, λ_H, p_H, p_E, 50)

function run_sim(θ, p_E, p_H, T, transition)
    N_H = 0
    N_E = 0
    hist = DataFrame(time = Array{Float64}(0),
                     N_E = Array{Float64}(0),
                     N_H = Array{Float64}(0))
    for i in 1:T
        (N_H, N_E) = transition(θ, N_H, N_E, p_H, p_E)
        push!(hist, (i, N_E, N_H))
    end
    return hist #mean(hist[convert(3*T/4):T,:N_H])
end

#Runs markov chain, not the Jump Process.
function run_sim(λ_E, λ_H, p_E, p_H, T, transition)
    θ= λ_H/(λ_H + λ_E)
    if transition in [theory_prioE_lower, theory_prioE_upper,
                      conj_prioE, theory_chains_d1,
                      conj_chains_d1, theory_chains_d50,
                      conj_chains_d50]
        return transition(λ_E, λ_H, p_E, p_H)
    else
        h = run_sim(θ, p_E, p_H, T, transition)
        h[:w_H] = h[:N_H]/λ_H
        h[:w_E] = h[:N_E]/λ_E
        return mean(h[Int(3*T/4):T, :w_H])
    end
end

function run_sim_E(λ_E, λ_H, p_E, p_H, T, transition)
    θ= λ_H/(λ_H + λ_E)
    h = run_sim(θ, p_E, p_H, T, transition)
    h[:w_H] = h[:N_H]/λ_H
    h[:w_E] = h[:N_E]/λ_E
    return mean(h[Int(3*T/4):T, :w_E])
end
