include("run_sim.jl")

T = 100000
p_E_range = 0.5
p_H_range = 0.02
λ_E_range = 0.5:0.5:(10-0.5)
λ_H_range = 2
transitions_list = [tr_chains_d1, tr_chains_d10,
                    tr_chains_d50, tr_chains_d100]
table1 = run_multiple_sim(λ_E_range, λ_H_range, p_E_range, p_H_range, transitions_list);
writetable("csv/fig_4.1.csv", table1)

T = 100000
p_E_range = 0.5
p_H_range = 0.02
λ_H_range = 0.5:0.5:(10-0.5)
λ_E_range = 2
transitions_list = [tr_chains_d1, tr_chains_d10,
                    tr_chains_d50, tr_chains_d100]
table2 = run_multiple_sim(λ_E_range, λ_H_range, p_E_range, p_H_range, transitions_list);
writetable("csv/fig_4.2.csv", table2)

T = 1000000
p_E_range = 0.5
p_H_range = [0.1, 0.05, 0.01, 0.005, 0.001, 0.0005, 0.0001, 0.00005, 0.00001]
λ_E_range = 1
λ_H_range = 2
transitions_list = [tr_chains_d1, tr_chains_d10,
                    tr_chains_d50, tr_chains_d100]
table3 = run_multiple_sim(λ_E_range, λ_H_range, p_E_range, p_H_range, transitions_list);

table3[:norm_d1] = table3[:tr_chains_d1] .* table3[:p_H]
table3[:norm_d10] = table3[:tr_chains_d10] .* table3[:p_H]
table3[:norm_d50] = table3[:tr_chains_d50] .* table3[:p_H]
table3[:norm_d100] = table3[:tr_chains_d100] .* table3[:p_H]
table3[:log_p_H] = - log(table3[:p_H])

writetable("csv/fig_4.3.csv", table3)

T = 1000000
p_E_range = 0.1:0.1:1
p_H_range = 0.01
λ_E_range = 1
λ_H_range = 2
transitions_list = [tr_chains_d1, tr_chains_d10,
                    tr_chains_d50, tr_chains_d100]
table4 = run_multiple_sim(λ_E_range, λ_H_range, p_E_range, p_H_range, transitions_list);

writetable("csv/fig_4.4.csv", table4)
