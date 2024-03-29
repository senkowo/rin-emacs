;;; ri-windows --- emacs window management -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'setup)

;;; --- Window auto balance after splitting: ----

(defun ri/delete-window-auto-balance ()
  "Delete currentt window, then balance windows."
  (interactive)
  (delete-window)
  (balance-windows))

(defun ri/split-window-right-auto-balance ()
  "Split window to the right, then balance windows."
  (interactive)
  (split-window-right)
  (balance-windows))

(defun ri/split-window-below-auto-balance ()
  "Split window below, then balance windows."
  (interactive)
  (split-window-below)
  (balance-windows))

(global-set-key (kbd "C-x 0") #'ri/delete-window-auto-balance)
(global-set-key (kbd "C-x 2") #'ri/split-window-below-auto-balance)
(global-set-key (kbd "C-x 3") #'ri/split-window-right-auto-balance)

;;; --- Ace window: ----

(setup (:pkg ace-window)
  (setq aw-scope 'frame)
  (setq aw-keys '(?a ?o ?e ?u ?h ?t ?n ?g ?c ?r)) ; TODO: qwerty variant
  (defvar aw-dispatch-alist ; Maybe just move all these into qwerty...?...
    '((?d aw-delete-window "Delete Window")
      (?1 delete-other-windows "Delete Other Windows")
      (?s aw-split-window-horz "Split Horz Window")
      (?v aw-split-window-vert "Split Vert Window")
      (?, aw-split-window-fair "Split Fair Window")
      (?o aw-flip-window "Other Window")
      (?w aw-swap-window "Swap Windows")
      (?m aw-move-window "Move Window")
      (?c aw-copy-window "Copy Window")
      (?b aw-switch-buffer-in-window "Select Buffer")
      (?B aw-switch-buffer-other-window "Switch Buffer Other Window")
      (?? aw-show-dispatch-help))
    "List of actions for `aw-dispatch-default'.")
  (global-set-key (kbd "M-o") 'ace-window))

;;; --- Windows leader keybinds: ----

;; replace evil-direction w/ package
(leader-key-def
  "w"  '(:ignore t :which-key "window")
  "wv" '(split-window-right :which-key "v-split")
  "ws" '(split-window-below :which-key "h-split")
  "wd" '(delete-window :which-key "close window")
  "wc" '(delete-window :which-key "close window")
  "ww" '(evil-window-next :which-key "next-window")
  "wW" '(evil-window-prev :which-key "prev-window")
  ;;
  "wp" '(windmove-up :which-key "window-up")
  "wt" '(windmove-up :which-key "window-up")
  "wn" '(windmove-down :which-key "window-down")
  ;;
  "wb" '(windmove-left :which-key "window-left")
  "wf" '(windmove-right :which-key "window-right")
  "ww" '(aw-flip-window :which-key "other-window")
  ;;
  ;; "wH" '(evil-window-move-far-left :which-key "move left")
  ;; "wJ" '(evil-window-move-very-bottom :which-key "move down")
  ;; "wK" '(evil-window-move-very-top :which-key "move up")
  ;; "wL" '(evil-window-move-far-right :which-key "move right")
  "wa" '(hydra-window-adjust/body :which-key "window-ratio-adjust")
  "wi" '(:ignore t :which-key "minibuffer")
  "wie" 'minibuffer-keyboard-quit
  "wio" 'switch-to-minibuffer)



(provide 'ri-windows)
;;; ri-windows.el ends here
