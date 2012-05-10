;;;###autoload
(define-derived-mode drupal-mode php-mode "Drupal"
  "Major mode for DRUPAL coding.\n\n\\{drupal-mode-map}"
  (c-subword-mode t)
  (c-set-offset 'arglist-intro '+) ; for FAPI arrays and DBTNG
  (c-set-offset 'arglist-close '0)
  (setq c-basic-offset 2)
  (setq tab-width 2)
  (setq x-stretch-cursor t)
  (setq indent-tabs-mode nil)
  (setq fill-column 78)
  (setq show-trailing-whitespace t)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (global-set-key (kbd "<f5>") "grep -n -R --exclude-dir=.svn --exclude=*~ --exclude=#* --exclude=TAGS --exclude=*emconf* -i -e bootstrap . 2>")
  (global-set-key (kbd "<f6>") "$this->")
  (global-set-key (kbd "<f7>") "DIRECTORY_SEPARATOR")
  (global-set-key (kbd "<f12>") 'imenu-add-menubar-index)
  (global-set-key (kbd "<f8>") "__METHOD__.__FILE__.__LINE__")
  (add-hook 'after-save-hook 'compile-tags)
  (run-mode-hooks 'drupal-mode-hook)
)
(provide 'drupal-mode)