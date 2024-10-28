# Create desktop popup notifications with notify-send or zenity

## notify-send

In Xubuntu, which uses the XFCE desktop environment, you can create a popup message (also known as a notification) using the **`notify-send`** command.
This command is part of the **`libnotify`** library, which is usually installed by default.

```bash
# If notify-send is not installed, you can install it using the following command:
sudo apt-get install libnotify-bin
```

More information: <https://manned.org/notify-send>.

```bash
# The general setup for showing a notification with title and content:
notify-send "Title" "Message body"

# Show a notification with a custom icon:
notify-send -i icon.png "Test" "This is a test"

# You can also specify the duration of the notification (in milliseconds):
notify-send -t 5000 "Test" "This is a test"

# Common icon names you can try with notify-send include:
notify-send -i dialog-information "Title" "Message"
notify-send -i dialog-warning "Title" "Message"
notify-send -i dialog-error "Title" "Message"
notify-send -i dialog-question "Title" "Message"
notify-send -i emblem-important "Title" "Message"
notify-send -i face-smile "Title" "Message"
notify-send -i user-available "Title" "Message"
notify-send -i face-glasses "Title" "Message"
notify-send -i multimedia-player "Title" "Message"
notify-send -i web-browser "Title" "Message"

# Furthermore you should be able to use the icons of all of your installed apps:
notify-send -i blender "Title" "Message"
notify-send -i steam "Title" "Message"
notify-send -i obsidian "Title" "Message"
notify-send -i google-chrome "Title" "Message"
```

## zenity

Display dialogs from the command-line/shell scripts.
Return user-inserted values or 1 if error.

```bash
# If zenity is not installed, you can install it using the following command:
sudo apt-get install zenity
```

More information: <https://manned.org/zenity>.

```bash
# Display the default question dialog:
zenity --question

# Display an info dialog displaying the text "Hello!":
zenity --info --text="Hello!"

# Display a name/password form and output the data separated by ";":
zenity --forms --add-entry="Name" --add-password="Password" --separator=";"

# Display a file selection form in which the user can only select directories:
zenity --file-selection --directory

# Display a progress bar which updates its message every second and show a progress percent:
(echo "#1"; sleep 1; echo "50"; echo "#2"; sleep 1; echo "100") | zenity --progress
```
