## VSCode Extensions

### See the currently installed extensions
```bash
code --list-extensions
```

### Version A
```bash
#!/bin/bash

extensions=(
  fill-labs.dependi
  hashicorp.terraform
  mechatroner.rainbow-csv
  ms-python.debugpy
  ms-python.python
  ms-python.vscode-pylance
  ms-vscode.makefile-tools
  reditorsupport.r
  rust-lang.rust-analyzer
  slint.slint
  tamasfe.even-better-toml
  vadimcn.vscode-lldb
)

for extension in "${extensions[@]}"; do
  code --install-extension "$extension"
done
```

### Version B (when reading the list from a file)
```bash
while read extension; do
  code --install-extension "$extension"
done < extensions-list.txt
```

## Shortcuts

**`ESC`**                          stop syntax help

**`F12`**                          Jump to highlighted function name

**`Ctrl+Space`**                   to trigger the suggestions manually

**`Strg+D`**                       add name to multiple curser selection

**`Strg+K`**                       remove active name from multiple curser selection

**`Alt`**                          add multiple cursors by holding the Alt key and clicking with the left mouse button at the start of each word or line where you want to add a cursor

**`Strg + Shift + I`**             Format the code / Beautify

**Optional:** ~/.config/VSCodium/User/settings.json
```
{
    "editor.formatOnSave": true
}
```
