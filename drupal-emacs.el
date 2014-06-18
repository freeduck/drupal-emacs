;; Copyright 2013 Kristian Nygaard Jensen

;; This file is part of drupal-emacs.

;; drupal-emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; drupal-emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with drupal-emacs.  If not, see <http://www.gnu.org/licenses/>.
(let ((default-directory (file-name-directory load-file-name)))
  (add-to-list 'load-path (file-truename "./elisp"))
  (add-to-list 'load-path (file-truename "./elisp/bookmark-plus"))
  (add-to-list 'load-path (file-truename "./elisp/geben"))
  (add-to-list 'load-path (file-truename "./elisp/icicles"))
  (add-to-list 'load-path (file-truename "./elisp/php-mode"))
  (add-to-list 'load-path (file-truename "./elisp/feature-mode"))
  (add-to-list 'load-path (file-truename "./elisp/coffee-mode"))
  (add-to-list 'load-path (file-truename "./elisp/web-mode"))
  (add-to-list 'load-path (file-truename "./elisp/paredit")))


(defun drupal-emacs()
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (package-initialize)
  (package-refresh-contents)

  (defvar my-packages '(starter-kit
                        starter-kit-bindings
                        magit
                        magit-gitflow
                        dired-details+
                        bookmark+
                        dired+))
  (mapc 'package-install  (remove-if 'package-installed-p my-packages))
  
  (require 'icicles)
  (require 'dired+)
  (require 'bookmark+)
  (require 'php-mode)
  (require 'web-mode)

  (icy-mode 1)
  (load-theme 'manoj-dark t)
  (show-paren-mode t)

  (fset 'yes-or-no-p 'y-or-n-p)           ;replace y-e-s by y
  (setq x-select-enable-primary nil)
  (setq x-select-enable-clipboard t)
  (setq visible-bell t)
  (setq tags-revert-without-query t)
  (setq-default indent-tabs-mode nil)
  (setq-default bmkp-prompt-for-tags-flag t)
  (autoload 'drupal-mode "drupal-mode" "Major mode for editing DRUPAL php code." t)
  (autoload 'feature-mode "feature-mode" "Major mode for editing BDD stories" t)
  (autoload 'coffee-mode "coffee-mode" "Major mode for editing coffee scripts" t)
  (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)

  ;;(add-hook 'drupal-mode-hook       #'enable-paredit-mode)
  ;;(add-hook 'php-mode-hook       #'enable-paredit-mode)
  (add-hook 'js-mode-hook       #'enable-paredit-mode)


  ;;(add-to-list 'auto-mode-alist '("\\.php$" . drupal-mode))
  (add-to-list 'auto-mode-alist '("\\.inc$" . drupal-mode))
  (add-to-list 'auto-mode-alist '("\\.module$" . drupal-mode))
  (add-to-list 'auto-mode-alist '("\\.install$" . drupal-mode))
  (add-to-list 'auto-mode-alist '("\\.test$" . drupal-mode))
  (add-to-list 'auto-mode-alist '("\\.txt$" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.MD$" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))
  (add-to-list 'auto-mode-alist '("\\.story$" . feature-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))



  (global-set-key (kbd "<f9>") 'bmkp-file-all-tags-jump)
  (global-set-key (kbd "<f11>") 'icicle-dired-project)

  (recentf-mode 1)
  (setq recentf-max-menu-items 25)
  (global-set-key "\C-x\ \C-r" 'recentf-open-files)
  (global-set-key "\M->" 'end-of-buffer)

  (add-hook 'markdown-mode-hook 'select-markdown-theme)
  (autoload 'geben "geben" "DBGp protocol frontend, a script debugger" t)
  (setq org-todo-keywords '((sequence "TODO(t)" "IN PROGRESS(i!/!)" "WAIT(w@/!)"  "|" "DONE(d@)" "CANCELED(c@)")))
  )

(defun select-markdown-theme ()
  "Set the prefered theme for markdown editing"
  (setq-default fill-column 80)
  (flyspell-mode t)
  )


(provide 'drupal-emacs)
