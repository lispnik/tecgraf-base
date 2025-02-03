(defpackage #:tecgraf-base
  (:use #:common-lisp)
  (:export #:ihandle
           #:im-image
           #:im-file
           #:defalias
           #:maybe-add-foreign-library-directory))

(in-package #:tecgraf-base)

(defmacro defalias (to what &optional documentation (documentation-type 'function))
  `(progn
     (setf (fdefinition ',to) ,what)
     (when ,documentation
       (setf (documentation ',to ',documentation-type) ,documentation))))

(defun maybe-add-foreign-library-directory ()
  (handler-case
      (let ((pathname (asdf:system-relative-pathname "tecgraf-libs" "libs/")))
        (pushnew pathname cffi:*foreign-library-directories*)
        ;; On Windows, we add the tecgraf libraries directory to the
        ;; PATH environment variable so that support libraries
        ;; (freetype6.dll, zlib1.dll, etc.) are found.
        #+windows
        (setf (uiop:getenv "PATH")
              (concatenate 'string (uiop:getenv "PATH") ";" (namestring pathname))))
    (asdf/find-component:missing-component ()
      (warn "System \"tecgraf-libs\" not found. You'll need to install IUP, IM and CD shared libraries manually."))))
