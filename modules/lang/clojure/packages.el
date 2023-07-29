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
(package! clojure-mode :pin "0e62583b5198f71856e4d7b80e1099789d47f2ed")
(package! clj-refactor :pin "1fdc95a479406a83865d06f43122354c0dd2b93f")
(package! cider :pin "cc31f5b28a702238e56250535c71c180fb2bbda6")
(when (and (modulep! :checkers syntax)
           (not (modulep! :checkers syntax +flymake)))
  (package! flycheck-clj-kondo :pin "ff7bed2315755cfe02ef471edf522e27b78cd5ca"))
(package! jet :pin "f007660c568e924e32d486a02aa4cd18203313cc")
(package! neil
  :recipe (:host github :repo "babashka/neil" :files ("*.el"))
  :pin "1dbac785cee4af8ad499839adbb83a8a297e7c70")
