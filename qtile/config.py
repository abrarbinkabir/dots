# Import necessary libraries and modules
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile import hook
from os.path import expanduser
import os
import subprocess
# import asyncio
# import pulsectl_asyncio


theme = {
    "background": "1e1e2e",
    "foreground": "f1f4ff",
    "rosewater":  "f5e0dc",
    "flamingo":   "f2cdcd",
    "pink":       "f5c2e7",
    "mauve":      "cba6f7",
    "red":        "f38ba8",
    "maroon":     "eba0ac",
    "peach":      "fab387",
    "yellow":     "f9e2af",
    "green":      "a6e3a1",
    "teal":       "94e2d5",
    "sky":        "89dceb",
    "sapphire":   "74c7ec",
    "blue":       "89b4fa",
    "lavender":   "b4befe",
    "text":       "cdd6f4",
    "overlay1":   "7f849c",
    }

mod = "mod4" # super button

# Variables for commonly used apps
terminal = "alacritty"
browser = "firefox"
filemanager = "thunar"

# Keybindings for ...
keys = [
    # Switching focus between windows
    Key([mod], "h", lazy.layout.left(), desc="Moves focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Moves focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Moves focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Moves focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Moves window focus to other window"),
    
    # Changing the position and order of the windows
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Moves window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Moves window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Moves window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Moves window up"),
    Key([mod, "shift"], "space", lazy.layout.flip(), desc="Switches which horizontal side the main pane will occupy"),
    
    # Resizing windows
	Key([mod], "g", lazy.layout.grow(), desc="Makes the focused window bigger depending on it's position"),
	Key([mod], "m", lazy.layout.shrink(), desc="Makes the focused window smaller depending on it's position"),
	Key([mod], "r", lazy.layout.reset(), desc="Resets all windows to their default sizes"),
	Key([mod], "n", lazy.layout.normalize(), desc="Restores all secondary windows to their default size"),
	Key([mod], "o", lazy.layout.maximize(), desc="Toggles a focused window between its minimum and maximum sizes"),
	Key([mod], "space", lazy.window.toggle_floating()),
	
	# Launching apps
    Key([mod], "Return", lazy.spawn(terminal), desc="Launches terminal"),
    Key([mod], "a", lazy.spawn(browser), desc="Launches Firefox"),
    Key([mod], "f", lazy.spawn(filemanager), desc="Launches Thunar"),
    
    # Controlling the system
    Key([mod], "q", lazy.window.kill(), desc="Kills the focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reloads the Qtile config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shuts down Qtile/Logs out"),
    Key(["mod1"], "l", lazy.spawn("betterlockscreen -l"), desc="Locks the system"),
    Key([mod], "s", lazy.spawn("systemctl suspend"), desc="Suspends the system"),
    
    # Running Rofi scripts
    Key([mod], "d", lazy.spawn(expanduser("~/.config/rofi/launcher.sh"), shell=True), desc="Runs main Rofi menu"),
    Key([mod], "p", lazy.spawn(expanduser("~/.config/rofi/applets/powermenu.sh"), shell=True), desc="Runs Rofi powermenu applet"),
    Key(["mod1"], "space", lazy.spawn(expanduser("~/.config/rofi/documents.sh"), shell=True), desc="Runs Rofi file search"),
    Key(["mod1"], "c", lazy.spawn("clipmenu"), desc="Runs Rofi clipboard applet"),
    Key(["mod1"], "s", lazy.spawn(expanduser("~/.config/rofi/applets/screenshot.sh"), shell=True), desc="Runs Rofi screenshot applet"),
    Key(["mod1"], "t", lazy.spawn(expanduser("~/.config/scripts/mpd.sh"), shell=True), desc="Runs Rofi mpd applet"),
    
    # Taking Screenshot using Maim
    Key([], "Print", lazy.spawn(expanduser("~/.config/scripts/screenshot.sh window"), shell=True), desc="Takes screenshot of the focused window"),
    Key(["shift"], "Print", lazy.spawn(expanduser("~/.config/scripts/screenshot.sh full"), shell=True), desc="Takes fullscreen screenshot"),
    Key(["mod1"], "Print", lazy.spawn(expanduser("~/.config/scripts/screenshot.sh area"), shell=True), desc="Takes screenshot of the selection"),

    
    # Changing volume
    Key([mod], "F1", lazy.spawn(expanduser("~/.config/scripts/volume.sh up"), shell=True), desc="Increases volume by 5%"),
    Key([mod], "F2", lazy.spawn(expanduser("~/.config/scripts/volume.sh down"), shell=True), desc="Decreases volume by 5%"),
    Key([mod], "F3", lazy.spawn(expanduser("~/.config/scripts/volume.sh mute"), shell=True), desc="Toggles mute"),    
]

