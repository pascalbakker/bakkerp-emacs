# SMACS (My Personal Doom Emacs config)

## Features
 - Vertico popup menu for M-x and searches
 - Treesitter and lsp settings for better code editing
 - Personal tweaks to make doom more usable
 - Custom EMMS layout with music album art
 - Dired tweaks for usability
 - Fullscreen mode
 - Other random settings

## Installation

> ⚠️ Requires [Doom Emacs](https://github.com/doomemacs/doomemacs) and Emacs 29+

1. Clone Doom Emacs:

```
bash
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
```

## Notes

### Aider LLM setup

1. Create a file data/llm.el 
2. Create this file

```
(defvar anthropic-api-key "[ANTHROPIC_KEY]")
```

### Setting default vterm shell

In vterm.el you can set the shell to

```
(setq vterm-shell "/bin/zsh") ;; replace with your shell
```

![Logo](slogo.png)
