# SMACS (My Personal Doom Emacs config)

## Features
 - Company for autocompletion
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

Run 
```
doom sync && doom build
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

### Installing treesitter for language

1. M-x install-treesitter-language-grammar
2. Install. If not there, then add the grammar url to treesitter.el
```
(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
        (language-name github-repo master-branch-name src-location)
...
))
```

### Clojure notes

- Do not enable +lsp for clojure, this does not include dot completion for java objects. Instead use cider for auto completion.
- Use 'cider-jack-in' for project


![Logo](slogo.png)
