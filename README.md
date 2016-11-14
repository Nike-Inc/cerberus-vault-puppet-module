# nike-vault

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with vault](#setup)
    * [What vault affects](#what-vault-affects)
    * [Setup requirements](#setup-requirements)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Installed Files - What gets installed](#installed-files)

## Overview

This module installs Vault for Cerberus and an upstart script.

## Module Description

Vault secures, stores, and tightly controls access to tokens, passwords, certificates, API keys, 
and other secrets in modern computing. Vault handles leasing, key revocation, key rolling, and 
auditing. Vault presents a unified API to access multiple backends: HSMs, AWS IAM, SQL databases, 
raw key/value, and more. 

More Information: (https://vaultproject.io/)

## Setup

### What vault affects

This module should be run only on a instance that will be dedicated to running vault.

### Setup Requirements 

This puppet module assumes the base image already has tools like unzip and awscli installed.

## Usage

Start vault with upstart as root: `start vault`
Stop vault with upstart as root: `stop vault`

The process runs as a system user named `vault`

### Installed Files

Upstart Config: `/etc/init/vault.conf`
Binary: `/usr/local/bin/*`
Configuration: `/etc/vault/*`
Log: `/var/log/vault/*`
