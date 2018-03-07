include("run_sim.jl")

function waiting_diff(λ_H, λ_E, N, M, t_1, time_function, num, T)
    table = DataFrame(λ_H = Array{Float64}(0), λ_E = Array{Float64}(0), w_H = Array{Float64}(0),
                        wait = Array{Float64}(0), wait1 = Array{Float64}(0))
    for (e, λ_E) in enumerate(linspace(1/num,N,num))
        e%(num/10) == 0 && println("$e out of $num")
        for (h, λ_H) in enumerate(linspace(1/num,M,num))
            t_sum = time_function(λ_E + λ_E_1, λ_H + λ_H_1, p_E, p_H, T, tr_prioH)
            t_2 = time_function(λ_E, λ_H, p_E, p_H, T, tr_prioH)
            #t_2 = mean(h_2[Int(T*3/4):T, :w_H])
            #t_sum = mean(h_sum[Int(T*3/4):T, :w_H])
            push!(table, (λ_H, λ_E, t_sum, t_sum - t_1, t_sum - t_2))
        end
    end
    return table
end

function find_boundary(table)
    table[:improvement] = table[:wait] .< 0;
    ve = zeros(Float64, num);
    u = linspace(1/num, N, num)
    for (i, k) in enumerate(linspace(1/num, M, num))
        x = find(! table[table[:λ_H] .== k, :improvement])
        if x == []
            ve[i] = 0
        else
            ve[i] = u[maximum(x)]
        end
    end
    v = []
    for i in 1:num
        append!(v, ve)
    end
    table[:v] = v;
end

# Case lambda_H < lambda_E
λ_E_1 = 1.3
λ_H_1 = 1
p_H = 0.02
p_E = 0.5
N = 3
M = 5
d = 0
T = 10000
num = 50

# Find waiting time for market 1 alone
tic()
t_1 = run_sim(λ_E_1, λ_H_1, p_E, p_H, T, tr_prioH)
toc()

tic()
table1 = waiting_diff(λ_H_1, λ_E_1, N, M, t_1, run_sim, num, T);
toc()

find_boundary(table1)

writetable("csv/fig_2.1.csv", table1)

# Case lambda_H > lambda_E
λ_E_1 = 1
λ_H_1 = 1.3

t_1 = run_sim(λ_E_1, λ_H_1, p_E, p_H, T, tr_prioH);

tic()
table2 = waiting_diff(λ_H_1, λ_E_1, N, M, t_1, run_sim, num, T);
toc()

find_boundary(table2)

writetable("csv/fig_2.2.csv", table2)
