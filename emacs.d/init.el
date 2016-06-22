;;; init.el -- emcas config

;;; Commentary:
;;
;; Yufan Lu
;;

;;; Code:

;; ---------------------------------------------
;; Util Functions
;; ---------------------------------------------
(defun ylu/mac? ()
  "Return true if this is an Apple machine, nil otherwise."
  (eq system-type 'darwin))

(when (ylu/mac?)
  "full screen on mac"
  (setq ns-use-srgb-colorspace nil))

;; font setting
(setq ylu/default-font "Sauce Code Powerline")
(setq ylu/default-font-size 11)
(setq ylu/current-font-size ylu/default-font-size)
(setq ylu/font-change-increment 0.5)

(defun ylu/set-font-size ()
  "Set the font to `ylu/default-font' at `ylu/current-font-size'."
  (set-frame-font
   (concat ylu/default-font "-" (number-to-string ylu/current-font-size))))

(defun ylu/reset-font-size ()
  "Change font size back to `ylu/default-font-size'."
  (interactive)
  (setq ylu/current-font-size ylu/default-font-size)
  (ylu/set-font-size))

(defun ylu/increase-font-size ()
  "Increase current font size by a factor of `ylu/font-change-increment'."
  (interactive)
  (setq ylu/current-font-size
		(ceiling (+ ylu/current-font-size ylu/font-change-increment)))
  (ylu/set-font-size))

(defun ylu/decrease-font-size ()
  "Decrease current font size by a factor of `ylu/font-change-increment', down to a minimum size of 1."
  (interactive)
  (setq ylu/current-font-size
		(max 1 (floor (- ylu/current-font-size ylu/font-change-increment))))
  (ylu/set-font-size))

(ylu/set-font-size)
(define-key global-map (kbd "C-)") 'ylu/reset-font-size)
(define-key global-map (kbd "C-=") 'ylu/increase-font-size)
(define-key global-map (kbd "C--") 'ylu/decrease-font-size)

;; ---------------------------------------------
;; Behavior
;; ---------------------------------------------
(setq-default tab-width 4)
(setq require-final-newline t)		;; Require new line in the eof
(setq inhibit-startup-message t)	;; Dismiss startup screen

;; ---------------------------------------------
;; gc-cons-threshold
;; ---------------------------------------------
(defun ylu/minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun ylu/minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'ylu/minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'ylu/minibuffer-exit-hook)

;; ---------------------------------------------
;; Packages
;; ---------------------------------------------
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  "install use-package if it not installed"
  (package-refresh-contents)
  (package-install 'use-package))

;; ---------------------------------------------
;; UI Setting
;; ---------------------------------------------
(menu-bar-mode -1)               ;; remove menu bar
(tool-bar-mode -1)               ;; remove tool bar
(when (boundp 'scroll-bar-mode)  ;; remove scroll bar
  (scroll-bar-mode -1))

(global-prettify-symbols-mode t) ;; use fancy lambda

(use-package smart-mode-line
  :ensure t
  :init
  (setq sml/theme 'respectful)
  :config
  (setq sml/no-confirm-load-theme t)
  (sml/setup)
  )

(use-package solarized-theme     ;; load solarized theme
  :ensure t
  :init
  (setq x-underline-at-descent-line t)
  (setq solarized-use-variable-pitch nil)
  ;; (setq solarized-scale-org-headlines nil)
  
  :config
  (load-theme 'solarized-dark t)
  )

(setq scroll-step 1)             ;; smooth scoll

;; ---------------------------------------------
;; Evil Mode
;; ---------------------------------------------

;; Revive Vim
(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)                  ;; <c-u> scrolls like Vim
  (setq evil-want-C-w-in-emacs-state t)          ;; <c-w> prefixes windows commands in Emacs state.
  (setq evil-search-module 'isearch)             ;; set incsearch
  (setq evil-want-fine-undo t)                   ;; use fine grain undo
  ;; (setq evil-magic 'very-magic)                  ;; unknown variable
  :config
  (evil-mode 1)
  
  ;; use <c-c> as escape key
  (define-key evil-insert-state-map (kbd "C-c") '[escape])
  (define-key evil-visual-state-map (kbd "C-c") '[escape])
  (define-key evil-replace-state-map (kbd "C-c") '[escape])

  ;; move cursor on visual line
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  
  ;; Use "H" and "L" goto begin/end of the line
  (define-key evil-normal-state-map (kbd "H") 'evil-first-non-blank)
  (define-key evil-normal-state-map (kbd "L") 'evil-end-of-line)

  ;; use <space> as (un)fold
  (define-key evil-normal-state-map (kbd "SPC") 'evil-toggle-fold)
  
										; Evil nerd commenter
  (use-package evil-nerd-commenter
	:ensure t
	:config
	;; define <C-/> as comment or uncomment
	(define-key evil-normal-state-map (kbd "C-/") 'evilnc-comment-or-uncomment-lines))

  ;; Evil-surround
  (use-package evil-surround
	:ensure t
	:config (global-evil-surround-mode))

  ;; multicusor
  (use-package evil-mc
	:ensure t
	:config (global-evil-mc-mode 1))

  (use-package evil-matchit
	:ensure t
	:config
	(global-evil-matchit-mode 1))
  
  (use-package evil-numbers
	:ensure t
	:config
	;; in/decrement num under at normal mode as vim
	(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
	(define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt))

  ;; Revive Vim
  (use-package evil-leader
	:ensure t
	:init (setq evil-leader/in-all-states 1)
	:config
	(global-evil-leader-mode)
	(evil-leader/set-leader ",")
	(evil-leader/set-key
	  "e"  'find-file
	  "w"  'save-buffer
	  "q"  'kill-buffer-and-window
	  "b"  'ibuffer
	  "x"  'helm-M-x
	  "ci" 'evilnc-comment-or-uncomment-lines
	  "cc" 'evilnc-comment-or-uncomment-lines
	  "cp" 'evilnc-comment-or-uncomment-paragraphs
	  "oa" 'org-agenda
	  "oc" 'org-capture
	  )
	)
  )

;; make escape quit eveything, whenever possible
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; ---------------------------------------------
;; Org mode
;; ---------------------------------------------
(use-package org
  :ensure t
  :init
  (setq org-html-postamble nil)			;; dont include contact footer when exporting to HTML
  (setq org-src-fontify-natively t)		;; Syntax highlighting in the source block
  (setq org-src-tab-acts-natively t)	;; make TAB acts as if it were issued in the language major mode buffer
  (setq org-latex-packages-alist '(("margin=1.2in" "geometry" nil)
								   ("" "minted")))
  :config
  (use-package org-bullets
	:ensure t
	:config
	(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
  )


;; ---------------------------------------------
;; Slime Nav
;; ---------------------------------------------
(use-package elisp-slime-nav
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook
			(lambda ()
			  (elisp-slime-nav-mode)
			  (turn-on-eldoc-mode)
			  ))
  (evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
	'elisp-slime-nav-describe-elisp-thing-at-point)
  )

;; ---------------------------------------------
;; yasnippet
;; ---------------------------------------------
(use-package yasnippet
  :ensure t
  :init
  (setq yas-wrap-around-region t)
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  :config
  (yas-reload-all)
  (add-hook 'org-mode-hook 'yas-minor-mode)
  )

;; flycheck
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

;; ---------------------------------------------
;; company mode
;; ---------------------------------------------
(use-package company
  :ensure t
  :config
  (global-company-mode)
  (setq company-idle-delay 0.2)
  (setq company-selection-wrap-around t)
  (define-key company-active-map [tab] 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)

  (use-package company-math
	:ensure t
	:config
	(add-to-list 'company-backends 'company-math-symbols-latex)
	)
  )


(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("082a3669532ad3747285702dfdd12eb690c66c551e07baff2c15023c6e970015" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
