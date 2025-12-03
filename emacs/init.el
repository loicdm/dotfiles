;; ~/.config/emacs/init.el

;; Set up package management
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Use use-package for package management
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Load Dracula theme using use-package
(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t))

;; Install Company Mode using use-package
(use-package company
  :ensure t
  :init
  (global-company-mode 1)  ;; Enable Company mode globally
  :config
  (setq company-idle-delay 0.2)  ;; Set delay for completion to appear
  (setq company-minimum-prefix-length 2))  ;; Start completion after 2 characters

;; Install company-quickhelp for inline documentation in completions
(use-package company-quickhelp
  :ensure t
  :config
  (company-quickhelp-mode 1))  ;; Enable company-quickhelp mode

;; Install Evil Mode for Vim emulation
(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)  ;; Disable default keybindings for Evil
  :config
  (evil-mode 1))  ;; Enable Evil mode globally

;; Enable Font Lock (syntax highlighting)
(global-font-lock-mode 1)

;; Enhanced syntax highlighting with Tree-sitter
(use-package tree-sitter
  :ensure t
  :config
  (global-tree-sitter-mode))

(use-package tree-sitter-langs
  :ensure t)

;; Rainbow Delimiters for parentheses highlighting
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;; Indentation guides for programming languages
(use-package highlight-indent-guides
  :ensure t
  :hook (prog-mode . highlight-indent-guides-mode))

;; Doom theme for improved syntax highlighting and colors
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-dracula t))  ;; You can replace 'doom-dracula' with any other Doom theme you like

;; Ligature support for cleaner code symbols (like arrows and other characters)
(use-package ligature
  :ensure t
  :config
  (ligature-set-ligatures 't '("->" "<-" "=>" "<=>" "::"))
  (global-ligature-mode t))

(use-package nerd-icons
  :ensure t)

;; Install Doom Modeline
(use-package doom-modeline
  :ensure t
  :init
  (setq doom-modeline-support-imenu t)
  (setq doom-modeline-icon t)  ;; Display icons
  (setq doom-modeline-font (font-spec :family "Iosevka Nerd Font" :size 12))
  (setq doom-modeline-vcs-max-length 20)  ;; Max length for Git branch name in the modeline
  (setq doom-modeline-buffer-encoding t)  ;; Show buffer encoding in the modeline
  (setq doom-modeline-buffer-file-name-style 'truncate-with-project)  ;; Truncate long filenames
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-major-mode-color-icon t)
  (setq doom-modeline-buffer-state-icon t)
  (setq doom-modeline-lsp-icon t)
  (setq doom-modeline-time-icon t)
  (setq doom-modeline-time-live-icon t)
  (setq doom-modeline-buffer-name t)
  (setq doom-modeline-highlight-modified-buffer-name t)
  (setq doom-modeline-minor-modes t)
  (setq doom-modeline-selection-info t)
  (setq doom-modeline-enable-word-count t)
  (setq doom-modeline-indent-info t)
  (setq doom-modeline-total-line-number t)
  (setq doom-modeline-vcs-icon t)
  :config
  (doom-modeline-mode 1))

;; Install Which-Key for keybinding suggestions
(use-package which-key
  :ensure t
  :config
  (which-key-mode))  ;; Enable which-key globally

;; Install Ivy for incremental completion and selection narrowing
;; (use-package ivy
;;   :ensure t
;;   :diminish
;;   :config
;;   (ivy-mode 1))

;; Installer Vertico
(use-package vertico
  :ensure t
  :init
  (vertico-mode))  ;; Activer Vertico globalement pour les minibuffers

;; Installer Orderless pour la recherche floue
(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic)  ;; Utiliser Orderless pour la recherche floue
        completion-category-defaults nil))

;; Activer une recherche floue avec Orderless dans Vertico
(setq vertico-multiline t) ;; Activer un affichage multi-lignes dans Vertico si nécessaire
(setq vertico-resize t)    ;; Activer l'option pour redimensionner automatiquement le minibuffer

;; Configurer Ivy-Rebuilders pour que Vertico utilise Orderless pour la recherche floue
(setq completion-styles '(orderless basic)) ;; Définir Orderless comme style principal
(setq vertico-cycle t)  ;; Activer la possibilité de faire défiler les éléments de manière cyclique

;; Install all-the-icons-dired for enhanced dired
(use-package all-the-icons-dired
  :ensure t
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package all-the-icons
  :ensure t)

;; Install Magit for Git integration
(use-package magit
  :ensure t)

;; Install magit-section for Magit integration
(use-package magit-section
  :ensure t)

;; Install goto-chg for easy jumping between changes
(use-package goto-chg
  :ensure t)

;; Install evil-collection for enhanced Evil bindings
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; General package for keybindings
(use-package general
  :ensure t)

;; Ivy Posframe for Ivy UI in popup
;; (use-package ivy-posframe
;;   :ensure t
;;   :config
;;   (ivy-posframe-mode 1))

;; Install saveplace for remembering cursor position in files
(use-package saveplace
  :ensure t
  :config
  (save-place-mode 1))

;; Install undo-tree for undo history management
(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode))

