# Software Installation Wizard Script

## Overview

The Software Installation Wizard is a versatile Bash script for automating software checks and installations across different Linux distributions. It supports `apt-get`, `yum`, and `zypper` package managers, offering a more customized setup process with user input for each software installation and enhanced error handling for a smoother experience.

## Features

- Supports multiple package managers: `apt-get`, `yum`, and `zypper`.
- Prompts user for each software package installation, allowing for customization.
- Performs error checking to ensure successful installations.

## Prerequisites

- Bash shell
- One of the supported package managers installed
- Administrative (sudo) privileges

## Usage

To ensure your system has the necessary software:

1. Open the script and review the `software_list` array, updating it with any additional packages you need.

2. Make the script executable:

```bash
chmod +x software-installation-wizard.sh
```

3. Run the script:

```bash
./software-installation-wizard.sh
```

4. Respond to prompts to install or skip each package.

## How It Works

- Upon execution, the script determines the available package manager and sets the appropriate commands for updating package lists and installing software.
- It updates the package lists to prepare for installations.
- The user is then prompted for each software package listed, deciding whether to proceed with its installation.
- The script checks if each software is already installed to prevent redundancy and proceeds with the installation if necessary, including error handling to manage failed installations gracefully.

## Expanding the Script

- Further customize the script to handle specific version requirements for software packages.
- Add functionality to remove specified software, offering a full package management solution.
- Include logging for installations and errors for audit trails or troubleshooting.

This wizard streamlines the software setup process, accommodating diverse environments and user preferences for a tailored system configuration.
