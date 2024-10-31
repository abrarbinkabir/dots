# Imports---------------------------------------------
from libqtile import layout
from libqtile.config import Match
from .themes import theme
#-----------------------------------------------------

# Layout settings-------------------------------------
layout_theme = {
    "font":"Inter",
    "fontsize":10,
    "margin":10,
    "border_width":0,
    "change_ratio":0.02,
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
]
#-----------------------------------------------------

# Floating layout settings----------------------------
floating_layout = layout.Floating(
	border_width=2,
    border_focus= theme["blue"],
    border_normal= theme["overlay0"],       
    float_rules=[
        *layout.Floating.default_float_rules, 
        # List windows to use floating layout
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),
        Match(wm_class="confirmreset"),
        Match(wm_class="megasync"), # megasync
        #Match(wm_class="nsxiv"), # neo simple x image viewer
        Match(wm_class="gnome-font-viewer"), # font-viewer
        Match(wm_class="pavucontrol"), # pulseaudio volume control
        Match(wm_class="gl"),
        Match(wm_class="mpv"),
        Match(wm_class="gpartedbin"),
        Match(wm_class="GParted"),
        Match(wm_class="Galculator"),
        Match(wm_class="galculator"),
        Match(wm_class="lxappearance"),
        Match(wm_class="Lxappearance"),
        Match(wm_class="Xarchiver"),
        Match(wm_class="xarchiver"),
        ]
)
#-----------------------------------------------------

