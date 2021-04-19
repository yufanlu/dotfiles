(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;; (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(package-refresh-contents)
(package-initialize)

;; (require 'use-package-ensure)
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-always-ensure t)

(use-package evil
  :init      ;; tweak evil's configuration before loading it
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (evil-mode))

(use-package evil-collection
  :after evil
  :config
  (setq evil-collection-mode-list '(dashboard dired ibuffer))
  (evil-collection-init))

(use-package doom-themes)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
	doom-themes-enable-italic t) ; if nil, italics is universally disabled
(load-theme 'doom-one t)

(use-package doom-modeline)
(doom-modeline-mode t)

(menu-bar-mode -1)
(tool-bar-mode -1)

(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(global-visual-line-mode t)
