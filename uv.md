# uv

A fast Python package and project manager.  
Some subcommands such as tool and python have their own usage documentation.  
More information: [https://docs.astral.sh/uv/reference/cli](https://docs.astral.sh/uv/reference/cli)

Create a new Python project in the current directory:

```bash
uv init
```

Create a new Python project at the specified path:

```bash
uv init path/to/directory
```

Add a new dependency to the project:

```bash
uv add package
```

Remove a dependency from the project:

```bash
uv remove package
```

View the dependency tree for the project:

```bash
uv tree
```

Run a script in the project's environment:

```bash
uv run path/to/script.py
```

Run a command (in this case the python console) in the project's environment:

```bash
uv run python
```

Update a project's environment from **`pyproject.toml`**:

```bash
uv sync
```

Create a lock file for the project's dependencies:

```bash
uv lock
```

List installed packages:
```bash
uv pip list
```

List installed packages and their versions:
```bash
uv pip freeze
```

Typical help:
```bash
uv --help
uv help

# To view the long help menu for a specific command, e.g., for uv init:
uv help init
```
