# Import libraries-------------------------------
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from os.path import expanduser
import os
import subprocess
import pulsectl_asyncio
#------------------------------------------------

# Theme------------------------------------------
theme = {
    "background": "#eff1f5",
    "foreground": "#4c4f69",
    "rosewater":  "#dc8a78",
    "flamingo":   "#dd7878",
    "pink":       "#ea76cb",
    "mauve":      "#8839ef",
    "red":        "#d20f39",
    "maroon":     "#e64553",
    "peach":      "#fe640b",
    "yellow":     "#df8e1d",
    "green":      "#40a02b",
    "teal":       "#179299",
    "sky":        "#04a5e5",
    "sapphire":   "#209fb5",
    "blue":       "#1e66f5",
    "lavender":   "#7287fd",
    "text":       "#4c4f69",
    "overlay0":   "#9ca0b0",
    }
#------------------------------------------------

# Variables--------------------------------------
mod = "mod4" 
terminal = "alacritty"
browser = "firefox"
filemanager = "thunar"
#------------------------------------------------

# Keybindings------------------------------------
keys = [
    # Switch focus between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    
    # Change the position and order of the windows
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "shift"], "space", lazy.layout.flip(), desc="Flip side of the main pane horizontally"),
    
    # Resize windows
    Key([mod], "g", lazy.layout.grow(), desc="Expand the focused window"),
    Key([mod], "s", lazy.layout.shrink(), desc="Shrink the focused window"),
    Key([mod], "r", lazy.layout.reset(), desc="Reset all windows to their default size"),
    Key([mod], "n", lazy.layout.normalize(), desc="Restore all secondary windows to their default size"),
    Key([mod], "m", lazy.window.toggle_minimize(), desc="Toggle minimization on focused window"),
    Key([mod], "space", lazy.window.toggle_floating(), desc="Toggle floating layout"),

    # Launch apps
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "a", lazy.spawn(browser), desc="Launch browser"),
    Key([mod], "f", lazy.spawn(filemanager), desc="Launch filemanager"),
    
    # Control the system
    Key([mod], "q", lazy.window.kill(), desc="Kill the focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the Qtile config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Log out from Qtile"),
    Key(["mod1"], "l", lazy.spawn("betterlockscreen -l"), desc="Lock the system"),
    Key(["mod1"], "s", lazy.spawn("systemctl suspend"), desc="Suspend the system"),
    
    # Run various scripts
    Key(["mod1"], "a", lazy.spawn(expanduser("~/.config/scripts/launcher.sh"), shell=True), desc="Execute launcher applet"),
    Key(["mod1"], "p", lazy.spawn(expanduser("~/.config/scripts/powermenu.sh"), shell=True), desc="Execute powermenu applet"),
    Key(["mod1"], "space", lazy.spawn(expanduser("~/.config/scripts/files.sh"), shell=True), desc="Execute file search applet"),
    Key(["mod1"], "f", lazy.spawn(expanduser("~/.config/scripts/folders.sh"), shell=True), desc="Execute folder search applet"),
    Key(["mod1"], "c", lazy.spawn("clipmenu"), desc="Show clipboard"),
    Key(["mod1"], "o", lazy.spawn(expanduser("~/.config/scripts/screenshot.sh"), shell=True), desc="Execute screenshot applet"),
    Key(["mod1"], "d", lazy.spawn(expanduser("~/.config/scripts/datetime.sh"), shell=True), desc="Execute date-time applet"),
    Key(["mod1"], "t", lazy.spawn(expanduser("~/.config/scripts/mpd.sh"), shell=True), desc="Execute mpd applet"),
    Key(["mod1"], "b", lazy.spawn(expanduser("~/.config/scripts/backup.sh"), shell=True), desc="Execute backup applet"),
    Key(["mod1"], "w", lazy.spawn(expanduser("~/.config/scripts/archwiki.sh"), shell=True), desc="Execute arch-wiki applet"),
    Key(["mod1"], "m", lazy.spawn(expanduser("~/.config/scripts/man.sh"), shell=True), desc="Execute man page applet"),
    Key(["mod1"], "y", lazy.spawn(expanduser("~/.config/scripts/yt2mpv.sh"), shell=True), desc="Execute youtube to mpv applet"),
    Key(["mod1"], "e", lazy.spawn(expanduser("~/.config/scripts/extras-menu.sh"), shell=True), desc="Execute extra scripts applet"),
    Key([], "Print", lazy.spawn(expanduser("~/.config/scripts/screenshot-opts.sh window"), shell=True), desc="Take screenshot of the focused window"),
    Key(["shift"], "Print", lazy.spawn(expanduser("~/.config/scripts/screenshot-opts.sh full"), shell=True), desc="Take fullscreen screenshot"),
    Key(["mod1"], "Print", lazy.spawn(expanduser("~/.config/scripts/screenshot-opts.sh area"), shell=True), desc="Take screenshot of the selection"),
    Key(["mod1"], "F1", lazy.spawn(expanduser("~/.config/scripts/volume.sh up"), shell=True), desc="Increase volume by 5%"),
    Key(["mod1"], "F2", lazy.spawn(expanduser("~/.config/scripts/volume.sh down"), shell=True), desc="Decrease volume by 5%"),
    Key(["mod1"], "F3", lazy.spawn(expanduser("~/.config/scripts/volume.sh mute"), shell=True), desc="Toggle mute state"),    
]
#-----------------------------------------------------

