# Switchblade 🗡

Tool for saving, finding and executing commands quickly (built using [fzf](https://github.com/junegunn/fzf)).

![demo](demo.gif)

## DSL

The DSL for Switchblade is a simple YAML file that defines the commands you want to save. These commands are installed to `~/.sb/commands`.

For example:
```yaml
# ~/.sb/commands/nmap.yaml
nmap:
  - command: nmap -sV --script ~/.sb/vendor/nmap-vulners/vulners.nse $RHOST
    description: scan for known vulnerabilities using nmap-vulners
    args:
      RHOST: remote host
  - command: nmap -sV --script ~/.sb/vendor/nmap-vulners/vulners.nse $RHOST -p $RPORTS
    description: scan for known vulnerabilities using nmap-vulners (specific ports)
    args:
      RHOST: remote host
      RPORTS: ports to scan
```

You can then run `sb` to open up the interface. Using `fzf`, you can search for commands either by the command itself or its description.  

Notice in the demo that the preview window will display the arguments and their corresponding value for the environment variable of the same name. Pressing enter will paste the command into the terminal but not execute it. This is similar how to fzf history plugins work, where you can preview the command before executing it.

## Installation

You can install the `sb` script by running the following command:

```bash
$ make install
```

This installs the `sb` script into `/usr/local/bin` and also makes a `~/.sb` directory with symlinks for `commands` and `vendor`. The `commands` directory is where you should put your command YAML files. The `vendor` directory contains any external scripts or tools that you want to use in your commands. You can extend the Makefile to install additional vendor files, as needed.

### Quick Shortcut (zsh Widget)

You can create a zsh widget to quickly open the Switchblade interface with a single key combination. This is useful if you want to quickly open the interface without having to type `sb` every time. To do this, add the following to your `~/.zshrc` file:

```bash
function switchblade() {
  sb
}
zle -N switchblade
bindkey "^s" switchblade
```

In this example, `CTRL+s` will open the Switchblade interface.