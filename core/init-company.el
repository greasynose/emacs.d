(el-get 'sync  'company-mode)

(add-hook 'after-init-hook 'global-company-mode)

(global-unset-key (kbd "TAB"))
(global-set-key (kbd "TAB") 'company-complete)

(provide 'init-company)
