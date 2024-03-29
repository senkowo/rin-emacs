;;; ri-magit --- magit and the like -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'setup)

;;; --- Magit: ----

(setup (:pkg magit)
  (:also-load magit-todos)
  (:global "C-M-;" magit-status)	; TODO: even used???
  ;; TODO: is this necessary?
  (:option magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)
  ;; // leader keys
  (leader-key-def
    "v" '(:ignore t :which-key "magit")
    "vv" 'magit))

(setup (:pkg magit-todos)) ; TODO: do i need this?

;;; --- Forge: ----

;; Access github and gitlab commits/issues/pr/etc from Emacs:

(setup (:pkg forge)
  (:disabled))


(provide 'ri-magit)
;;; ri-magit.el ends here
