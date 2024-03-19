# Deploy Nativeapp action v1

Provides automated deploying of your Nativeapp in your Snowflake account each time your CI/CD workflow runs. 

## Features
- Upload the source code file to the application stage defined in snowflake.yml.
- Create a new version for the application package using the manifest.yml version. 
- Create or upgrate the application object of the application package.

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