# reverse-alias-search

A lightweight Zsh plugin that allows you to "reverse search" your aliases using [fzf](https://github.com/junegunn/fzf).

Type a command (or part of one), press the hotkey, and select the matching alias. The plugin will replace your current input with the alias name and move your cursor to the end of the line.

## Features

* **Reverse Lookup:** Type a command (e.g., `git commit`) and find the corresponding alias (e.g., `gc`).
* **Fuzzy Search:** Filter aliases by name or command definition.
* **Smart Replacement:** Replaces your current buffer with the selected alias.
* **Cursor Management:** Automatically jumps the cursor to the end of the line after insertion.
* **Previews:** Shows the full command expansion in an fzf preview window.

## Prerequisites

* **Zsh**
* **[fzf](https://github.com/junegunn/fzf)** (Must be installed and in your PATH)

## Installation

### Antigen

Add the following to your `.zshrc` where you load your bundles:

```zsh
antigen bundle forksofpower/reverse-alias-search
# OR if loading locally:
# antigen bundle /path/to/local/reverse-alias-search

```

### Oh My Zsh

1. Clone this repository into your custom plugins directory:
```bash
git clone https://github.com/forksofpower/reverse-alias-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/reverse-alias-search

```


2. Add the plugin to the list of plugins in your `.zshrc`:
```zsh
plugins=(... reverse-alias-search)

```



### Zplug

```zsh
zplug "forksofpower/reverse-alias-search"

```

### Manual

1. Clone the repo:
```bash
git clone https://github.com/forksofpower/reverse-alias-search ~/reverse-alias-search

```


2. Source the script in your `.zshrc`:
```zsh
source ~/reverse-alias-search/reverse-alias-search.plugin.zsh

```



## Usage

1. Start typing a command in your terminal (e.g., `ls -lah`).
2. Press **`Ctrl+o`** (default binding).
3. `fzf` will open, pre-filled with your query.
4. Select the desired alias (e.g., `ll`).
5. The prompt will update to `ll` and the cursor will move to the end.

## Configuration

### Custom Keybinding

The default keybinding is **`Ctrl+o`**. You can override this by defining `ZSH_FZF_ALIAS_BIND` **before** loading the plugin.

**Example (.zshrc):**

```zsh
# Bind to Alt+a instead of Ctrl+o
export ZSH_FZF_ALIAS_BIND='^[a'

# Load the plugin
antigen bundle forksofpower/reverse-alias-search

```
