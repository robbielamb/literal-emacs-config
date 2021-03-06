(if (file-exists-p "~/.cask/cask.el")
    (require 'cask "~/.cask/cask.el")
  (require 'cask))
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
(pallet-mode t)

(org-babel-load-file "~/.emacs.d/emacs.org")

