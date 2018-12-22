# dot-files
My bash "dot" configuration files e.g. ".bashrc, .bash_aliases, etc.."

---

## Installation

---

### Clone Repo:

```bash
    # HTTPS URL:
    git clone https://github.com/Hlight/dot-files.git

    # SSH URL:
    git clone  git@github.com:Hlight/dot-files.git

```

### Disable Current dotfiles:

```bash
# Go to user home directory.
cd ~

# Recursive Command to Rename .bash_whatever to off.bash_whatever.
find . -maxdepth 1 -name '.bash_*' -exec bash -c 'echo mv $0 ${0/.bash/off.bash}' {} \;
```

### Create Symlinks to Repo dot files:

```bash
# Go to local dot-files repository.
cd ~/Code/github/Hlight/dot-files/

# Create symlinks from dot-files repo to user 'Home' directory:
ln -s .bash_* ~
```

---

(Tested on OSX 10.14; GNU bash, version 3.2.57(1)-release (x86_64-apple-darwin18))