# Flatpak

Manage Flatpak apps mainly with these commands:

```bash
# See installed Flatpak apps
flatpak list

# Search for an app
flatpak search <name>

# Install an app
flatpak install flathub <app-id>

# Run an app
flatpak run <app-id>

# Update all Flatpak apps and runtimes
flatpak update

# Remove an app
flatpak uninstall <app-id>

# Remove unused runtimes
flatpak uninstall --unused

# Show details about an installed app
flatpak info <app-id>
```

To see the exact application IDs:

```bash
flatpak list --app
```

For example, installing Firefox:

```bash
flatpak install flathub org.mozilla.firefox
flatpak run org.mozilla.firefox
```

If Flathub is not enabled, add it with:

```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```
