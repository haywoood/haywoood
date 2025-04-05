(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((cider-default-cljs-repl . custom) (cider-preferred-build-tool . clojure-cli)
     (cider-clojure-cli-parameters . "-A:dev")
     (eval font-lock-add-keywords nil
      `
      ((,(concat "("
                 (regexp-opt
                  '("sp-do-move-op" "sp-do-move-cl" "sp-do-put-op"
                    "sp-do-put-cl" "sp-do-del-op" "sp-do-del-cl")
                  t)
                 "\\_>")
        1 'font-lock-variable-name-face)))
     (eval progn (make-variable-buffer-local 'cider-jack-in-nrepl-middlewares)
      (add-to-list 'cider-jack-in-nrepl-middlewares
                   "shadow.cljs.devtools.server.nrepl/middleware")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
