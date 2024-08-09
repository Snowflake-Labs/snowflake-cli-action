Snowflake CLI Github Action
===========================

**Note:** Snowflake CLI Github Action is in Preview.

## Table of contents

- [Snowflake CLI Github Action](#snowflake-cli-github-action)
  - [Table of contents](#table-of-contents)
  - [Usage](#usage)
  - [Inputs](#inputs)
    - [` cli-version`](#-cli-version)
    - [`default-config-file-path`](#default-config-file-path)
  - [How to safely configure the action in your CI/CD workflow](#how-to-safely-configure-the-action-in-your-cicd-workflow)
    - [Using config.toml file](#using-configtoml-file)
      - [1. Add `config.toml` to your repository:](#1-add-configtoml-to-your-repository)
      - [2. Store credentials in GitHub Secrets:](#2-store-credentials-in-github-secrets)
      - [3. Map secrets to environment variables:](#3-map-secrets-to-environment-variables)
      - [4. Configure the Snowflake CLI Action:](#4-configure-the-snowflake-cli-action)
      - [Full example](#full-example)
    - [Using temporary connection](#using-temporary-connection)
      - [1. Store credentials in GitHub Secrets:](#1-store-credentials-in-github-secrets)
      - [2. Map Secrets to environment variables using generic format:](#2-map-secrets-to-environment-variables-using-generic-format)
      - [3. Configure the Snowflake CLI Action:](#3-configure-the-snowflake-cli-action)
      - [4. Execute snow command using --temporary-connection flag:](#4-execute-snow-command-using---temporary-connection-flag)
      - [Full example](#full-example-1)
  - [References](#references)



## Usage

Streamlines installing and using [Snowflake CLI](https://docs.snowflake.com/developer-guide/snowflake-cli-v2/index) in your CI/CD workflows. The CLI is installed in 
isolated way making sure it won't conflict with dependencies of your project.  Automatically set up 
the input config file within the ~/.snowflake/ directory.

This actions enables automation of your Snowflake CLI tasks, such as deploying Native Apps or running Snowpark scripts within your Snowflake environment, etc.

## Inputs

### ` cli-version`

The specified Snowflake CLI version. For example `2.2.0`. If not specified then latest version will be used.


### `default-config-file-path`

Path to the configuration file (config.toml) in your repository. The path must be relative to root of repository.


## How to safely configure the action in your CI/CD workflow
To set up Snowflake credentials for a specific connection follow these steps. 

### Using config.toml file
#### 1. Add `config.toml` to your repository:
Create a `config.toml` file at the root of your repository with an empty connection configuration. For example:

  ```toml
  [connections]
  [connections.myconnection]
  user = ""
  password = ""
  ```

This file serves as a template and is preferable to not contain any actual credentials.


#### 2. Store credentials in GitHub Secrets:
Store each credential (e.g., account, password) in GitHub Secrets. Refer to the [GitHub Actions documentation](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions#creating-secrets-for-a-repository) for detailed instructions on how to create and manage secrets for your repository.



#### 3. Map secrets to environment variables:
Map each secret to an environment variable using the format `SNOWFLAKE_CONNECTIONS_<connection-name>_<key>=<value>`. This overrides the credentials defined in `config.toml`. For example:

```yaml
env:
  SNOWFLAKE_CONNECTIONS_MYCONNECTION_PASSWORD: ${{ secrets.SNOWFLAKE_PASSWORD }}
  SNOWFLAKE_CONNECTIONS_MYCONNECTION_ACCOUNT: ${{ secrets.SNOWFLAKE_ACCOUNT }}
```

#### 4. Configure the Snowflake CLI Action:
Add the `default-config-file-path` parameter to the Snowflake CLI action step in your workflow file. This specifies the path to your `config.toml` file. For example:

```yaml
- uses: Snowflake-Labs/snowflake-cli-action@v1
  with:
    cli-version: "latest"
    default-config-file-path: ".\config.toml"
```

Replace `latest` with a specific version of Snowflake CLI action if needed.


#### Full example

**Configuration file**

```
default_connection_name = "myconnection" 
  
[connections] 
[connections.myconnection]
user = ""
password = ""
```



**Pipeline**
```yaml
name: deploy
on: [push]
jobs:
  version:
     name: "Check Snowflake CLI version"
     runs-on: ubuntu-latest
     env:
        SNOWFLAKE_CONNECTIONS_MYCONNECTION_PASSWORD: ${{ secrets.SNOWFLAKE_PASSWORD }}
        SNOWFLAKE_CONNECTIONS_MYCONNECTION_ACCOUNT: ${{ secrets.SNOWFLAKE_ACCOUNT }}
        SNOWFLAKE_CONNECTIONS_MYCONNECTION_USER: ${{ secrets.SNOWFLAKE_ACCOUNT }}
        SNOWFLAKE_CONNECTIONS_MYCONNECTION_DATABASE: ${{ secrets.SNOWFLAKE_ACCOUNT }}


     steps:
          # Checkout step is necessary if you want to use a config file from your repo
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
          run: |
           snow --version
           snow connection test
```


### Using temporary connection

#### 1. Store credentials in GitHub Secrets:
  Store each credential (e.g., account, password) in GitHub Secrets. Refer to the [GitHub Actions documentation](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions#creating-secrets-for-a-repository) for detailed instructions on how to create and manage secrets for your repository.



#### 2. Map Secrets to environment variables using generic format:
  Map each secret to an environment variable using the generic format `SNOWFLAKE_<key>=<value>`. For example:

  ```yaml
  env:
    SNOWFLAKE_PASSWORD: ${{ secrets.SNOWFLAKE_PASSWORD }}
    SNOWFLAKE_ACCOUNT: ${{ secrets.SNOWFLAKE_ACCOUNT }}
  ```

#### 3. Configure the Snowflake CLI Action:
Add the Snowflake Cli Action to the pipeline:

  ```yaml
  - uses: Snowflake-Labs/snowflake-cli-action@v1
    with:
      cli-version: "latest"
  ```

 Replace `latest` with a specific version of Snowflake CLI action if needed.

#### 4. Execute snow command using --temporary-connection flag:
```yaml
  - name: Test connection
    run: |
      snow connection test --temporary-connection 
```


#### Full example

**Pipeline**
```yaml
name: deploy
on: [push]
jobs:
  version:
     name: "Check Snowflake CLI version"
     runs-on: ubuntu-latest
     env:
        SNOWFLAKE_PASSWORD: ${{ secrets.SNOWFLAKE_PASSWORD }}
        SNOWFLAKE_ACCOUNT: ${{ secrets.SNOWFLAKE_ACCOUNT }}
        SNOWFLAKE_USER: ${{ secrets.SNOWFLAKE_ACCOUNT }}
        SNOWFLAKE_DATABASE: ${{ secrets.SNOWFLAKE_ACCOUNT }}


     steps:
          # Checkout step is necessary if you want to use a config file from your repo
        - name: Checkout repo
          uses: actions/checkout@v4
          with:
            persist-credentials: false

          # Snowflake CLI installation
        - uses: Snowflake-Labs/snowflake-cli-action@v1
          with:
            cli-version: "latest"
        
          # Use the CLI
        - name: Test version
          run: |
           snow connection test --temporary-connection 
```

## References

- [Snowflake credentials using environment variables](https://docs.snowflake.com/en/developer-guide/snowflake-cli-v2/connecting/specify-credentials#how-to-use-environment-variables-for-snowflake-credentials). 
- [Defining environment variables within your Github CI/CD workflow](https://docs.github.com/en/actions/learn-github-actions/variables#defining-environment-variables-for-a-single-workflow).