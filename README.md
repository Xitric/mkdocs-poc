# Documentation PoC with Material for MkDocs

## Install dependencies

Create a Python virtual environment named `venv` to install pip packages without polluting the whole system:

```shell
python -m venv venv
```

Then activate the virtual environment with:

```shell
# Powershell & CMD
.\venv\Scripts\activate

# Bash (Windows)
source venv/Scripts/activate

# Bash (Linux)
source venv/bin/activate
```

If the virtual environment is activated properly, the name of the environment will be displayed in your terminal.
You can also check if the virtual environment has been set by inspecting the environment variable `VIRTUAL_ENV`.

Now install all the required packages using the `requirements.txt` file:

```shell
python -m pip install -r requirements.txt
```

## Updating packages

To ensure that everyone uses the same versions of packages, all package versions are tracked in `requirements.txt`.
To update a package, install the new package version in your virtual environment using pip, and then update `requirements.txt` like so:

```shell
python -m pip freeze > requirements.txt
```

## Development

We encourage all users to install the VS Code [YAML extension](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml) to get schema validation and IntelliSense when editing `yml` configuration files.

To preview a documentation site at any time, simply run the corresponding command:

```shell
mkdocs serve -f ./mkdocs-internal.yml
mkdocs serve -f ./mkdocs.yml
```

A sample documentation site will then be available at <http://127.0.0.1:8000/>.

## Release

To release a new version of the documentation, such as `21.40.0`, run the following comand:

```shell
./scripts/release.sh "21.40.0"
```
