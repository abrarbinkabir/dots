# Imports---------------------------------------------
from libqtile.config import Group
#-----------------------------------------------------

# Group settings--------------------------------------
groups = []

# Define name for each group
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9",]

# Define layout for each group
group_layouts = ["monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall"]

# Create label for groups and assign them layout
for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            ))
#-----------------------------------------------------


