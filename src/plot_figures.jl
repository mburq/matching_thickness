using DataFrames
using Colors
using Gadfly
include("run_sim.jl")

my_theme = Theme(minor_label_color=colorant"black",  # numbers on axes color
    key_label_color=colorant"black", # color key numbers color
    major_label_color=colorant"black", # axes label and title color
    major_label_font_size=15pt, # font size for axes label and title
    minor_label_font_size=10pt, #font size for numbers on axes
    key_label_font_size=10pt,
    panel_opacity=1); #setting background to opaque)

# include("plot_figure_2.jl")
# include("plot_figure_3.jl")
include("plot_figure_4.jl")
