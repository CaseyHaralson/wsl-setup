# WSL Setup

## WSL Install

There are multiple ways to install WSL, but this is what I did last time:

1. Turn Windows features on or off
    - Virtual Machine Platform (on)
    - Windows Subsystem for Linux (on)
2. Reboot after making changes
3. Might have to download a version 2 kernel update and set default version
    - https://learn.microsoft.com/en-us/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package
4. Set the default WSL version to version 2: `wsl --set-default-version 2`
5. Check to make sure WSL2 is installed by running the following in a powershell terminal: `wsl --status`

EDIT: I think it is now possible to install with `wsl --install`
You would still need to check the status and whatnot afterward, but it looks like this is available now.

### WSL Memory Usage

If you use docker with WSL, docker will gobble up as much memory as possible so you will need to limit the usage.
Later versions of Windows actually only give 50% of the memory to WSL while earlier versions allowed up to 80% usage.

You can set a custom limit and some other settings by creating a file here: `%UserProfile%/.wslconfig`

The file should look like the following:

```
[wsl2]
memory=6GB
swap=0
...etc...
```

Additional configurations can be found here: https://learn.microsoft.com/en-us/windows/wsl/wsl-config#wslconfig

Restart after changing a setting, or use one of the other ways you can find online to get WSL to pick up the new settings.

## Pre-setup

### Windows Terminal

Install the Windows Terminal from the Windows Store. Then open the settings and set the startup default as Windows Terminal.

### Git

1. Install Git for Windows and clone a private Github directory or something to trigger a git credentials entry popup.
2. Make sure the credentials have been stored:
    - Search for Credential Manager in Windows and open it
    - Go to the Windows Credentials section and look for a "git:https://github.com" entry in the Generic Credentials section
3. If there isn't an entry, check to make sure that the manager is being used (looking for credential.helper=manager): `git config --list`

### Ubuntu

1. Install the latest Ubuntu LTS release from the Windows Store. Then click open to install Ubuntu.
2. Make sure that Ubuntu is running in WSL2 by running the following in a powershell terminal: `wsl -l -v`
    - If the version isn't 2, change the version: `wsl --set-version [Ubuntu Name] 2`
3. Set the default WSL distribution to Ubuntu (this can help with Docker because Docker installs two distributions that can't be used as the default): `wsl --set-default [Ubuntu Name]`
4. Set the Ubuntu git credential manager to be handled by the Windows git instance by running the following it an Ubuntu shell: `git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"`

### Docker

1. Make sure "Use the WSL 2 based engine" is checked in the Docker General settings.
2. Under Settings -> Resources -> WSL integration, make sure the Ubuntu version is enabled for integration.

## Setup

1. Clone this repo into the Ubuntu instance.
2. Run the setup script: `./setup.sh`