# Group settings--------------------------------------
groups = []

# Define name for each group
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9",]

# Define layout for each group
group_layouts = ["monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall"]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            ))
 
for i in groups:
    keys.extend(
        [   # mod1 + letter of group = switch to that group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move the focused window to that group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            ]
    )
#-----------------------------------------------------

# Scratchpad settings----------------------------------
# Define scratchpads
groups.append(ScratchPad("0", [
    DropDown("alacritty", "alacritty", width=0.6, height=0.7, x=0.2, y=0.1, opacity=1, on_focus_lost_hide=False),
    DropDown("lf", "alacritty '-e' 'lf'", width=0.8, height=0.8, x=0.1, y=0.1, opacity=1, on_focus_lost_hide=False),
    DropDown("thunar", "thunar", width=0.9, height=0.9, x=0.05, y=0.05, opacity=1, on_focus_lost_hide=False),
    DropDown("ncmpcpp", "alacritty '-e' 'ncmpcpp'", width=0.6, height=0.6, x=0.2, y=0.1, opacity=1, on_focus_lost_hide=False),
        
]))

# Set keybindings for scratchpads
keys.extend([
    Key([], "F1", lazy.group['0'].dropdown_toggle('alacritty')),
    Key([], "F3", lazy.group['0'].dropdown_toggle('lf')),
    Key([], "F4", lazy.group['0'].dropdown_toggle('thunar')),
    Key([], "F5", lazy.group['0'].dropdown_toggle('ncmpcpp')),
    ])
#-----------------------------------------------------

# Layout settings-------------------------------------
layouts = [
    layout.MonadTall(
           font = "Inter",
           fontsize = 10,
           margin = 3,
           border_width = 1,
           single_border_width = None,
           single_margin = None,
           border_focus="#179299", #teal
           border_normal="#bcc0cc", #surface1           
          ),
]
#-----------------------------------------------------

# Bar and widgets settings----------------------------
widget_defaults = dict(
    font='JetBrainsMono Nerd Font Propo SemiBold',
    fontsize=14,
    padding=8,
)

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
            
            widget.Spacer(),
            
            widget.PulseVolume(
            channel= 'Master',
            foreground = theme["text"],
            fmt = ' {}',
            step=5,
            mouse_callbacks = {'Button3': lazy.spawn('pavucontrol')},
            ),
            
            widget.Memory(
            format = ' {MemUsed:.2f} GiB',
            measure_mem='G',
            foreground=theme["text"],
            update_interval=5.0,
            mouse_callbacks = {'Button1': lazy.spawn('alacritty -e htop')},
            ),
            
            widget.CPU(
            format = ' {load_percent:.2f}%',
            foreground = theme["text"],
            update_interval=5.0,
            mouse_callbacks = {'Button1': lazy.spawn('alacritty -e htop')},
            ),
            
            widget.Clock(
            foreground = theme["text"],
            format=" %I:%M %p",
            mouse_callbacks={"Button1": lazy.spawn(expanduser("~/.config/scripts/datetime.sh"))}
            ),
            
            widget.Clock(
            foreground = theme["text"],
            format=" %a, %b %d",
            update_interval= 60,
            mouse_callbacks={"Button1": lazy.spawn(expanduser("~/.config/scripts/datetime.sh"))}
            ),
            
            widget.Systray(
            icon_size=18,
            padding=7,
            ),

            widget.TextBox(
            text="",
            padding=8,
            foreground=theme["background"],
            background=theme["red"], 
            mouse_callbacks={"Button1": lazy.spawn(expanduser("~/.config/scripts/powermenu.sh"))}
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

# Mouse settings------------------------------------
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]
#----------------------------------------------------

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

# Other settings--------------------------------------
dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = True
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
#------------------------------------------------------

# Hooks------------------------------------------------
# Define hook for autostart script
@hook.subscribe.startup
def autostart():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

# Hook for opening windows on certain workspaces
#@hook.subscribe.client_new
#def assign_app_group(client):
#   d = {}
#    d[group_names[0]] = ["Firefox", "firefox", "Navigator", "Browser"]
#    wm_class = client.window.get_wm_class()
#    if len(wm_class) >= 1:
#        wm_class = wm_class[0]
#        if wm_class not in allowToBeInGroup:
#           for i in range(len(d)):
#                if wm_class in list(d.values())[i]:
#                    group = list(d.keys())[i]
#                    client.togroup(group)
#                    client.group.cmd_toscreen(toggle=False)
#                    break
#                else:
#                    client.togroup(qtile.currentGroup)
#----------------------------------------------------------

main = None
wmname = "LG3D"
