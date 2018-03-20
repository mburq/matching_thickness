
table1 = readtable("csv/fig_4.1.csv")
p_fig4_l = plot(table1,
    layer(x=:λ_E, y=:tr_chains_d1, Geom.line, Theme(default_color=colorant"purple")),
    layer(x=:λ_E, y=:tr_chains_d10, Geom.line, Theme(default_color=colorant"green")),
    layer(x=:λ_E, y=:tr_chains_d50 , Geom.line, Theme(default_color=colorant"blue")),
    layer(x=:λ_E, y=:tr_chains_d100, Geom.line, Theme(default_color=colorant"red")),
    Guide.manual_color_key("", ["C(1)", "C(10)", "C(50)", "C(100)"],
        [colorant"purple",colorant"green", colorant"blue", colorant"red"]),
    Guide.YLabel("w<sub>H</sub>", orientation=:horizontal),
    Guide.XLabel("λ<sub>E</sub>"),
    #Guide.Title("C(d) vs B_H, vs B_E, p_E = $p_E, d = $d, p_H = $p_H, λ_H = $λ_H")
    my_theme
)
draw(PDF("figs/fig_4.1.pdf", 6inch, 4.5inch), p_fig4_l)

table2 = readtable("csv/fig_4.2.csv")
p_fig4_bot = plot(table2,
    layer(x=:λ_H, y=:tr_chains_d1, Geom.line, Theme(default_color=colorant"purple")),
    layer(x=:λ_H, y=:tr_chains_d10, Geom.line, Theme(default_color=colorant"green")),
    layer(x=:λ_H, y=:tr_chains_d50 , Geom.line, Theme(default_color=colorant"blue")),
    layer(x=:λ_H, y=:tr_chains_d100, Geom.line, Theme(default_color=colorant"red")),
    Guide.manual_color_key("", ["C(1)", "C(10)", "C(50)", "C(100)"],
        [colorant"purple",colorant"green", colorant"blue", colorant"red"]),
    Guide.YLabel("w<sub>H</sub>", orientation=:horizontal),
    Guide.XLabel("λ<sub>H</sub>"),
    #Guide.Title("C(d) vs B_H, vs B_E, p_E = $p_E, d = $d, p_H = $p_H, λ_H = $λ_H")
    my_theme
)
draw(PDF("figs/fig_4.2.pdf", 6inch, 4.5inch), p_fig4_bot)

table3 = readtable("csv/fig_4.3.csv")
p_fig4_r = plot(table3,
    layer(x=:log_p_H, y=:norm_d1, Geom.line, Theme(default_color=colorant"purple")),
    layer(x=:log_p_H, y=:norm_d10, Geom.line, Theme(default_color=colorant"green")),
    layer(x=:log_p_H, y=:norm_d50 , Geom.line, Theme(default_color=colorant"blue")),
    layer(x=:log_p_H, y=:norm_d100, Geom.line, Theme(default_color=colorant"red")),
    Guide.manual_color_key("", ["C(1)", "C(10)", "C(50)", "C(100)"],
        [colorant"purple",colorant"green", colorant"blue", colorant"red"]),
    Guide.YLabel("w<sub>H</sub> * p<sub>H</sub>", orientation=:horizontal),
    Guide.XLabel("- log(p<sub>H</sub>)"),
    #Guide.Title("C(d) vs B_H, vs B_E, p_E = $p_E, d = $d, p_H = $p_H, λ_H = $λ_H")
    my_theme
)
draw(PDF("figs/fig_4.3.pdf", 6inch, 4.5inch), p_fig4_r)

table4 = readtable("csv/fig_4.4.csv")
p_fig4_bot = plot(table4,
    layer(x=:p_E, y=:tr_chains_d1, Geom.line, Theme(default_color=colorant"purple")),
    layer(x=:p_E, y=:tr_chains_d10, Geom.line, Theme(default_color=colorant"green")),
    layer(x=:p_E, y=:tr_chains_d50 , Geom.line, Theme(default_color=colorant"blue")),
    layer(x=:p_E, y=:tr_chains_d100, Geom.line, Theme(default_color=colorant"red")),
    Guide.manual_color_key("", ["C(1)", "C(10)", "C(50)", "C(100)"],
        [colorant"purple",colorant"green", colorant"blue", colorant"red"]),
    Guide.YLabel("w<sub>H</sub>", orientation=:horizontal),
    Guide.XLabel("p<sub>E</sub>"),
    my_theme
)
draw(PDF("figs/fig_4.4.pdf", 6inch, 4.5inch), p_fig4_bot)
