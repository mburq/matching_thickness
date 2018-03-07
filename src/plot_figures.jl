using DataFrames
using Colors
using Gadfly

my_theme = Theme(minor_label_color=colorant"black",  # numbers on axes color
    key_label_color=colorant"black", # color key numbers color
    #key_title_color=cyan,  # label of color key color
    major_label_color=colorant"black", # axes label and title color
    major_label_font_size=15pt, # font size for axes label and title
    minor_label_font_size=10pt, #font size for numbers on axes
    key_label_font_size=10pt,
    panel_opacity=1); #setting background to opaque)

function plot_fig_2(table)
    plot = plot(table,
        Coord.cartesian(xmin=0, ymin=0),
        #layer(x=:λ_H, y=:λ_H, Geom.line, Theme(default_color=colorant"red")),
        layer(x=:λ_H, y=:v, Geom.line, Theme(default_color=colorant"purple")),
        layer(x=:λ_H, y=:λ_E, color =:wait, Geom.rectbin),
        Guide.XLabel("λ<sub><small>H, 2</small></sub>"),
        Guide.YLabel("λ<sub><small>E, 2</small></sub>", orientation=:horizontal),
        #Guide.Title("Effect of merging a (λ_H1 = $λ_H_1, λ_E1 = $λ_E_1) pool with a (λ_H2, λ_E2) pool"),
        #Guide.colorkey("w_H1 increase"),
        Scale.color_continuous(minvalue = -200, maxvalue = 150),
        Guide.colorkey("w<sub><small>H, 1-2</small></sub> - w<sub><small>H, 1</small></sub>"),
        my_theme
    )
    draw(PDF("figs/" + figure + ".pdf", 6inch, 4.5inch), plot)
end

figure = "fig2.1"
table1 = readtable("csv/" + figure + ".csv")
plot_fig_2(table1, figure)

figure = "fig2.2"
table2 = readtable("csv/" + figure + ".csv")
plot_fig_2(table1, figure)
