# Import-----------------------------------------------
from libqtile import hook
from os.path import expanduser
import subprocess
#------------------------------------------------------

# Hooks------------------------------------------------
# Define hook for autostart script
@hook.subscribe.startup_once
def autostart():
    subprocess.call(expanduser("~/.config/qtile/autostart.sh"))

# ref: https://www.reddit.com/r/qtile/comments/tw9apn/comment/i4cct7r
@hook.subscribe.client_new
def center_floating_win(window):
    wm_name = window.cmd_inspect()["name"]
    if wm_name == "float_term":
        window.toggle_floating()
        window.cmd_set_size_floating(711, 891)
        # window.cmd_set_position_floating((1366 - 301) // 2, (768 - 227) // 2)

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
