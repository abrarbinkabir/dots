# Imports---------------------------------------------
from libqtile import bar
from libqtile.lazy import lazy
from libqtile.config import Screen
from os.path import expanduser
from qtile_extras import widget
from qtile_extras.widget.decorations import PowerLineDecoration
from .themes import theme
#-----------------------------------------------------


# Bar and widgets settings----------------------------
widget_defaults = dict(
    font='JetBrainsMono Nerd Font Propo SemiBold',
    fontsize=14,
    padding=8,
)

powerline = {
    "decorations": [
        PowerLineDecoration(path="arrow_right", size=10)
    ]
}

screens = [
Screen(
        top=bar.Bar(
        [   widget.TextBox(
            text="",
            padding=8,
            foreground=theme["background"],
            background=theme["teal"], 
            mouse_callbacks={"Button1": lazy.spawn(expanduser("~/.config/scripts/launcher.sh"))}
            ),
            
            widget.GroupBox(
            font= 'JetBrainsMono Nerd Font Propo',
            fontsize=14,
            padding=8,
            highlight_method = "line",
            highlight_color=theme["teal"],
            block_highlight_text_color=theme["background"],
            borderwidth = 0,
            active = theme["foreground"],
            inactive = theme["overlay0"],
            disable_drag=True,
            ),
            
            widget.Spacer(
            **powerline
            ),
            
            widget.PulseVolume(
            channel= 'Master',
            foreground = theme["background"],
            background="#3e9da3",
            fmt = ' {}',
            step=5,
            mouse_callbacks = {'Button3': lazy.spawn('pavucontrol')},
            **powerline
            ),
            
            widget.Memory(
            format = ' {MemUsed:.2f} GiB',
            measure_mem='G',
            foreground=theme["background"],
            background="#179299",
            update_interval=5.0,
            mouse_callbacks = {'Button1': lazy.spawn('alacritty -e btop')},
            **powerline
            ),
            
            widget.CPU(
            format = ' {load_percent:.2f}%',
            foreground = theme["background"],
            background="#127e84",
            update_interval=5.0,
            mouse_callbacks = {'Button1': lazy.spawn('alacritty -e btop')},
            **powerline
            ),
            
            widget.Clock(
            foreground = theme["background"],
            background="#0e6b70",
            format=" %I:%M %p",
            mouse_callbacks={"Button1": lazy.spawn(expanduser("~/.config/scripts/datetime.sh"))},
            **powerline
            ),
            
            widget.Clock(
            foreground = theme["background"],
            background="#0a585d",
            format=" %a, %b %d",
            update_interval= 60,
            mouse_callbacks={"Button1": lazy.spawn(expanduser("~/.config/scripts/datetime.sh"))},
            ),
            widget.Systray(
            icon_size=18,
            padding=7,
            ),
            ],
            26,
            background=theme["background"],
            border_width=[0, 0, 1, 0],  # Draw bottom border
            border_color=["000000", "000000", "#ccd0da", "000000"]  # surface0
        ),
    ),
]
#---------------------------------------------------


