;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Theme — matches Alacritty Tomorrow Night colors
(setq doom-theme 'doom-tomorrow-night)

;; Line numbers off (matching Spacemacs)
(setq display-line-numbers-type nil)

;; Org directory
(setq org-directory "~/org/")

;;; Evil behavior (ported from Spacemacs)
(after! evil
  (setq evil-move-cursor-back nil
        evil-cross-lines t
        evil-move-beyond-eol t
        evil-respect-visual-line-mode nil)

  ;; J/K to move lines in visual mode (from Spacemacs)
  (define-key evil-visual-state-map "J"
    (concat ":m '>+1" (kbd "RET") "gv=gv"))
  (define-key evil-visual-state-map "K"
    (concat ":m '<-2" (kbd "RET") "gv=gv"))

)

;; Use fd instead of jk for evil-escape
(after! evil-escape
  (setq evil-escape-key-sequence "fd"))

;;; Keybindings
;; / for consult-line (like helm-swoop in Spacemacs)
(map! :n "/" #'consult-line)

;; LSP format
(map! :leader
      :desc "Format buffer with LSP"
      "c f" #'lsp-format-buffer)

;; Spacemacs-style SPC k lisp state
(map! :leader
      (:prefix ("k" . "lisp")
               ;; Navigation
               "h" #'sp-backward-symbol
               "H" #'sp-backward-sexp
               "l" #'sp-forward-symbol
               "L" #'sp-forward-sexp
               "U" #'sp-backward-up-sexp
               "0" #'sp-beginning-of-sexp
               "$" #'sp-end-of-sexp
               ;; Slurp/barf
               "s" #'sp-forward-slurp-sexp
               "S" #'sp-backward-slurp-sexp
               "b" #'sp-forward-barf-sexp
               "B" #'sp-backward-barf-sexp
               ;; Delete
               (:prefix ("d" . "delete")
                        "s" #'sp-kill-symbol
                        "w" #'sp-kill-word
                        "x" #'sp-kill-sexp)
               (:prefix ("D" . "delete-backward")
                        "s" #'sp-backward-kill-symbol
                        "w" #'sp-backward-kill-word
                        "x" #'sp-backward-kill-sexp)
               ;; Transform
               "a" #'sp-absorb-sexp
               "c" #'sp-convolute-sexp
               "e" #'sp-splice-sexp-killing-forward
               "E" #'sp-splice-sexp-killing-backward
               "J" #'sp-join-sexp
               "r" #'sp-raise-sexp
               "t" #'sp-transpose-sexp
               ;; Wrap/unwrap
               "w" #'sp-wrap-round
               "W" #'sp-unwrap-sexp
               ;; Copy
               "y" #'sp-copy-sexp))

;;; Project paths
(setq projectile-project-search-path '("~/dev" "~/projects"))

;;; Performance
(setq read-process-output-max (* 1024 1024))

;;; Local leader on comma (Spacemacs-style)
(setq doom-localleader-key ",")

;;; Vterm
(after! vterm
  (setq vterm-term-environment-variable "xterm-256color"))
