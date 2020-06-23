(defpackage #:tecgraf-base
  (:use #:common-lisp)
  (:export #:ihandle
           #:im-image
           #:im-file
           #:defalias
           #:maybe-add-foreign-library-directory))

(in-package #:tecgraf-base)

(pffft:define-foreign-pointer-wrapper ihandle)
(pffft:define-foreign-pointer-wrapper im-image)
(pffft:define-foreign-pointer-wrapper im-file)

(defmacro defalias (to what &optional documentation (documentation-type 'function))
  `(progn
     (setf (fdefinition ',to) ,what)
     (when ,documentation
       (setf (documentation ',to ',documentation-type) ,documentation))))

(defun maybe-add-foreign-library-directory ()
  (let ((tecgraf-libs-directory (asdf:system-relative-pathname "tecgraf-libs" "libs/")))
    (when tecgraf-libs-directory
      (pushnew tecgraf-libs-directory cffi:*foreign-library-directories*))))
