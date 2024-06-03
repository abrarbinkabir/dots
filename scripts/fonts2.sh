#!/bin/bash

# Specifies Theme
theme="$HOME/.config/rofi/config.rasi"

rofi_command() {
		rofi -dmenu -i \
		-p "Fonts" \
		-sort \
		-sorting-method fzf \
		-markup-rows \
		-theme "$theme"
		}

fc-list | cut -d':' -f1 | awk -F/ '{print $NF}' | sed 's/\.[^.]*$//' | sort | rofi_command > /dev/null 2>&1
 

#!/bin/bash
#!/bin/bash
#!/bin/bash
#!/bin/bash

# Specifies Theme
theme="$HOME/.config/rofi/config.rasi"

rofi_command() {
		rofi -dmenu -i \
		-p "Fonts" \
		-sort \
		-sorting-method fzf \
		-markup-rows \
		-theme "$theme"
		}

fc-list | cut -d':' -f1 | awk -F/ '{print $NF}' | sed 's/\.[^.]*$//' | sort | rofi_command > /dev/null 2>&1
