# Requirements

We work with uv. You can install it [here](https://docs.astral.sh/uv/guides/install-python/)

After installing uv, run this command in the project repository root directory to install dependencies:

```bash
uv run sync         #  Install dependencies
```

To then run scripts:

```bash
uv run something.py #  Equivalent to python -m something.py
```

To use the environment in notebooks, simply select the `.venv` environment that was created in this repository as the kernel.

# mkdocs

For full documentation visit [mkdocs.org](https://www.mkdocs.org).

## Commands

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs -h` - Print help message and exit.

## Project layout

    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.

