(require 'cask "~/.cask/cask.el")
(cask-initialize)


(when (not (cl-remove-if-not
            (lambda (p) (equal 'org (car p)))
            package-alist))
  (message "no org-mode package round; installing now...")
  (package-install 'org))


(require 'org)
(when (string-match "^[01234567]" (org-version))
  (warn "Org-Mode is out of date. We expect org 8 or higher."))

(require 'pallet)

(org-babel-load-file "~/.emacs.d/emacs.org")


;; Always undo tree
(require 'undo-tree)
(global-undo-tree-mode)

;; Include go mode!
;;(add-to-list 'load-path "~/Projects/go/misc/emacs" t)
;;(require 'go-mode-load)
(setq gofmt-command "goimports")

(server-start)
