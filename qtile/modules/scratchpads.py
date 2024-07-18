# Imports-----------------------------------------------
from .groups import groups
from libqtile.config import ScratchPad, DropDown
#------------------------------------------------------

# Scratchpad settings----------------------------------
# Define scratchpads
groups.append(ScratchPad("0", [
    DropDown("alacritty", "alacritty", width=0.6, height=0.7, x=0.2, y=0.1, opacity=1, on_focus_lost_hide=False),
    DropDown("lf", "kitty '-e' 'lf'", width=0.7, height=0.7, x=0.15, y=0.1, opacity=1, on_focus_lost_hide=False),
    DropDown("thunar", "thunar", width=0.9, height=0.9, x=0.05, y=0.05, opacity=1, on_focus_lost_hide=False),
    DropDown("ncmpcpp", "alacritty '-e' 'ncmpcpp'", width=0.6, height=0.6, x=0.2, y=0.1, opacity=1, on_focus_lost_hide=False),
        
]))
#-------------------------------------------------------