# Definition of groups
groups = []
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9",]
group_layouts = ["monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall"]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            ))
 
for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switches to that group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switches to & moves the focused window to that group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            ]
    )

# Definition of scratchpads
groups.append(ScratchPad("0", [
	# Alacritty scratchpad
    DropDown("term", "alacritty", width=0.8, height=0.8, x=0.1, y=0.1, opacity=1, on_focus_lost_hide=False),
    # LF file browser scratchpad
    DropDown("files", "alacritty '-e' 'lf'", width=0.8, height=0.8, x=0.1, y=0.1, opacity=1, on_focus_lost_hide=False),
    # ncmpcpp scratchpad
    DropDown("audio", "alacritty '-e' 'ncmpcpp'", width=0.6, height=0.6, x=0.2, y=0.2, opacity=1, on_focus_lost_hide=False),
        
]))

# Keybindings for scratchpads
keys.extend([
    Key([], "F1", lazy.group['0'].dropdown_toggle('term')),
    Key([], "F3", lazy.group['0'].dropdown_toggle('files')),
    Key([], "F4", lazy.group['0'].dropdown_toggle('audio')),
    ])

# Definition of layouts
layouts = [
    layout.MonadTall(
           font = "Inter",
           fontsize = 10,
           margin = 7,
           single_margin = 7,
           border_focus="#a6e3a1",
		   border_normal="#fab387",
           border_width = 2,
           single_border_width = 2,
          ),
]

# Default Qtile bar

