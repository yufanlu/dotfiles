;; fancy lambdas
(global-prettify-symbols-mode t)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package auto-compile
  :config (auto-compile-on-load-mode))

(setq load-prefer-newer t)

(use-package base16-theme
  :config
  (load-theme 'base16-gruvbox-dark-medium t))

(use-package company)
(add-hook 'after-init-hook 'global-company-mode)

(use-package lsp-mode)
(use-package lsp-python-ms
  :after lsp-mode
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))  ; or lsp-deferred

(use-package evil
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-escape
  :config
  (evil-escape-mode)
  (setq-default evil-escape-delay 0.2)
  (setq-default evil-escape-key-sequence "jk"))

;; (use-package linum-relative
;;   :commands (linum-relative-toggle linum-relative-on)
;;   :config
;;   (linum-on)
;;   (linum-relative-on)
;;   (setq linum-relative-backend 'display-line-numbers-mode))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))
 
(setq org-src-fontify-natively t)

(use-package org-bullets
  :init
  (add-hook 'org-mode-hook 'org-bullets-mode))
