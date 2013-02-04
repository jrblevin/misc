;;; titlecase.el --- convert text to title case

;;; Copyright (C) 2013 Jason R. Blevins <jrblevin@sdf.org>
;; All rights reserved.

;; Redistribution and use in source and binary forms, with or without
;; modification, are permitted provided that the following conditions are met:
;; 1. Redistributions of source code must retain the above copyright
;;    notice, this list of conditions and the following disclaimer.
;; 2. Redistributions in binary form must reproduce the above copyright
;;    notice, this list of conditions and the following disclaimer in the
;;    documentation  and/or other materials provided with the distribution.
;; 3. Neither the names of the copyright holders nor the names of any
;;    contributors may be used to endorse or promote products derived from
;;    this software without specific prior written permission.

;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;; ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
;; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;; POSSIBILITY OF SUCH DAMAGE.

;;; Version: 1.0
;;; Author: Jason R. Blevins <jrblevin@sdf.org>
;;; Keywords: title case, capitalization, writing.

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Currently, this is simply a wrapper for the `titlecase` Perl script
;; written by John Gruber and Aristotle Pagaltzis.  This script can be
;; found at <https://github.com/ap/titlecase>.  You must change the
;; value of `titlecase-command' to be the full path to this script.

;;; Code:

(defvar titlecase-command "/usr/local/bin/titlecase")

(defconst titlecase-buffer "*titlecase output*")

(defun titlecase-string (str)
  (let ((buffer (generate-new-buffer titlecase-buffer)))
    (with-current-buffer buffer
      (insert str)
      (goto-char (point-min))
      (call-process-region (point-min) (point-max) titlecase-command t t nil)
      (prog1
          ;; Skip trailing newline omitted by titlecase
          (buffer-substring (point-min) (- (point-max) 1))
        (kill-buffer buffer)))))

(defun titlecase-region (begin end)
  "Convert text in region from BEGIN to END to title case."
  (interactive "r")
  (save-excursion
    ;; An alternative to `replace-match' is to delete and insert the
    ;; text in two steps, but this results in two steps in the undo list:
    ;; (insert (titlecase-string (delete-and-extract-region begin end)))
    (save-match-data
      (set-match-data (list begin end))
      (replace-match (titlecase-string (buffer-substring begin end))))))

(defun titlecase-dwim ()
  "Convert the region or line to title case.
If Transient Mark Mode is on and there is an active region, convert
the region to title case.  Otherwise, work on the current line."
  (interactive)
  (if (and transient-mark-mode (mark-active))
      (titlecase-region (region-beginning) (region-end))
    (titlecase-region (beginning-of-line) (end-of-line))))

(provide 'titlecase)