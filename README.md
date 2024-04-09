# Snowflake CLI Github Action

**Note:** Snowflake CLI Github Action is in early development phase. The project may change or be abandoned. Do not use for production use cases.

Streamlines installing and using [Snowflake CLI](https://docs.snowflake.com/developer-guide/snowflake-cli-v2/index) in your CI/CD workflows. The CLI is installed in isolated way making sure it won't conflict with dependencies of your project.

## Features
- Isolated instalation of snowflake-cli-labs.
- Set up a default config.toml in ~/.snowflake/.

## Inputs

### ` cli-version`

The specified Snowflake CLI version. For example `2.2.2`.


### `default-config-file-path`

Path to the config.toml file in your repository.


## Example usage

```yaml
name: deploy
on: [push]
jobs:
  version:
     name: "Check Snowflake CLI version"
     runs-on: ubuntu-latest
     steps:  
        - uses: Snowflake-Labs/snowflake-cli-action@v1
          with:
            cli-version: "2.1.0"
            config_file: "config.toml"

        - name: Test version
          run: snow --version
```
