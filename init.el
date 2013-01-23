

;; Copyright 2012 Kristian Nygaard Jensen

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
(add-to-list 'load-path "~/lib/drupal-emacs/elisp")
(add-to-list 'load-path "~/lib/drupal-emacs/elisp/php-mode")
(add-to-list 'load-path "~/lib/drupal-emacs/elisp/geben")
;; (add-to-list 'load-path "~/lib/elisp/ecb-2.40/")

;; (load-file "~/lib/elisp/cedet-1.0.1/common/cedet.el")
;; (global-ede-mode 1)                      ; Enable the Project management system
;; (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
;; (global-srecode-minor-mode 1)            ; Enable template insertion menu


;; (require 'ecb)
;; (require 'ecb-autoloads)
(require 'coffee-mode)
(require 'doremi)
(require 'doremi-cmd)
(require 'doremi-frm)

(fset 'yes-or-no-p 'y-or-n-p)           ;replace y-e-s by y
(setq x-select-enable-primary nil)
(setq x-select-enable-clipboard t)
(setq visible-bell t)
(setq tags-revert-without-query t)

(autoload 'drupal-mode "drupal-mode" "Major mode for editing DRUPAL php code." t)
(require 'drupal-mode)
(require 'php-mode)
(require 'sql-completion)
(require 'color-theme)
(color-theme-initialize)
(setq mysql-password "staalanden")
(autoload 'geben "geben" "PHP Debugger on Emacs" t)

(add-to-list 'auto-mode-alist '("\\.php$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.module$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.install$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.txt$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.MD$" . markdown-mode))

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs-backups/.
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs-backups/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs-backups/backups/"))))
 '(safe-local-variable-values (quote ((eval setq project-root-dir (locate-dominating-file buffer-file-name ".dir-locals.el")))))
 '(tool-bar-mode nil))

(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)


;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs-backups/autosaves/" t)
(make-directory "~/.emacs-backups/backups/" t)

(add-hook 'markdown-mode-hook 'select-markdown-theme)

(defun select-markdown-theme ()
  "Set the prefered theme for markdown editing"
  (color-theme-pierson)
  (setq-default fill-column 80)
  (flyspell-mode t))

(setq sql-interactive-mode-hook
      (lambda ()
	(define-key sql-interactive-mode-map "\t" 'comint-dynamic-complete)
	(sql-mysql-completion-init)))

;; Enable directory local variables with remote files. This facilitates both
;; the (dir-locals-set-class-variables ...)(dir-locals-set-directory-class ...)
;; and the dir-locals.el approaches.
(defadvice hack-dir-local-variables (around my-remote-dir-local-variables)
  "Allow directory local variables with remote files, by temporarily redefining
     `file-remote-p' to return nil unconditionally."
  (flet ((file-remote-p (&rest) nil))
    ad-do-it))
(ad-activate 'hack-dir-local-variables)

(setq org-todo-keywords '((sequence "TODO(t)" "IN PROGRESS(i!/!)" "WAIT(w@/!)"  "|" "DONE(d@)" "CANCELED(c@)")))

(defun fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_FULLSCREEN" 0))
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(icy-mode 1)
(global-set-key (kbd "<f11>") 'fullscreen)


(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
