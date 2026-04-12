## Project Environment Setup (Linux (or WSL) / macOS)

WARNING: Windows is not currently supported.



### Part 1 - System Prerequisite Setup

### 0) Install WSL2 + Ubuntu 24.04 (Windows)

1) Open **PowerShell (Admin)** and run:

```powershell
wsl --install
```

- If you want to explicitly install **Ubuntu 24.04 LTS** (recommended), first list available distros:

```powershell
wsl --list --online
```

Then install Ubuntu 24.04:

```powershell
wsl --install -d Ubuntu-24.04
```

2) Reboot Windows if prompted.

3) Launch **Ubuntu 24.04** from the Start Menu once, then finish the first-time setup (create username/password).

(Optional) Update WSL:

```powershell
wsl --update
```

(Optional) Confirm you are using WSL2:

```powershell
wsl -l -v
```

### 0.0) Get Comfortable using the command line

You can find which folder you are in:
```bash
pwd
```
And find files and directories in the current directory by using:
```bash
ls -l
```

And create a directory using:
```bash
mkdir directory_name
```

And change your current directory by using:
```bash
cd directory_name
```

### 0.1) Install Git

for Ubuntu (including WSL) terminal:

```bash
sudo apt update
sudo apt install -y git-all
git --version
```

for MacOS

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
```

### 0.2) Setup Git 

Set your Git identity:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```
Set these to the same credentials used for your Github account. 

It is highly recommended to learn Git Command Line basics (at least how to use the add, commit, push and pull commands).

### 0.3) Install Python venv
```bash
sudo apt-get update
sudo apt-get install libpython3-dev
sudo apt-get install python3-venv
```

### 0.4) Install Verilator (stable)

This project uses Verilator for linting and simulation. We require **Verilator >= 5.036**.

Run the official Git-based install script (installs to `/usr/local`, requires `sudo`):

```bash
./scripts/install_verilator_stable.sh
```

If the .sh script doesn't work try this first and rerun it:
```bash
sudo chmod +x ./install_verilator_stable.sh
```

(It may take some time)

Verify:

```bash
verilator --version
which verilator
```
It should return a location to the installation.

### 0.5) Install Icarus Verilog

This project also uses Icarus Verilog (`iverilog` + `vvp`) in some flows ( mainly code generation).

Run the cross-platform installer script:

```bash
./scripts/install_icarus.stable.sh
```

If the script is not executable, run:

```bash
chmod +x ./scripts/instal_icarus.stable.sh
./scripts/install_icarus.stable.sh
```

Verify:

```bash
iverilog -V
vvp -V
which iverilog
which vvp
```

It should return version information and installation paths.

### Part 2 - Project Environemt Setup

### 3) Create and activate a Python virtual environment (venv)

If you are not already in the project-venv folder, `cd` into it:
```bash
cd project-venv
```
Then create the venv. This allows you to isolate the project from other ones:
```bash
python3 -m venv venv
```
To actually use the venv, you have to activate it. Make sure you activate it every time you start the terminal:
```bash
source venv/bin/activate
```
If you do not activate the venv, the terminal will usually warn because you can contaminate the system-wide environment.

Note:
If you move to a different project, make sure you work in the environment created there.
For that, you first deactivate the venv of the current project
```bash
deactivate
```
Then follow the same source step to activate the new venv.

### 4) Run environment checks

```bash
./env_check.sh
```

## Notes
 all of the checks should appear as [OK] if anything faiils, retrace your steps or ask for help.

- If you are using VS Code Remote (WSL), it may inject a project `venv/bin` into `PATH`. This is normal, but always use:

  ```bash
  which python3
  which cocotb-config
  ```

  if you suspect version/path conflicts.

### 5) Install Coraltb
```bash
./scripts/install_coraltb.sh
```

### 6) Create Workspace
```bash
./scripts/create_workspace.sh
```

### 7) VS Code with WSL

You can now access WSL from VS Code. First, install this VS Code extension:

![alt text](doc/image.png)

Then click the button in the bottom left corner to start a remote connection to WSL:

![alt text](doc/image-1.png)
![alt text](doc/image-2.png)

Now you can use VS Code in WSL.

You will also need a linter extension (scans source code looking for errors, defects, stylistic issues, and questionable constructs) for Verilog. This is the current recommended one:

![alt text](doc/image-3.png)

Once installed, go to the extension settings and then go to the linting section:

### Note for native Ubuntu users

If you are already on Ubuntu 24.04 (not WSL), skip the WSL steps and start from section 0.1.
![alt text](doc/image-4.png)