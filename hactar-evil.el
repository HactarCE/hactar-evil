;;; hactar-evil.el --- Hactar-Evil keybindings file for Spacemacs
;; Copyright (c) 2018 HactarCE
;;
;; Author: HactarCE
;; URL: https://github.com/HactarCE/hactar-evil
;;
;; This file is not part of GNU Emacs.
;;
;;; License: The Unlicense

;; Inspiration taken from
;; https://github.com/wbolster/evil-colemak-basics/
;; https://github.com/patbl/colemak-evil/
;; and others

;; TODO more states: iedit, lisp, calc

;; TODO execute one command in normal
;; TODO string stuff (case, join, etc.)
;; TODO ss/xx/cc vs S/X/C
;; TODO next/prev search result (evil search? isearch? something else?)

;; FIXME unused keys do their normal Vim thing


(define-minor-mode hactar-evil-mode
  "An alternative keymap for Vim commands on Colemak based on ZXCV and UNEI."
  ;; :lighter "unei"
  :lighter "Ⓗ"
  :global t)

(provide 'hactar-evil-mode)


(hactar-evil-mode 1)


;;; Custom Avy commands
(defun avy-goto-open-paren ()
  (interactive)
  (evil-enclose-avy-for-motion
    (avy--generic-jump "(" nil 'post)))
(defun avy-goto-close-paren ()
  (interactive)
  (evil-enclose-avy-for-motion
    (avy--generic-jump ")" nil 'pre)))



;;; nil state
(evil-define-minor-mode-key nil hactar-evil-mode
  (kbd "M-u") #'previous-line
  (kbd "M-e") #'next-line
  (kbd "M-n") #'backward-char
  (kbd "M-i") #'forward-char)



;;; All states
(evil-define-minor-mode-key '(insert normal motion visual operator replace emacs) hactar-evil-mode
  (kbd "C-o") [escape])
;; (evil-define-minor-mode-key '(motion replace insert emacs) hactar-evil-mode
;;   (kbd "C-o") #'evil-normal-state
;;   [escape] #'evil-normal-state)

;; (evil-define-minor-mode-key 'normal hactar-evil-mode
;;   (kbd "C-o") #'evil-force-normal-state
;;   [escape] #'evil-force-normal-state)



;;;; Insert state

;;; Meta movement
(evil-define-minor-mode-key 'insert hactar-evil-mode
  (kbd "M-u") #'previous-line
  (kbd "M-e") #'next-line
  (kbd "M-n") #'backward-char
  (kbd "M-i") #'forward-char
  (kbd "M-l") #'backward-word
  (kbd "M-y") #'forward-word
  (kbd "M-o M-u") #'spacemacs/evil-insert-line-above
  (kbd "M-o M-e") #'spacemacs/evil-insert-line-below
  (kbd "M-o M-n") #'beginning-of-line
  (kbd "M-o M-i") #'end-of-line)



;;;; Motion states

(evil-define-minor-mode-key '(normal motion visual operator emacs) hactar-evil-mode

;;; UNUSED (FIXME better solution than this?)
  ;; "A" #'undefined
  ;; "R" #'undefined
  ;; "s" #'undefined
  ;; "S" #'undefined
  ;; "b" #'undefined
  ;; "B" #'undefined
  ;; "k" #'undefined
  ;; "K" #'undefined
  ;; "m" #'undefined
  ;; "M" #'undefined

;;; Selection shortcuts
  "a" evil-outer-text-objects-map
  "r" evil-inner-text-objects-map

;;; Basic navigation (luynei)
  "u" #'evil-previous-line
  "e" #'evil-next-line
  "n" #'evil-backward-char
  "i" #'evil-forward-char
  "l" #'evil-backward-word-begin
  "y" #'evil-forward-word-end
  (kbd "C-l") #'evil-beginning-of-line
  (kbd "C-y") #'evil-end-of-line
  "on" #'evil-beginning-of-line
  "oi" #'evil-end-of-line

;;; Fast navigation (LUYNEI)
  "U" (lambda () (interactive) (evil-previous-line 5))
  "E" (lambda () (interactive) (evil-next-line 5))
  "N" (lambda () (interactive) (evil-backward-char 5))
  "I" (lambda () (interactive) (evil-forward-char 5))
  "L" #'evil-backward-WORD-begin
  "Y" #'evil-forward-WORD-end

;;; Scrolling
  "oj" #'evil-goto-first-line
  "oh" #'evil-goto-line
  (kbd "M-n") #'evil-scroll-column-left
  (kbd "M-i") #'evil-scroll-column-right
  (kbd "M-u") #'evil-scroll-line-up
  (kbd "M-e") #'evil-scroll-line-down
  (kbd "M-l") (lambda () (interactive) (evil-scroll-column-left 20))
  (kbd "M-y") (lambda () (interactive) (evil-scroll-column-right 20))
  ;; (define-key evil-motion-state-map (kbd "M-y") #'evil-scroll-right
  "j" (lambda () (interactive) (evil-scroll-line-up 10))
  "h" (lambda () (interactive) (evil-scroll-line-down 10))
  "J" (lambda () (interactive) (evil-scroll-line-up 50))
  "H" (lambda () (interactive) (evil-scroll-line-down 50))

;;; Visual
  "t" nil
  "ts" #'evil-visual-char
  "tr" #'evil-visual-line
  "ta" #'evil-visual-block

;;; "Find"
  ;; Avy
  "fa" #'evil-avy-goto-char-2
  "fr" #'evil-avy-goto-char
  "fs" #'evil-avy-goto-subword-1
  "ft" #'evil-avy-goto-char-timer
  "fl" #'evil-avy-goto-line
  "fw" #'evil-avy-goto-word-1
  "fp" #'evil-avy-goto-char-in-line
  "fu" #'evil-avy-goto-line-above
  "fe" #'evil-avy-goto-line-below
  ;; Custom Avy motions
  ;; TODO more of these
  "f9" #'avy-goto-open-paren
  "f(" #'avy-goto-open-paren
  "f0" #'avy-goto-close-paren
  "f)" #'avy-goto-close-paren
  ;; TODO org-mode keybinds
  ;; Generic Vim
  "fn" #'evil-find-char-to-backward
  "fi" #'evil-find-char-to
  "fN" #'evil-find-char-backward
  "fI" #'evil-find-char

;;; Misc
  "oz" #'evil-emacs-state
  "`" #'evil-repeat
  "\"" #'evil-use-register
  "'" (kbd "\" *")

  )



;;;; Normal state
(evil-define-minor-mode-key 'normal hactar-evil-mode

;;; Operators
  ;; "q" nil
  ;; "Q" nil
  ;; "w" nil
  ;; "W" nil
  "p" #'evil-replace
  "P" #'evil-replace-state
  "s" #'evil-change
  "S" #'evil-change-line
  ;; "T" nil
  "d" #'evil-delete-char
  "D" #'evil-delete-backward-char
  "x" #'evil-delete
  "X" #'evil-delete-line
  "c" #'evil-yank
  "C" #'evil-yank-line
  "v" #'evil-paste-after
  "V" #'evil-paste-before

;;; Misc
  "ou" #'spacemacs/evil-insert-line-above
  "oe" #'spacemacs/evil-insert-line-below
  "oU" #'spacemacs/insert-line-above-no-indent
  "oE" #'spacemacs/insert-line-below-no-indent

;;; Insert
  ;; luynei
  "tu" #'evil-open-above
  "te" #'evil-open-below
  "tn" #'evil-insert
  "ti" #'evil-append
  "tl" (kbd "l t n")
  "ty" (kbd "y t i")
  ;; LUYNEI (TODO what about UNEI?)
  "tL" (kbd "L t n")
  "tY" (kbd "Y t i")
  ;; o luynei
  "tou" (kbd "o u t u") ;; TODO accept arg and rewrite
  "toe" (kbd "o e t e")
  "ton" #'evil-insert-line
  "toi" #'evil-append-line

)



;;; Normal and insert states
(evil-define-minor-mode-key '(normal insert replace) hactar-evil-mode

  ;; Move line
  (kbd "C-S-u") #'move-text-line-up
  (kbd "C-S-e") #'move-text-line-down)



;;;; Commenting
(evil-define-minor-mode-key 'normal hactar-evil-mode
  "t/" #'comment-dwim
  (kbd "C-?") #'evilnc-comment-operator)
(evil-define-minor-mode-key '(normal insert replace) hactar-evil-mode
  (kbd "C-/") #'evilnc-comment-or-uncomment-lines)



;;;; Undo/redo

;;; Basic
(evil-define-minor-mode-key 'normal hactar-evil-mode
  (kbd "z") #'undo)
(evil-define-minor-mode-key '(normal insert replace) hactar-evil-mode
  (kbd "C-z") #'undo)

;;; undo-tree
(with-eval-after-load 'undo-tree
  (evil-define-minor-mode-key 'normal hactar-evil-mode
    "z" #'undo-tree-undo
    "Z" #'undo-tree-redo
    "oz" #'undo-tree-visualize)
  (evil-define-minor-mode-key '(normal insert replace) hactar-evil-mode
    (kbd "C-z") #'undo-tree-undo
    (kbd "C-S-z") #'undo-tree-redo))
