# Imports---------------------------------------------
from libqtile import layout
from libqtile.config import Match
#-----------------------------------------------------

# Layout settings-------------------------------------
layouts = [
    layout.MonadTall(
           font = "Inter",
           fontsize = 10,
           margin = 7,
           border_width = 2,
           single_border_width = None,
           single_margin = None,
           border_focus="#179299", #teal
           border_normal="#bcc0cc", #surface1           
          ),
]
#-----------------------------------------------------

# Floating layout settings----------------------------
floating_layout = layout.Floating(
	border_width=1,
	border_focus="#179299", #teal
	border_normal="#bcc0cc", #surface1
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
        Match(wm_class="lxappearance"),
        Match(wm_class="Lxappearance"),
        Match(wm_class="Xarchiver"),
        Match(wm_class="xarchiver"),
        ]
)
#-----------------------------------------------------

