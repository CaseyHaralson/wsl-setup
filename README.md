# WSL Setup

## WSL Install

There are multiple ways to install WSL, but this is what I did last time:

1. Turn Windows features on or off
    - Virtual Machine Platform (on)
    - Windows Subsystem for Linux (on)
2. Reboot after making changes
3. Might have to download a version 2 kernel update and set default version
    - https://learn.microsoft.com/en-us/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package
4. Check to make sure WSL2 is installed by running the following in a powershell terminal: `wsl --status`

## Pre-setup

### Windows Terminal

Install the Windows Terminal from the Windows Store. Then open the settings and set the startup default as Windows Terminal.

### Ubuntu

1. Install the latest Ubuntu LTS release from the Windows Store. Then click open to install Ubuntu.
2. Make sure that Ubuntu is running in WSL2 by running the following in a powershell terminal: `wsl -l -v`
    - If the version isn't 2, change the version: `wsl --set-version [Ubuntu Name] 2`

### Docker

1. Make sure "Use the WSL 2 based engine" is checked in the Docker General settings.
2. Under Settings -> Resources -> WSL integration, make sure the Ubuntu version is enabled for integration.
