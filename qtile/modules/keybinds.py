# Imports----------------------------------------
from libqtile.config import Click, Drag, Key
from libqtile.lazy import lazy
from os.path import expanduser
from .groups import groups
#------------------------------------------------

# Variables--------------------------------------
mod = "mod4" 
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
    Key([mod], "o", lazy.window.toggle_maximize(), desc="Toggle minimization on focused window"),
    Key([mod], "space", lazy.window.toggle_floating(), desc="Toggle floating layout"),

    # Launch applications and run scripts with mod key
    Key([mod], "a", lazy.spawn(expanduser("~/.config/scripts/launcher.sh"), shell=True), desc="Execute launcher applet"),
    Key([mod], "Return", lazy.spawn("alacritty"), desc="Launch alacritty"),
    Key([mod], "t", lazy.spawn("alacritty"), desc="Launch alacritty"),
    Key([mod], "w", lazy.spawn("qutebrowser"), desc="Launch Qutebrowser"),
    Key([mod, "shift"], "w", lazy.spawn("firefox"), desc="Launch Firefox"),
    Key([mod], "f", lazy.spawn("alacritty -e lf"), desc="Launch lf"),
    Key([mod, "shift"], "f", lazy.spawn("thunar"), desc="Launch Thunar"),
    Key([mod], "e", lazy.spawn("alacritty -e nvim /home/abrar/Documents/50-notes/"), desc="Launch neovim"),
    
    # Control the system
    Key([mod], "q", lazy.window.kill(), desc="Kill the focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the Qtile config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Log out from Qtile"),
    
    # Run various scripts and commands with alt key
    Key(["mod1"], "a", lazy.spawn(expanduser("~/.config/scripts/archives.sh"), shell=True), desc="Execute archives search applet"),
    Key(["mod1"], "b", lazy.spawn(expanduser("~/.config/scripts/backup.sh"), shell=True), desc="Execute backup applet"),
    Key(["mod1"], "c", lazy.spawn("clipmenu"), desc="Show clipboard"),
    Key(["mod1"], "d", lazy.spawn(expanduser("~/.config/scripts/datetime.sh"), shell=True), desc="Execute date-time applet"),
    Key(["mod1"], "e", lazy.spawn(expanduser("~/.config/scripts/extras-menu.sh"), shell=True), desc="Execute extra scripts applet"),
    Key(["mod1"], "f", lazy.spawn(expanduser("~/.config/scripts/folders.sh"), shell=True), desc="Execute folder search applet"),
    Key(["mod1"], "h", lazy.spawn("dunstctl history-pop"), desc="Show last notification"),
    Key(["mod1"], "i", lazy.spawn(expanduser("~/.config/scripts/open-shot.sh"), shell=True), desc="Open last saved screenshot"),
    Key(["mod1"], "j", lazy.spawn(expanduser("~/.config/scripts/journal.sh")), desc="Open daily journal"),
    Key(["mod1"], "l", lazy.spawn("betterlockscreen -l"), desc="Lock the system"),
    Key(["mod1"], "m", lazy.spawn(expanduser("~/.config/scripts/man.sh"), shell=True), desc="Execute man page applet"),
    Key(["mod1"], "n", lazy.spawn(expanduser("~/.config/scripts/open-in-nvim.sh"), shell=True), desc="Open favorite folders with nvim"),
    Key(["mod1"], "o", lazy.spawn(expanduser("~/.config/scripts/screenshot.sh"), shell=True), desc="Execute screenshot applet"),
    Key(["mod1"], "p", lazy.spawn(expanduser("~/.config/scripts/powermenu.sh"), shell=True), desc="Execute powermenu applet"),
    Key(["mod1"], "s", lazy.spawn("systemctl suspend"), desc="Suspend the system"),
    Key(["mod1"], "t", lazy.spawn(expanduser("~/.config/scripts/tasklist.sh"), shell=True), desc="Execute mpd applet"),
    Key(["mod1"], "w", lazy.spawn(expanduser("~/.config/scripts/archwiki.sh"), shell=True), desc="Execute arch-wiki applet"),
    Key(["mod1"], "space", lazy.spawn(expanduser("~/.config/scripts/files.sh"), shell=True), desc="Execute file search applet"),
    Key([], "Print", lazy.spawn(expanduser("~/.config/scripts/screenshot-opts.sh window"), shell=True), desc="Take screenshot of the focused window"),
    Key(["shift"], "Print", lazy.spawn(expanduser("~/.config/scripts/screenshot-opts.sh full"), shell=True), desc="Take fullscreen screenshot"),
    Key(["mod1"], "Print", lazy.spawn(expanduser("~/.config/scripts/screenshot-opts.sh area"), shell=True), desc="Take screenshot of the selection"),
    Key(["mod1"], "F1", lazy.spawn(expanduser("~/.config/scripts/volume.sh up"), shell=True), desc="Increase volume by 5%"),
    Key(["mod1"], "F2", lazy.spawn(expanduser("~/.config/scripts/volume.sh down"), shell=True), desc="Decrease volume by 5%"),
    Key(["mod1"], "F3", lazy.spawn(expanduser("~/.config/scripts/volume.sh mute"), shell=True), desc="Toggle mute state"),    

]

# Switch between groups and move focused window to a group
for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen(),
                desc="Switch between groups"),
       Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to a group"),
               ])

# Toggle scratchpads
keys.extend([
    Key([], "F1", lazy.group['0'].dropdown_toggle('alacritty')),
    Key([], "F3", lazy.group['0'].dropdown_toggle('lf')),
    Key([], "F4", lazy.group['0'].dropdown_toggle('thunar')),
    Key([], "F5", lazy.group['0'].dropdown_toggle('ncmpcpp')),
    ])
#-----------------------------------------------------

# Mouse settings--------------------------------------
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]
#----------------------------------------------------
