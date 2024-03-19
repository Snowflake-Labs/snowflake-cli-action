# Set up snowcli action v1

Set up snowflake cli in your CI/CD workflow using pipx.

## Features
- Isolated instalation of snowflake-cli-labs.
- Set up a default config.toml in ~/.snowflake/.

## Inputs

### `default-config-file`

**Required** Path to the default config.toml file.


### `application-path`

Path to the application folder with snowflake.yml file.


## Example usage

```yaml
uses: actions/snowcli-deploy-nativeapp@V1
with:
  config_file: "config.toml"
  source_code_path: "my_app"
```