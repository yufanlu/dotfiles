;; list evil, org mode
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")))
(require 'package)
(package-initialize)

;; utility
(defun ylu/mac? ()
  "Returns `t' if this is an Apple machine, nil otherwise."
  (eq system-type 'darwin))

;; full screen on mac
(when (ylu/mac?)
  (set-frame-parameter nil 'fullscreen 'fullboth))

;; font setting
(setq ylu/default-font "Source Code Pro for Powerline")
(setq ylu/default-font-size 12)
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

;; evil-mode
(require 'evil)
(require 'evil-leader)
(require 'evil-surround)
(require 'evil-matchit)
(require 'evil-numbers)
(global-evil-leader-mode)
(global-evil-surround-mode 1)
(global-evil-visualstar-mode)      ;; allow search on visual selected text

(evil-leader/set-leader ",")
(evil-leader/set-key "e" 'find-file)

(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "cc" 'evilnc-comment-or-uncomment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs)

(evil-leader/set-key "w" 'save-buffer)
(evil-leader/set-key "q" 'kill-buffer-and-window)
(evil-leader/set-key "b" 'ibuffer)
(evil-leader/set-key "x" 'helm-M-x)

;; in/decrement num under at normal mode as vim
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)

;; scroll-up under under normal mode as vim
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

(evil-set-initial-state 'ibuffer-mode 'normal)

(evil-mode 1)

;; binding keys for moving cursor between windows
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

;; define <C-c> as escape in insert/replace mode
(define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
(define-key evil-replace-state-map (kbd "C-c") 'evil-normal-state)


;; use fancy lambda
(global-prettify-symbols-mode t)

;; powerline
(require 'powerline)

;; theme and UI settings
(load-theme 'dracula t)
(tool-bar-mode -1)
(require 'linum-relative)
(set-face-attribute 'linum nil :height 110)
(setq linum-relative-current-symbol "")
(global-linum-mode 1)
(linum-relative-toggle)

;; multicusor
(require 'evil-mc)
(global-evil-mc-mode 1)

;; require new line in the eof
(setq require-final-newline t)

;; elisp-slime-nav
(require 'elisp-slime-nav)
(defun ylu/elisp-slime-nav-hook ()
  (elisp-slime-nav-mode)
  (turn-on-eldoc-mode))
(add-hook 'emacs-lisp-mode-hook 'ylu/elisp-slime-nav-hook)
(evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
  'elisp-slime-nav-describe-elisp-thing-at-point)

