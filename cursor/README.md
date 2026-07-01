# Cursor CLI

This package contains the configuration files for Cursor AI Agent.

## Installation
```sh
curl https://cursor.com/install -fsS | bash
```

## Install Skills
To install a new skill run:
```sh
npx skills add <owner/repo@skill> -g
```

Here are common skills to install:
Terraform: `npx skills add antonbabenko/terraform-skill@skill -g`

## Running Cursor
Run the `agent` command to start the Cursor agent
