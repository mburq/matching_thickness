# Figure 3
table31 = readtable("csv/fig_3.1.csv");
table31[:line] = linspace(0,300,size(table31)[1])
p_fig3_l = plot(table31,
    layer(x=:λ_E, y=:line, Geom.line, Theme(default_color=colorant"green")),
    layer(x=:λ_H, y=:tr_prioH , Geom.line, Theme(default_color=colorant"blue")),
    layer(x=:λ_H, y=:tr_prioE, Geom.line, Theme(default_color=colorant"red")),
    Guide.manual_color_key("", ["B<sub><small>H</small></sub>", "B<sub><small>E</small></sub>",
                                "λ<sub><small>E</small></sub> = 5"],
                               [colorant"blue", colorant"red", colorant"green"]),
    Guide.YLabel("w<sub><small>H</small></sub>", orientation=:horizontal),
    Guide.XLabel("λ<sub><small>H</small></sub>"),
    #Guide.Title("C(d) vs B_H, vs B_E, p_E = $p_E, d = $d, p_H = $p_H, λ_H = $λ_H")
    my_theme
)
draw(PDF("figs/fig_3.1.pdf", 6inch, 4.5inch), p_fig3_l)

table32 = readtable("csv/fig_3.2.csv");
table32[:line] = linspace(0,300,size(table31)[1])
p_fig3_l = plot(table32,
    layer(x=:λ_E, y=:line, Geom.line, Theme(default_color=colorant"green")),
    layer(x=:λ_H, y=:tr_prioH , Geom.line, Theme(default_color=colorant"blue")),
    layer(x=:λ_H, y=:tr_prioE, Geom.line, Theme(default_color=colorant"red")),
    Guide.manual_color_key("", ["B<sub><small>H</small></sub>", "B<sub><small>E</small></sub>",
                                "λ<sub><small>E</small></sub> = 5"],
                               [colorant"blue", colorant"red", colorant"green"]),
    Guide.YLabel("w<sub><small>H</small></sub>", orientation=:horizontal),
    Guide.XLabel("λ<sub><small>H</small></sub>"),
    #Guide.Title("C(d) vs B_H, vs B_E, p_E = $p_E, d = $d, p_H = $p_H, λ_H = $λ_H")
    my_theme
)
draw(PDF("figs/fig_3.2.pdf", 6inch, 4.5inch), p_fig3_l)


# table31 = readtable("csv/fig_3.1.csv");
# table31[:line] = linspace(0,300,size(table31)[1])
# p_fig3_l = plot(table31,
#     layer(x=:λ_E, y=:line, Geom.line, Theme(default_color=colorant"green")),
#     layer(x=:λ_H, y=:tr_prioH , Geom.line, Theme(default_color=colorant"blue")),
#     layer(x=:λ_H, y=:tr_prioE, Geom.line, Theme(default_color=colorant"red")),
#     layer(x=:λ_H, y=:tr_random_prio, Geom.line, Theme(default_color=colorant"purple")),
#     Guide.manual_color_key("", ["B<sub><small>H</small></sub>", "B<sub><small>E</small></sub>",
#                                 "B<sub><small>random</small></sub>", "λ<sub><small>E</small></sub> = 5"],
#                                [colorant"blue", colorant"red", colorant"purple", colorant"green"]),
#     Guide.YLabel("w<sub><small>H</small></sub>", orientation=:horizontal),
#     Guide.XLabel("λ<sub><small>H</small></sub>"),
#     #Guide.Title("C(d) vs B_H, vs B_E, p_E = $p_E, d = $d, p_H = $p_H, λ_H = $λ_H")
#     my_theme
# )
# draw(PDF("figs/fig3_l_random_prio2.pdf", 6inch, 4.5inch), p_fig3_l)

# p_fig3_bis = plot(table31,
#     layer(x=:λ_H, y=:tr_chains_d1, Geom.line, Theme(default_color=colorant"purple")),
#     layer(x=:λ_H, y=:tr_chains_d50, Geom.line, Theme(default_color=colorant"green")),
#     layer(x=:λ_H, y=:tr_prioH , Geom.line, Theme(default_color=colorant"blue")),
#     Guide.manual_color_key("", ["C(1)", "C(20)", "B<sub><small>H</small></sub>"],
#                                [colorant"purple",colorant"green", colorant"blue"]),
#     Guide.YLabel("w<sub><small>H</small></sub>", orientation=:horizontal),
#     Guide.XLabel("λ<sub><small>H</small></sub>"),
#     #Guide.Title("C(d) vs B_H, vs B_E, p_E = $p_E, d = $d, p_H = $p_H, λ_H = $λ_H")
#     my_theme
# )
# draw(PDF("figs/fig3_bis.pdf", 6inch, 4.5inch), p_fig3_bis)

# table32 = readtable("csv/fig_3.2.csv")
# p_fig3b_r = plot(table32,
#     layer(x=:λ_H, y=:tr_chains_d1, Geom.line, Theme(default_color=colorant"purple")),
#     layer(x=:λ_H, y=:tr_chains_d10, Geom.line, Theme(default_color=colorant"green")),
#     layer(x=:λ_H, y=:tr_prioH , Geom.line, Theme(default_color=colorant"blue")),
#     layer(x=:λ_H, y=:tr_prioE, Geom.line, Theme(default_color=colorant"red")),
#     Guide.manual_color_key("", ["C(1)", "C(10)", "B<sub><small>H</small></sub>", "B<sub><small>E</small></sub>"],
#         [colorant"purple",colorant"green", colorant"blue", colorant"red"]),
#     Guide.YLabel("w<sub><small>H</small></sub>", orientation=:horizontal),
#     Guide.XLabel("λ<sub><small>E</small></sub>"),
#     #Guide.Title("C(d) vs B_H, vs B_E, p_E = $p_E, d = $d, p_H = $p_H, λ_H = $λ_H")
#     my_theme
# )
# draw(PDF("figs/fig3b_r.pdf", 6inch, 4.5inch), p_fig3b_r)
