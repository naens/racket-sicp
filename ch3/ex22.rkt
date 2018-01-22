(require rnrs/mutable-pairs-6)

(define (make-queue)
  (let ((front-ptr '())
	(rear-ptr '()))
    (define (print-queue) (display front-ptr))
    (define (empty-queue?) (null? front-ptr))
    (define (front-queue) (if (empty-queue?) '() (mcar front-ptr)))
    (define (delete-queue!)
      (when (not (empty-queue?)) (set! front-ptr (mcdr front-ptr))))
    (define (insert-queue! item)
      (let ((new (mcons item '())))
	(if (empty-queue?)
	    (set! front-ptr new)
	    (set-mcdr! rear-ptr new))
	(set! rear-ptr new)))
    (define (dispatch m)
      (cond ((eq? m 'print-queue) print-queue)
	    ((eq? m 'empty-queue?) empty-queue?)
	    ((eq? m 'front-queue) front-queue)
	    ((eq? m 'delete-queue!) delete-queue!)
	    ((eq? m 'insert-queue!) insert-queue!)
	    (#t (error "unknown message"))))
    dispatch))

(define q (make-queue))
((q 'print-queue))
;; ()

((q 'insert-queue!) 'a)
((q 'print-queue))
;; {a}

((q 'insert-queue!) 'aa)
((q 'print-queue))
;; {a aa}

((q 'front-queue))
;; a

((q 'delete-queue!))
((q 'print-queue))
;; {aa}

((q 'front-queue))
;; aa

((q 'delete-queue!))
((q 'print-queue))
;; ()

