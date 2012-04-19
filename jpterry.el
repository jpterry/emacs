; Add /usr/local/bin to path
(setenv "PATH" (concat "/usr/local/bin" ":" (getenv "PATH")))

(add-to-list 'load-path "~/.emacs.d/vendor")

;; Custom File
(setq custom-file "~/.emacs.d/jpterry/custom.el")
(when (file-exists-p custom-file) (load custom-file))

;; Put autosave files in a proper place,
;; Not everywhere I edit
(defvar autosave-dir
  (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))
(make-directory autosave-dir t)
(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))
(defun make-auto-save-file-name ()
  (concat autosave-dir
   (if buffer-file-name
      (concat "#" (file-name-nondirectory buffer-file-name) "#")
    (expand-file-name
     (concat "#%" (buffer-name) "#")))))
;; Credit: http://snarfed.org/gnu_emacs_backup_files

;; Emacs backups go to ~/.emacs_saves
(setq backup-directory-alist `(("." . "~/.emacs_saves")))

;; Basic Settings
;; Disable Startup Scree
(setq inhibit-startup-message t)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

(show-paren-mode t)

(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (> (x-display-pixel-width) 1280)
        (add-to-list 'default-frame-alist (cons 'width 120))
      (add-to-list 'default-frame-alist (cons 'width 80)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist
                 (cons 'height (/ (- (x-display-pixel-height) 200) (frame-char-height)))))))

(set-frame-size-according-to-resolution)

(server-start)

(load "jpterry/theme")
(load "jpterry/org")
(load "jpterry/osx")
