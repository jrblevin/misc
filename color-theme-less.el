(defun color-theme-less ()
  "A minimalistic color scheme by Jason Blevins, created 2008-10-07.
Inspired by color-theme-late-night and the Less is More theme for vim."
  (interactive)
  (let ((color-theme-is-cumulative t))
    (color-theme-dark-erc)
    (color-theme-dark-gnus)
    (color-theme-dark-info)
    (color-theme-install
     '(color-theme-less
       ((background-color . "#000")
	(background-mode . dark)
	(background-toolbar-color . "#000")
	(border-color . "#000")
	(bottom-toolbar-shadow-color . "#000")
	(cursor-color	. "yellow")
	(foreground-color . "gray70")
	(top-toolbar-shadow-color . "#111"))
       (default ((t (nil))))
       (font-lock-comment-face ((t (:bold t :foreground "dim gray"))))
       (font-lock-function-name-face ((t (:foreground "gray90"))))
       (font-lock-variable-name-face ((t (:foreground "gray90"))))
       (font-lock-constant-face ((t (:foreground "gray90"))))
       (font-lock-doc-string-face ((t (:foreground "gray90"))))
       (font-lock-doc-face ((t (:foreground "gray90"))))
       (font-lock-preprocessor-face ((t (:foreground "gray90"))))
       (font-lock-reference-face ((t (:foreground "gray90"))))
       (font-lock-string-face ((t (:foreground "gray90"))))
       (font-lock-type-face ((t (:bold t :foreground "white"))))
       (font-lock-builtin-face ((t (:bold t :foreground "white"))))
       (font-lock-keyword-face ((t (:bold t :foreground "white"))))
       (font-lock-warning-face ((t (:bold t :foreground "red"))))
       (bold ((t (:bold t))))
       (button ((t (:bold t))))
       (custom-button-face ((t (:bold t :foreground "#999"))))
       (fringe ((t (:background "#111" :foreground "#444"))))
       (header-line ((t (:background "#333" :foreground "#000"))))
       (highlight ((t (:background "dark slate blue" :foreground "light blue"))))
       (holiday-face ((t (:background "#000" :foreground "#777"))))
       (isearch ((t (:foreground "black" :background "red"))))
       (isearch-lazy-highlight-face ((t (:foreground "red"))))
       (italic ((t (:bold t))))
       (menu ((t (:background "#111" :foreground "#444"))))
       (minibuffer-prompt ((t (:foreground "white"))))
       (modeline ((t (:background "gray20" :foreground "white"))))
       (mode-line-inactive ((t (:background "gray20" :foreground "light gray"))))
       (modeline-buffer-id ((t (:background "gray20" :foreground "light gray"))))
       (modeline-mousable ((t (:background "black" :foreground "light gray"))))
       (modeline-mousable-minor-mode ((t (:background "black" :foreground "white"))))
       (region ((t (:background "light gray" :foreground "black"))))
       (secondary-selection ((t (:background "Aquamarine" :foreground "SlateBlue"))))
       (show-paren-match-face ((t (:foreground "black" :background "light gray"))))
       (show-paren-mismatch-face ((t (:foreground "black" :background "red"))))
       (tool-bar ((t (:background "#111" :foreground "#777"))))
       (tooltip ((t (:background "#333" :foreground "#777"))))
       (underline ((t (:bold t))))
       (variable-pitch ((t (nil))))
       (widget-button-face ((t (:bold t :foreground "#888"))))
       (widget-field-face ((t (:bold t :foreground "#999"))))))))

(provide 'color-theme-less)
