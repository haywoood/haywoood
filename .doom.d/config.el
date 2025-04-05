;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fira Code" :size 12))

(setq line-spacing 2.5)

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(after! vterm
  (setq vterm-term-environment-variable "xterm-256color"))

(map! :leader
      :desc "M-x" "SPC" #'execute-extended-command)

;; Make 'fd' escape insert mode
(after! evil
  (progn
    (setq evil-respect-visual-line-mode nil)
    (setq evil-visual-insert 'block)
    (define-key evil-insert-state-map (kbd "f") 
                (lambda ()
                  (interactive)
                  (let ((next-key (read-key "f")))
                    (if (equal next-key ?d)
                        (evil-normal-state)
                      (insert "f")
                      (setq unread-command-events (list next-key))))))))

(setq read-process-output-max (* 1024 1024)
      doom-localleader-key ","                  ;; easier than <SPC m>
      projectile-project-search-path '("~/dev") ;; Change this to your base path for projects
      projectile-enable-caching nil)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq evil-move-beyond-eol t)

(map! :leader
      (:prefix ("k" . "structural")
               "s" #'sp-forward-slurp-sexp
               "S" #'sp-backward-slurp-sexp
               "b" #'sp-forward-barf-sexp
               "B" #'sp-backward-barf-sexp
               "E" #'sp-raise-sexp
               "d" #'sp-kill-sexp
               "y" #'sp-copy-sexp
               "t" #'sp-transpose-sexp
               "c" #'sp-convolute-sexp
               "w" #'sp-wrap-sexp
               "u" #'sp-unwrap-sexp
               "j" #'sp-join-sexp
               "r" #'sp-rewrap-sexp
               "x" #'sp-extract-before-sexp
               "X" #'sp-extract-after-sexp))

;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word))
  :config
  (add-to-list 'copilot-indentation-alist '(prog-mode 2))
  (add-to-list 'copilot-indentation-alist '(org-mode 2))
  (add-to-list 'copilot-indentation-alist '(text-mode 2))
  (add-to-list 'copilot-indentation-alist '(closure-mode 2))
  (add-to-list 'copilot-indentation-alist '(emacs-lisp-mode 2)))

(map! :leader
      :desc "Format buffer with LSP"
      "c f" #'lsp-format-buffer)

(setq display-line-numbers-type nil)

(use-package! gptel
  :config
  (setq gptel-api-key ""))
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
