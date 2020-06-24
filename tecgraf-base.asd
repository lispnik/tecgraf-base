(defsystem #:tecgraf-base
  :description "Tecgraf library (IUP, IM, CD)  base functionality"
  :author "Matthew Kennedy <burnsidemk@gmail.com>"
  :homepage "https://github.com/lispnik/tecgraf-base"
  :license "MIT"
  :serial t
  :components ((:file "tecgraf-base"))
  :depends-on (#:pffft #:cffi)
  :perform (load-op :after (o c)
             (uiop:symbol-call "TECGRAF-BASE" "MAYBE-ADD-FOREIGN-LIBRARY-DIRECTORY")))
