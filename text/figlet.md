# figlet

Generate an ASCII art representation of some "input_text" in a larger font, which you can use as a title in your help menu.
You can also explore different fonts with the `-f` option.

More information: https://www.figlet.org/figlet-man.html.

```bash
# Install from repositories:
sudo apt install figlet

# Generate by directly inputting text:
figlet input_text

# Use a custom [f]ont file:
figlet -f path/to/font_file.flf input_text

# Use a [f]ont from the default font directory (the extension can be omitted):
figlet -f font_filename input_text
figlet -f slant "Input Text"

# Pipe command output through FIGlet:
command | figlet

# Show available FIGlet fonts:
showfigfonts "optional_string_to_display"

# Use the full width of the [t]erminal and [c]enter the input text:
figlet -t -c "input_text"

# Display all characters at full [W]idth to avoid overlapping:
figlet -W input_text
```
