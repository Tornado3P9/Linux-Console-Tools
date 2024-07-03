## VSCode Extensions

### See the currently installed extensions
```bash
code --list-extensions
```

### Version A
```bash
#!/bin/bash

extensions=(
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
