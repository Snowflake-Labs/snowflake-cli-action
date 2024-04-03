# Set up Snowflake CLI action v1

Set up snowflake CLI in your CI/CD workflow using pipx.

## Features
- Isolated instalation of snowflake-cli-labs.
- Set up a default config.toml in ~/.snowflake/.

## Inputs

### ` cli-version`

The specified Snowflake CLI version.


### `default-config-file-path`

Path to the config.toml file.


## Example usage

```yaml
name: deploy
on: [push]
jobs:
  version:
     name: "Check Snowflake CLI version"
     run-on: ubuntu-latest
     steps:  
        - uses: actions/snowflake-cli@V1
          with:
            cli-version: "2.1.0"
            config_file: "config.toml"

        - name: Test version
          run: snow --version
```