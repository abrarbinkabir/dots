# Imports---------------------------------------------
from libqtile import bar, widget
from libqtile.lazy import lazy
from os.path import expanduser
from .themes import theme
#-----------------------------------------------------

# Bar and widgets settings----------------------------
widget_defaults = dict(
    font='JetBrainsMono Nerd Font Propo SemiBold',
    fontsize=14,
    padding=10,
)

default_bar = bar.Bar([
    widget.TextBox(
    fmt = '',
    fontsize = 15,
    foreground = theme["blue"],
    mouse_callbacks={"Button1": lazy.spawn(expanduser("~/.config/scripts/launcher.sh"))},
    ),

    widget.GroupBox(
    font= 'JetBrainsMono Nerd Font Propo',
    fontsize=14,
    padding=8,
    margin_x=0,
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
    foreground = theme["mauve"],
    fmt = ' {}',
    step=5,
    mouse_callbacks = {'Button3': lazy.spawn('pavucontrol')},
    ),
    
    widget.Memory(
    format = ' {MemUsed:.2f} GiB',
    measure_mem='G',
    foreground=theme["sapphire"],
    update_interval=5.0,
    mouse_callbacks = {'Button1': lazy.spawn('alacritty -e btop')},
    ),
    
    widget.CPU(
    format = ' {load_percent:.2f}%',
    foreground = theme["green"],
    update_interval=5.0,
    mouse_callbacks = {'Button1': lazy.spawn('alacritty -e btop')},
    ),
    
    widget.Clock(
    foreground = theme["yellow"],
    format=" %I:%M %p",
    mouse_callbacks={"Button1": lazy.spawn(expanduser("~/.config/scripts/datetime.sh"))},
    ),
    
    widget.Clock(
    foreground = theme["peach"],
    format=" %a, %b %d",
    update_interval= 60,
    ),

    widget.Systray(
    icon_size=18,
    padding=0,
    ),

    widget.TextBox(
    fmt = '',
    padding=8,
    foreground = theme["red"],
    mouse_callbacks={"Button1": lazy.spawn(expanduser("~/.config/scripts/powermenu.sh"))},
    ),
    ],
    size=28,
    background=theme["background"],
    border_width=[0, 0, 0, 0],  # Draw bottom border
    border_color=["000000", "000000", "#ccd0da", "000000"],  # surface0
)
#------------------------------------------------------