widget_defaults = dict(
    font='JetBrainsMono Nerd Font Propo SemiBold',
    fontsize=14,
    padding=7,
)
screens = [
Screen(
        top=bar.Bar(
            [	widget.TextBox(
                    text="",
                    padding=8,
                    foreground=theme["background"],
                    background=theme["lavender"], 
                    mouse_callbacks={"Button1": lazy.spawn(expanduser("~/.config/rofi/launcher.sh"))}
                ),
                widget.Spacer(length=7),
                widget.GroupBox(
                font= 'JetBrainsMono Nerd Font Propo',
                fontsize=14,
                padding=8,
                highlight_method = "line",
                highlight_color=theme["lavender"],
                block_highlight_text_color=theme["background"],
                borderwidth = 0,
				active = theme["foreground"],
				inactive = theme["overlay1"],
				disable_drag=True,
                ),
                widget.Spacer(),
                #widget.Mpd2(
                #status_format='{play_status} {artist}/{title}',
                #foreground=theme["rosewater"],
                #play_states={'pause': '󰐊', 'play': '󰏤', 'stop': '󰓛'},
                #mouse_buttons={1: 'toggle', 2: 'stop', 4: 'previous', 5: 'next'},
                #idle_format='{play_status} {idle_message}', 
                #idle_message='MPD not playing',
                #no_connection='No connection',
                #mouse_callbacks = {'Button3': lazy.spawn(expanduser("~/.config/scripts/mpd.sh"))},                
                #),
                widget.Spacer(),
#                widget.PulseVolume(
#                channel= 'Master',
#                 foreground = theme["pink"],
#                 fmt = ' {}',
#                 step=5,
#                 mouse_callbacks = {'Button3': lazy.spawn('pavucontrol')},
#                ),
                widget.Memory(
                    format = ' {MemUsed:.2f} GiB',
                    measure_mem='G',
                    foreground=theme["yellow"],
                    update_interval=3.0,
                    mouse_callbacks = {'Button1': lazy.spawn('alacritty -e btop')},
                ),
                widget.CPU(
                 format = ' {load_percent:.2f}%',
                 foreground = theme["green"],
                 update_interval=3.0,
                 mouse_callbacks = {'Button1': lazy.spawn('alacritty -e btop')},
                 ),
                widget.Clock(
                foreground = theme["mauve"],
                format="%I:%M %p",
                fmt = ' {}',
                mouse_callbacks={"Button1": lazy.spawn(expanduser("~/.config/scripts/time.sh"))}
                ),
                widget.Clock(
                foreground = theme["flamingo"],
                format="%a, %b %d",
                fmt = ' {}',
                mouse_callbacks={"Button1": lazy.spawn(expanduser("~/.config/scripts/time.sh"))}
                ),
                widget.TextBox(
                    text="󰝚",
                    padding=5,
                    foreground=theme["lavender"],
                    mouse_callbacks={"Button1": lazy.spawn(expanduser("~/.config/scripts/mpd.sh"))}
               ),
                widget.Systray(
                icon_size=18,
                padding=7,
                ),
                widget.Spacer(length=7),
                widget.TextBox(
                    text="",
                    padding=8,
                    foreground=theme["background"],
                    background=theme["lavender"], 
                    mouse_callbacks={"Button1": lazy.spawn(expanduser("~/.config/rofi/applets/powermenu.sh"))}
               ),
                
                ],
            28,
            background=theme["background"],
            #border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            #border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]

# Mouse behavior
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = True
cursor_warp = False

floating_layout = layout.Floating(
	border_width=2,
	border_focus="#CBA6F7",
	border_normal="#F5E0DC",
    float_rules=[
        *layout.Floating.default_float_rules, 
        
        # Windows to follow layouts
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),
        Match(wm_class="confirmreset"),
        Match(wm_class="megasync"), # megasync
        Match(wm_class="nsxiv"), # neo simple x image viewer
        Match(wm_class="gnome-font-viewer"), # font-viewer
        Match(wm_class="pavucontrol"), # pulseaudio volume control
        Match(wm_class="gl"),
        Match(wm_class="mpv"),
        #Match(wm_class="zathura"), #zathura
        ]
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# Hook for running autostart script
@hook.subscribe.startup
def autostart():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

@hook.subscribe.startup_once
def autostart_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart_once.sh'])


# Hook for opening windows on certain workspaces
@hook.subscribe.client_new
def assign_app_group(client):
    d = {}
    d[group_names[0]] = ["Firefox", "firefox", "Navigator", "Browser"]
    d[group_names[1]] = [ "org.pwmt.zathura", "zathura", "Zathura", "atril", "Atril", ]
    d[group_names[2]] = ["gedit", "Gedit", "obsidian", "libreoffice", "libreoffice-writer", "soffice",]
    d[group_names[3]] = ["thunar", "Thunar",]
    d[group_names[4]] = ["inkscape", "org.inkscape.Inkscape", "Inkscape",]
    d[group_names[5]] = []
    d[group_names[6]] = []
    d[group_names[7]] = []
    allowToBeInGroup = ["alacritty", "Alacritty", "nsxiv", "nSxiv", "megasync", "MEGAsync", "xarchiver", "Xarchiver", "gnome-font-viewer", "pavucontrol", "gl","mpv",]
    wm_class = client.window.get_wm_class()
    if len(wm_class) >= 1:
        wm_class = wm_class[0]
        if wm_class not in allowToBeInGroup:
            for i in range(len(d)):
                if wm_class in list(d.values())[i]:
                    group = list(d.keys())[i]
                    client.togroup(group)
                    client.group.cmd_toscreen(toggle=False)
                    break
                else:
                    client.togroup("9")
                    client.group.cmd_toscreen(toggle=False)
main = None
wmname = "LG3D"
