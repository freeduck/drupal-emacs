(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/elisp/php-mode")
(require 'php-mode)

(fset 'yes-or-no-p 'y-or-n-p)           ;replace y-e-s by y
(setq x-select-enable-primary nil)
(setq x-select-enable-clipboard t)

(autoload 'drupal-mode "drupal-mode" "Major mode for editing DRUPAL php code." t)
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


(defun compile-tags ()
  "compile etags for the current project"
  (interactive)
  (setq current-dir default-directory )
  (cd project-root-dir)
  (shell-command "rm TAGS;find -L . -name \"*.php\" -o -name \"*.inc\" -o -name \"*.module\" -exec ctags --language-force=PHP -ea {} \\;")
  ;(compile "rm TAGS;find -L . -name \"*.php\" -o -name \"*.inc\" -o -name \"*.module\" -exec ctags --language-force=PHP -ea {} \\;")
  (cd current-dir))
(add-hook 'after-save-hook 'compile-tags)

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
