(require rnrs/mutable-pairs-6)

(define (dmake)
  (cons '() '()))

(define (d0el? d)
  (null? (car d)))

(define (d1el? d)
  (null? (cdar d)))

(define (dprint d)
  (define (rec x)
    (when (not (null? x))
      (display (caaar x))
      (rec (cdr x))))
  (rec (car d)))

(define (dfront d)
  (caaar d))

(define (drear d)
  (caadr d))

(define (dinsert-first d item)
  (let* ((a (cons item '()))
	 (b (cons a '())))
    (set-car! d b)
    (set-cdr! d b)))

(define (dfront-insert d item)
  (cond ((d0el? d) (dinsert-first d item))
	(#t
	 (let* ((a (cons item (cdr d)))
		(b (cons a '())))
	   (set-car! d b)
	   (set-cdr! (cadar b))))))
		   
(define (drear-insert d item)
  (cond ((d0el? d) (dinsert-first d item))
	(#t
	 (let* ((a (cons item (cdr d)))
		(b (cons a '())))
	   (set-cdr! d b)
	   (set-cdr (cdadr d) b)))))

(define (ddelete-first d)
  (set-car d '())
  (set-cdr d '()))

(define (dfront-delete d)
  (cond ((d1el? d) (ddelete-first d))
	(#t
	 (begin
	   (set-cdr! d (cdadr d))
	   (set-car! a (cdar d))))))

(define (dread-delete d)
  (cond ((d1el? d) (ddelete-first d))
	(#t
	 (begin
	   (set-cdr! d (cdadr d))
	   (set-cdr! (cdr d) '())))))


(define d (dmake))

(dfront-insert d 'a)
