(defpackage #:tecgraf-base
  (:use #:common-lisp)
  (:export #:ihandle))

(in-package #:tecgraf-base)

(pffft:define-foreign-pointer-wrapper ihandle)
