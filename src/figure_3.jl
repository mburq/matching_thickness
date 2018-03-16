include("run_sim.jl")

T = 1000000
p_E_range = 0.5
p_H_range = 0.002
λ_H_range = 0.2:0.2:(15-0.2)
λ_E_range = 5
#transitions_list = [tr_chains_d1, tr_chains_d50,tr_prioH, tr_prioE]
transitions_list = [tr_prioH, tr_prioE]

tic()
table1 = run_multiple_sim(λ_E_range, λ_H_range, p_E_range, p_H_range, transitions_list);
toc()
writetable("csv/fig_3.1.csv", table1)

T = 1000000
p_E_range = 0.5
p_H_range = 0.002
λ_H_range = 0.2:0.2:(15-0.2)
λ_E_range = 5
#transitions_list = [tr_chains_d1, tr_chains_d50,tr_prioH, tr_prioE]
transitions_list = [tr_prioH, tr_prioE]

tic()
table2 = run_multiple_sim(λ_E_range, λ_H_range, p_E_range, p_H_range, transitions_list, w_E = true);
toc()
writetable("csv/fig_3.2.csv", table2)
#
# T = 1000000
# p_E_range = 0.5
# p_H_range = 0.01
# λ_H_range = 0.1:0.1:(15-0.1)
# λ_E_range = 5
# transitions_list = [tr_prioH, tr_prioE, tr_random_prio]
#
# tic()
# table1 = run_multiple_sim(λ_E_range, λ_H_range, p_E_range, p_H_range, transitions_list);
# toc()
#
# writetable("csv/fig_3.1.csv", table1)
#
# T = 1000000
# p_E_range = 0.5
# p_H_range = 0.02
# λ_H_range = 0.5:0.5:(15-0.5)
# λ_E_range = 5
# transitions_list = [tr_chains_d1, tr_chains_d10,
#                     tr_prioH, tr_prioE]
# tic()
# table2 = run_multiple_sim(λ_E_range, λ_H_range, p_E_range, p_H_range, transitions_list, w_E = true);
# toc()
# writetable("csv/fig_3.2.csv", table2)
#
# T = 1000000
# p_E_range = 0.5
# p_H_range = 0.002
# λ_H_range = 0.2:0.2:(15-0.2)
# λ_E_range = 5
# #transitions_list = [tr_chains_d1, tr_chains_d50,tr_prioH, tr_prioE]
# transitions_list = [tr_prioH, tr_prioE]
#
# tic()
# table3 = run_multiple_sim(λ_E_range, λ_H_range, p_E_range, p_H_range, transitions_list, w_E = true);
# toc()
# writetable("csv/fig_3.3.csv", table3)
