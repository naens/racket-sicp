(load "ex68.rkt")

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge set)
  (cond ((= (length set) 1) (car set))
	(#t (successive-merge (adjoin-set (make-code-tree (first set) (second set))
					  (cddr set))))))

;;(encode '(a b c d) (generate-huffman-tree '((a 3) (b 5) (c 6) (d 6))))
;; => (0 0 0 1 1 1 1 0)

