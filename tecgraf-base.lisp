(defpackage #:tecgraf-base
  (:use #:common-lisp)
  (:export #:ihandle
           #:im-image
           #:im-file))

(in-package #:tecgraf-base)

(pffft:define-foreign-pointer-wrapper ihandle)
(pffft:define-foreign-pointer-wrapper im-image)
(pffft:define-foreign-pointer-wrapper im-file)
