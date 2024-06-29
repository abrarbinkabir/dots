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

# @hook.subscribe.client_new
# def floating_dialogs(client):
#     # Check if the window class is 'floating'
#     wm_class = client.window.get_wm_class()
#     if wm_class and wm_class[0] == "float_term":
#         # Set the window to floating
#         client.floating = True
#         # Set specific dimensions (adjust as needed)
#         client.place(x=200, y=600, width=900, height=900)

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
