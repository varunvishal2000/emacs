(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;; Package-installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless (package-installed-p 'spacemacs-theme)
  (package-refresh-contents)
  (package-install 'spacemacs-theme))

(unless (package-installed-p 'beacon)
  (package-refresh-contents)
  (package-install 'beacon))

(unless (package-installed-p 'emmet-mode)
  (package-refresh-contents)
  (package-install 'emmet-mode))

;; Adding MELPA to emacs
(setq package-enable-at-startup nil)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" default))
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(symon dmenu sudo-edit hungry-delete diminish spaceline sapceline dashboard rainbow-delimiters rainbow-mode rainbow avy smex switch-window ido-vertical-mode beacon which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
