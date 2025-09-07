(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)
(setq visible-bell t)

(prefer-coding-system 'utf-8)

(set-face-attribute 'default nil :font "FiraCode Nerd Font" :height 120)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(setq straight-use-package-by-default t)

(use-package doom-themes)

(load-theme 'doom-dark+ t)

(use-package doom-modeline
  :init (doom-modeline-mode))

(use-package magit)

(use-package eglot
  :straight nil
  :demand t
  :defines eglot-server-programs)

(use-package vertico
  :init
  (vertico-mode))

(use-package
  php-mode
  :init (setq phpactor-executable (executable-find "phpactor"))
  :hook ((php-mode . eglot-ensure)
	 (php-mode . (lambda ()
		       (setq-local phpactor-executable
				   (executable-find "phpactor")))))
  :mode ("\\.php\\'"))

(use-package phpactor
  :after php-mode)


(use-package smartparens
  :config (require 'smartparens-config)
  :init (smartparens-global-mode))

(use-package diff-hl
  :init (global-diff-hl-mode)
  :hook (magit-post-refresh . diff-hl-magit-post-refresh))

(use-package which-key
  :config (which-key-mode 1))

(use-package cape
  :init
  (add-to-list `completion-at-point-functions #'cape-keyword)
  (add-to-list `completion-at-point-functions #'cape-file)
  (add-to-list `completion-at-point-functions #'cape-emoji))

(use-package orderless
  :custom (completion-styles '(orderless basic)))

(use-package marginalia
  :init (marginalia-mode))

(use-package yaml-mode)

(use-package corfu
  :demand t
  :custom
  (corfu-auto t)
  (corfu-seperator ?-)
  (corfu-auto-prefix 2)
  :init
  (global-corfu-mode)
  (corfu-history-mode 1)
  (corfu-popupinfo-mode 1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e4a702e262c3e3501dfe25091621fe12cd63c7845221687e36a79e17cf3a67e0" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" default))
 '(safe-local-variable-values
   '((projectile-project-test-cmd . "php ./vendor/bin/phpunit --color=never --verbose"))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
