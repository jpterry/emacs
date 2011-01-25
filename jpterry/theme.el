;; Theme
(add-to-list 'load-path "~/.emacs.d/vendor/color-theme-6.6.0/")
(require 'color-theme)
(setq color-theme-is-global t)
(load-file "~/.emacs.d/vendor/twilight-emacs/color-theme-twilight.el")
(when window-system (color-theme-twilight))
;(when window-system (color-theme-tangotango))
