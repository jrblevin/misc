;;; color-theme-gruber-dark.el --- based on the Gruber Dark theme for BBEdit
;;
;; Copyright (C) 2009 Jason R. Blevins <jrblevin@sdf.lonestar.org>
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3 of
;; the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied
;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.  See the GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public
;; License along with this program; if not, write to the Free
;; Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
;; MA 02111-1307 USA

(require 'color-theme)

(defun color-theme-gruber-dark ()
  "Gruber Dark color theme for Emacs by Jason Blevins.
Based on the Gruber Dark theme for BBEdit by John Gruber
available at <http://daringfireball.net/projects/bbcolors/schemes/>."
  (interactive)
  (color-theme-install
   '(color-theme-gruber-dark
     ((background-color . "#282828")
      (background-mode . dark)
      (border-color . "#181818")
      (cursor-color . "#ffdd33")
      (mouse-color . "#ffdd33")
      (foreground-color . "#f4f4ff"))

     ;; Standard font lock faces
     (default ((t (nil))))
     (font-lock-comment-face ((t (:foreground "#cc8c3c"))))
     (font-lock-comment-delimiter-face ((t (:foreground "#cc8c3c"))))
     (font-lock-function-name-face ((t (:foreground "#96a6c8"))))
     (font-lock-variable-name-face ((t (:foreground "#f4f4ff"))))
     (font-lock-constant-face ((t (:foreground "#95a99f"))))
     (font-lock-preprocessor-face ((t (:foreground "#95a99f"))))
     (font-lock-reference-face ((t (:foreground "#95a99f"))))
     (font-lock-string-face ((t (:foreground "#73c936"))))
     (font-lock-doc-string-face ((t (:foreground "#73c936"))))
     (font-lock-doc-face ((t (:foreground "#73c936"))))
     (font-lock-type-face ((t (:foreground "#95a99f"))))
     (font-lock-builtin-face ((t (:foreground "#ffdd33"))))
     (font-lock-keyword-face ((t (:foreground "#ffdd33"))))
     (font-lock-warning-face ((t (:foreground "#f43841"))))
     (trailing-whitespace ((t (:foreground "#000" :background "#f43841"))))
     (link ((t (:foreground "#96A6C8" :underline t))))

     ;; Search
     (isearch ((t (:foreground "#000" :background "#f5f5f5"))))
     (isearch-lazy-highlight-face ((t (:foreground "#f4f4ff" :background "#5f627f"))))
     (isearch-fail ((t (:foreground "#000" :background "#f43841"))))

     ;; User interface
     (fringe ((t (:background "#181818" :foreground "#444"))))
     (tooltip ((t (:background "#52494e" :foreground "#fff"))))

     ;; Minibuffer and mode line
     (minibuffer-prompt ((t (:foreground "#96A6C8"))))
     (mode-line ((t (:background "#52494e" :foreground "#fff"))))
     (mode-line-inactive ((t (:background "#52494e" :foreground "dark grey"))))
     (mode-line-buffer-id ((t (:background "#52494e" :foreground "#fff"))))

     ;; Region
     (region ((t (:background "#5F627F" :foreground "#F4F4FF"))))
     (secondary-selection ((t (:background "#484951" :foreground "#F4F4FF"))))

     ;; Parenthesis matching
     (show-paren-match-face ((t (:background "#52494e" :foreground "#f4f4ff"))))
     (show-paren-mismatch-face ((t (:foreground "#f4f4ff" :background "#c73c3f"))))

     ;; Calendar
     (holiday-face ((t (:foreground "#f43841"))))

     ;; Info
     (info-xref ((t (:foreground "#96a6c8"))))
     (info-visited ((t (:foreground "#9e95c7"))))

     ;; AUCTeX
     (font-latex-sectioning-5-face ((t (:foreground "#96a6c8" :bold t))))
     (font-latex-bold-face ((t (:foreground "#95a99f" :bold t))))
     (font-latex-italic-face ((t (:foreground "#95a99f" :italic t))))
     (font-latex-math-face ((t (:foreground "#73c936"))))
     (font-latex-string-face ((t (:foreground "#73c936"))))
     (font-latex-warning-face ((t (:foreground "#f43841"))))
     (font-latex-slide-title-face ((t (:foreground "#96a6c8"))))
     )))

(provide 'color-theme-gruber-dark)
