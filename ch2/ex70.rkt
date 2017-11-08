(load "ex69.rkt")


(define tree (generate-huffman-tree '((a 2) (boom 1) (get 2) (job 2) (na 16) (sha 3) (yip 9) (wah 1))))

(encode '(get a job) tree)
;; => (1 1 1 1 1 1 1 0 0 1 1 1 1 0)

(encode '(sha na na na na na na na) tree)
;; => (1 1 1 0 0 0 0 0 0 0 0)

(encode '(wah yip yip yip yip yip yip yip yip yip) tree)
;; => (1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0)

(encode '(sha boom) tree)
;; => (1 1 1 0 1 1 0 1 1)
