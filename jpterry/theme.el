;; Theme
(add-to-list 'load-path "~/.emacs.d/vendor/color-theme-6.6.0/")
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
(load-file "~/.emacs.d/vendor/color-theme-wombat.el")
(when window-system (color-theme-wombat))

