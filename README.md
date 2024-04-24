# Snowflake CLI Github Action

**Note:** Snowflake CLI Github Action is in early development phase. The project may change or be 
abandoned. Do not use for production use cases.

Streamlines installing and using [Snowflake CLI](https://docs.snowflake.com/developer-guide/snowflake-cli-v2/index) in your CI/CD workflows. The CLI is installed in 
isolated way making sure it won't conflict with dependencies of your project.  Automatically set up 
the input config file within the ~/.snowflake/ directory.


## Inputs

### ` cli-version`

The specified Snowflake CLI version. For example `2.2.0`. If not specified then latest version will be used.


### `default-config-file-path`

Path to the configuration file (config.toml) in your repository. The path must be relative to root of repository.


## Example usage

```yaml
name: deploy
on: [push]
jobs:
  version:
     name: "Check Snowflake CLI version"
     runs-on: ubuntu-latest
     steps:
          # Checkout step is necessary if you want to use a config file from repo
        - name: Checkout repo
          uses: actions/checkout@v4
          with:
            persist-credentials: false

          # Snowflake CLI installation
        - uses: Snowflake-Labs/snowflake-cli-action@v1
          with:
            cli-version: "latest"
            default-config-file-path: "config.toml"
        
          # Use the CLI
        - name: Test version
          run: snow --version
```
