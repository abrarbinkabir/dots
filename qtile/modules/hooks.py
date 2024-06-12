# Import-----------------------------------------------
from libqtile import hook, qtile
from os.path import expanduser
import subprocess
import os
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
