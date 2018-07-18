# hactar-evil

My Colemak configuration for Spacemacs Evil

## Installation Instructions

1. Install [Spacemacs](https://github.com/syl20bnr/spacemacs/)
2. `git clone https://github.com/HactarCE/hactar-evil ~/.emacs.d/private/hactar-evil`
3. Add `(load "~/.emacs.d/private/hactar-evil/hactar-evil")` to the `dotspacemacs/user-config` section in `~/.spacemacs`

Or, if you plan on making frequent changes, use this instead:

```elisp
(defun reload-hactar-evil ()
  (interactive)
  (load "~/.emacs.d/private/hactar-evil/hactar-evil"))

(spacemacs/set-leader-keys "R" #'reload-hactar-evil)
(reload-hactar-evil)
```