;; Install woman for manual page viewing
(use-package woman
  :ensure t
  :config
  (setq woman-use-own-frame nil))

(use-package multiple-cursors
  :ensure t
  )

;; Installer lsp-mode pour la gestion des serveurs de langage
(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((c-mode . lsp)
	 (html-mode . lsp)
	 (javascript-mode . lsp)
	 (python-mode . lsp)
         (c++-mode . lsp))
  :config
  (setq lsp-ui-doc-enable t)    ;; Activer la documentation LSP
  (setq lsp-ui-sideline-enable t) ;; Afficher les erreurs et warnings dans la barre latérale))

  ;; Installer lsp-ui pour l'affichage des informations LSP (documentation, diagnostics, etc.)
  (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode
    :config
    (setq lsp-ui-doc-enable t)           ;; Afficher la documentation dans une fenêtre popup
    (setq lsp-ui-sideline-enable t)      ;; Afficher les informations de diagnostic sur le côté
    (setq lsp-ui-sideline-show-symbol t) ;; Afficher le symbole actuel dans la barre latérale
    :hook (lsp-mode . lsp-ui-mode))
  )

;; (use-package ivy-prescient
;;   :ensure t
;;   :config
;;   (ivy-prescient-mode)
;;   )

(use-package company-prescient
  :ensure t
  :config
  (company-prescient-mode)
  )

(use-package nushell-mode
  :ensure t)

(use-package nushell-ts-mode
  :ensure t)

(use-package format-all
  :ensure t

  ;; Active un mode automatique sur sauvegarde
  ;; (tu peux commenter cette ligne si tu préfères formater manuellement)
  ;; :hook (prog-mode . format-all-ensure-formatter)

  ;; Ajoute une touche pratique pour formater le buffer
  ;; :bind (("C-c f" . format-all-buffer)))
  )

;; General keybindings setup using general.el
(general-define-key
 :prefix "SPC"
 :states '(normal visual)
 :keymaps 'override
 "d" 'ido-find-file
 "f" 'format-all-buffer
 "b" 'ido-switch-buffer
 "i" 'ibuffer
 "k" 'evil-delete-buffer
 "x" 'execute-extended-command
 "u" 'undo-tree-visualize
 "m" 'woman
 "M" 'woman-follow
 "g" 'magit-status
 ;; Navigation des curseurs
 "cmn"  'mc/mark-next-like-this     ;; Ajouter un curseur à la prochaine occurrence
 "cmp"   'mc/mark-previous-like-this ;; Ajouter un curseur à l'occurrence précédente
 "cma"    'mc/mark-all-like-this      ;; Ajouter des curseurs à toutes les occurrences

 ;; Déplacement entre les curseurs
 "cn"  'mc/skip-to-next-like-this  ;; Passer au curseur suivant
 "cp"   'mc/skip-to-previous-like-this ;; Passer au curseur précédent

 ;; Supprimer des curseurs
 "cm"    'mc/mark-all-dwim           ;; Marquer toutes les occurrences intelligemment
 "cun"    'mc/unmark-next-like-this
 "cup"    'mc/unmark-previous-like-this
 )

;; Set font for the editor (replace 'Iosevka Nerd Font' with your desired Nerd font)
(set-face-attribute 'default nil :font "Iosevka Nerd Font" :height 140)

;; Set font for Doom Modeline (same font or different one)
(setq doom-modeline-font (font-spec :family "Iosevka Nerd Font" :size 12))

;; Enable relative line numbers
(setq display-line-numbers-type 'relative)

(setq gc-cons-threshold 100000000)  ;; Augmenter le seuil de collecte des ordures

(setq tramp-cleanup-async-result t)
(setq tramp-persistency-file-name nil) ;; Désactiver la persistance des connexions Tramp

(ultra-scroll-mode -1)

(pixel-scroll-precision-mode 1)

;; Enable line numbers globally (both relative and absolute)
(global-display-line-numbers-mode t)
(menu-bar-mode 1)  ;; Réactive la barre de menus
(tool-bar-mode -1)  ;; Masque la barre d'outils
(scroll-bar-mode -1)  ;; Masque la barre de défilement

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
