# Import libraries------------------------------------
from modules.groups import groups
from modules.widgets import widget_defaults, screens
from modules.keybinds import keys, mod
from modules.layouts import layouts, floating_layout
from modules.scratchpads import *
from modules.hooks import *
import os
import subprocess
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
main = None
wmname = "LG3D"
#-----------------------------------------------------
