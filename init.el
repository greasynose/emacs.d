(add-to-list 'load-path "~/.emacs.d/core")
(add-to-list 'load-path "~/.emacs.d/modules")

(defvar wkd-dir (file-name-directory (or load-file-name (buffer-file-name)))
  "oh-my-emacs home directory.")

;; Now install el-get at the very first
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch
          ;; do not build recipes from emacswiki due to poor quality and
          ;; documentation
          el-get-install-skip-emacswiki-recipes)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  ;; build melpa packages for el-get
  (el-get-install 'package)
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("melpa" . "http://melpa.org/packages/")))
  (el-get-elpa-build-local-recipes))

;; enable git shallow clone to save time and bandwidth
(setq el-get-git-shallow-clone t)

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")


(require 'init-core)
(require 'init-company)
(require 'init-org)
(require 'init-python)
(require 'init-php)
