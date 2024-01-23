(use-package which-key
  :ensure t
  :init
  (which-key-mode))
(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))

(setq display-time-format-24hr-format t)
(display-time-mode 1)



(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)
(define-key global-map (kbd "<s-return>") 'ansi-term)

(setq make-backup-file nil)
(setq auto-save-default nil)
(setq scroll-conservatively 100)
(when window-system (global-hl-line-mode t))
(when window-system (global-prettify-symbols-mode t))
(electric-pair-mode 1)
(setq electric-pair-preserve-balance nil)
(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-set-key (kbd "C-x b") 'ibuffer)
(global-subword-mode 1)

(defun kill-whole-word ()
  (interactive)
  (backward-word)
  (kill-word 1))
(global-set-key (kbd "C-c w w") 'kill-whole-word)

(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)

(defun kill-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
(global-set-key (kbd "C-M-s-k") 'kill-all-buffers)

(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
(yas-reload-all 1)
(setq yas-snippet-dirs '("~/.emacs.d/plugins/yasnippet/snippets"))
(define-key global-map (kbd "C-M-y") 'yas-reload-all)

(use-package sudo-edit
  :ensure t
  :bind ("s-e" . sudo-edit))

(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package org-bullets
:ensure t
:config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

(setq org-src-window-setup 'current-window)

(setq ido-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)

(use-package ido-vertical-mode
:ensure t
:init
(ido-vertical-mode 1))
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind
  ("M-x" . smex))

(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

(setq ibuffer-expert t)

(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
  (global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

  (defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 2))
  (global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(use-package switch-window
:ensure t
:config
(setq switch-window-input-style 'minibuffer)
(setq switch-window-increase 4)
(setq switch-window-threshold 2)
(setq switch-window-shortcut-style 'qwerty)
(setq switch-window-qwerty-shortcuts '("a" "s" "d"))
:bind
([remap other-window] . switch-window))

(defun config-visit ()
  (interactive)
  (find-file "~/.emacs.d/config.org"))
(global-set-key (kbd "C-x e") 'config-visit)

(defun config-reload ()
  (interactive)
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))
(global-set-key (kbd "C-c r") 'config-reload)

(use-package avy
  :ensure t
  :bind
  ("M-s" . avy-goto-char))

(use-package rainbow-mode
  :ensure t
  :init
  (rainbow-mode 1))

(use-package rainbow-delimiters
  :ensure t
  :init
  (rainbow-delimiters-mode 1))

(defun copy-whole-line ()
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring
      (point-at-bol)
      (point-at-eol)))))
(global-set-key (kbd "C-c w l") 'copy-whole-line)



(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents . 10)))
  (setq dashboard-banner-logo-title "Remember the dream")
  (setq dasboard-center-content t))

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator (quote arrow))
  (spaceline-spacemacs-theme))

(use-package diminish
  :ensure t
  :init
  (diminish 'beacon-mode)
  (diminish 'which-key-mode))
  (diminish 'rainbow-mode)
  (diminish 'subword-mode)
  (diminish 'hungry-delete-mode)

(use-package dmenu
  :ensure t
  :bind
  ("C-?" . 'dmenu))

(use-package symon
:ensure t
:bind
("C-:" . symon-mode))
