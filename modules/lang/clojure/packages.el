;; -*- no-byte-compile: t; -*-
;;; lang/clojure/packages.el

;; HACK Fix #5577. Paredit is a cider dependency. We install paredit ourselves
;;      to get it from emacsmirror, because the original upstream is a custom
;;      git server with shallow clones disabled.
(package! paredit
  :recipe (:host github :repo "emacsmirror/paredit")
  :pin "9a2c4b37fc8c1c7bdbb1f86fdec874c0d0652e64")

;; HACK Forward declare these clj-refactor/cider deps so that their deps are
;;      byte-compiled first.
(package! parseclj :pin "4d0e780e00f1828b00c43099e6eebc6582998f72")
(package! parseedn :pin "a09686fbb9113b8b1b4f20c9e1dc0d6fea01a64f")

;;; Core packages
(package! clojure-mode :pin "906d6a47a646d1191eaead6f8e1ae0810aa9b626")
(package! clj-refactor :pin "ffc6be1ef170402d25b068fb98a5a934cc5a5c36")
(package! cider :pin "3b8e5396ac8fc60fb9284aece1fc8c325516f745")
(when (modulep! :checkers syntax)
  (package! flycheck-clj-kondo :pin "ff7bed2315755cfe02ef471edf522e27b78cd5ca"))
(package! jet :pin "f007660c568e924e32d486a02aa4cd18203313cc")
(package! neil
  :recipe (:host github :repo "babashka/neil" :files ("*.el"))
  :pin "1dbac785cee4af8ad499839adbb83a8a297e7c70")
