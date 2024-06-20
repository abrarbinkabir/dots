# Imports---------------------------------------------
from libqtile import bar
from libqtile.lazy import lazy
from libqtile.config import Screen
from os.path import expanduser
from qtile_extras import widget
from .themes import theme
#-----------------------------------------------------


# Bar and widgets settings----------------------------
widget_defaults = dict(
    font='JetBrainsMono Nerd Font Propo SemiBold',
    fontsize=14,
    padding=10,
)

screens = [
Screen(
        top=bar.Bar([
            widget.GroupBox(
            font= 'JetBrainsMono Nerd Font Propo',
            fontsize=14,
            padding=8,
            highlight_method = "line",
            highlight_color=theme["blue"],
            block_highlight_text_color=theme["background"],
            borderwidth = 0,
            active = theme["lavender"],
            inactive = theme["overlay0"],
            disable_drag=True,
            ),

            widget.CurrentLayoutIcon(
                scale = 0.6,
            ),

            widget.Spacer(),
            
            widget.PulseVolume(
            channel= 'Master',
            foreground = theme["pink"],
            fmt = ' {}',
            step=5,
            mouse_callbacks = {'Button3': lazy.spawn('pavucontrol')},
            ),
            
            widget.Memory(
            format = ' {MemUsed:.2f} GiB',
            measure_mem='G',
            foreground=theme["blue"],
            update_interval=5.0,
            mouse_callbacks = {'Button1': lazy.spawn('alacritty -e btop')},
            ),
            
            widget.CPU(
            format = ' {load_percent:.2f}%',
            foreground = theme["peach"],
            update_interval=5.0,
            mouse_callbacks = {'Button1': lazy.spawn('alacritty -e btop')},
            ),
            
            widget.Clock(
            foreground = theme["green"],
            format=" %I:%M %p",
            mouse_callbacks={"Button1": lazy.spawn(expanduser("~/.config/scripts/datetime.sh"))},
            ),
            
            widget.Clock(
            foreground = theme["flamingo"],
            format=" %a, %b %d",
            update_interval= 60,
            mouse_callbacks={"Button1": lazy.spawn(expanduser("~/.config/scripts/datetime.sh"))},
            ),
            widget.Systray(
            icon_size=18,
            padding=7,
            ),
            ],
            28,
            background=theme["background"],
            border_width=[0, 0, 0, 0],  # Draw bottom border
            border_color=["000000", "000000", "#ccd0da", "000000"],  # surface0
        ),
    ),
]
#---------------------------------------------------


