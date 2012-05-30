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

(fset 'yes-or-no-p 'y-or-n-p)           ;replace y-e-s by y
(setq x-select-enable-primary nil)
(setq x-select-enable-clipboard t)
(setq visible-bell t)
(setq tags-revert-without-query t)

(autoload 'drupal-mode "drupal-mode" "Major mode for editing DRUPAL php code." t)
(require 'drupal-mode)
(require 'php-mode)
(autoload 'geben "geben" "PHP Debugger on Emacs" t)

(add-to-list 'auto-mode-alist '("\\.php$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.module$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.install$" . drupal-mode))


;; Enable directory local variables with remote files. This facilitates both
;; the (dir-locals-set-class-variables ...)(dir-locals-set-directory-class ...)
;; and the dir-locals.el approaches.
(defadvice hack-dir-local-variables (around my-remote-dir-local-variables)
  "Allow directory local variables with remote files, by temporarily redefining
     `file-remote-p' to return nil unconditionally."
  (flet ((file-remote-p (&rest) nil))
    ad-do-it))
(ad-activate 'hack-dir-local-variables)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((eval setq project-root-dir (locate-dominating-file buffer-file-name ".dir-locals.el"))))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
