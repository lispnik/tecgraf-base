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
  (handler-case 
      (pushnew (asdf:system-relative-pathname "tecgraf-libs" "libs/") cffi:*foreign-library-directories*)
    (asdf/find-component:missing-component ()
      (warn "System \"tecgraf-libs\" not found. You'll need to install IUP, IM and CD shared libraries manually."))))
