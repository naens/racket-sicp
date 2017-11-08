(load "ex69.rkt")

(generate-huffman-tree '((a 1) (b 2) (c 4) (d 8) (e 16)))
;; (((((leaf a 1)
;;     (leaf b 2)
;;     (a b)
;;     3)
;;    (leaf c 4)
;;    (a b c)
;;    7)
;;   (leaf d 8)
;;   (a b c d)
;;   15)
;;  (leaf e 16)
;;  (a b c d e)
;;  31)

   
