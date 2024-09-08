# xdg-open

Open a file or URL in the user's preferred application.  
More information: <https://portland.freedesktop.org/doc/xdg-open.html>.  

```bash
# Open the current directory in the default file explorer:
xdg-open .

# Open a URL in the default browser:
xdg-open https://example.com

# Open an image in the default image viewer:
xdg-open path/to/image

# Open a PDF in the default PDF viewer:
xdg-open path/to/pdf

# Display help:
xdg-open --help

# Changing the default application from the terminal:
# Replace application.desktop with the desktop file of the application you want to set as default, and mimetype with the MIME type of the files you want to associate with this application.
xdg-mime default application.desktop mimetype
```
