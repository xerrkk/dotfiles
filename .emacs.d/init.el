;;; init.el --- Optimized Configuration -*- lexical-binding: t; -*-

;; --- 1. Performance Optimizations ---
;; Temporarily increase memory limit for faster startup
(setq gc-cons-threshold (* 50 1024 1024))
(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold (* 2 1024 1024))))

;; --- 2. Package Bootstrap ---
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; --- 3. UI Refinements ---
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)
(global-display-line-numbers-mode t)
(global-hl-line-mode t)

;; Set transparency (90%)
(add-to-list 'default-frame-alist '(alpha-background . 90))

;; --- 4. Theming ---
(use-package autothemer :ensure t)

 (load-file (expand-file-name "rose-pine-theme.el" user-emacs-directory))

(load-theme 'rose-pine t)



;; --- 5. Evil Mode Setup ---
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-redo)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; --- 6. Separate Custom File ---
;; This keeps system-generated code out of this file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
