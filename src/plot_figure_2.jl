function plot_fig_2(table, figure)
    p = plot(table,
        Coord.cartesian(xmin=0, ymin=0),
        #layer(x=:λ_H, y=:λ_H, Geom.line, Theme(default_color=colorant"red")),
        layer(x=:λ_H, y=:v, Geom.line, Theme(default_color=colorant"purple")),
        layer(x=:λ_H, y=:λ_E, color =:wait, Geom.rectbin),
        Guide.XLabel("λ<sub><small>H, 2</small></sub>"),
        Guide.YLabel("λ<sub><small>E, 2</small></sub>", orientation=:horizontal),
        Scale.color_continuous(minvalue = -200, maxvalue = 150),
        Guide.colorkey(title = "w<sub><small>H, 1-2</small></sub> - w<sub><small>H, 1</small></sub>"),
        my_theme
    )
    draw(PDF(string("figs/", figure, ".pdf"), 6inch, 4.5inch), p)
end

figure = "fig_2.1"
table21 = readtable(string("csv/", figure, ".csv"))
plot_fig_2(table21, figure)

figure = "fig_2.2"
table22 = readtable(string("csv/", figure, ".csv"))
plot_fig_2(table22, figure)
