;basic function
(define (make-binary-tree) (list 'empty))
(define (make-node e l r) (list e l r))
(define (empty? n) (and (symbol? n) (eq? n 'empty)))
(define (entry n) (car n))
(define (left n) (car (cdr n)))
(define (right n) (car (cdr (cdr n))))
(define (set-entry! n v) (set-car! n v))
(define (set-left! n v) (set-car! (cdr n) v))
(define (set-right! n v) (set-car! (cdr (cdr n)) v))

(define (filter predicate sequence)
  (cond ((null? sequence) '())
        ((predicate (car sequence))
(cons (car sequence)
(filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))


(define (find n x)
  (define (find! node x1)
  (cond ((empty? node) #f)
        ((eq? (entry node) x1) #t)
        ((< (entry node) x1)
         (find! (right node) x1))
        (else
         (find! (left node) x1))))
  (find! (entry n) x))

(define bt
'((5
(3 empty (4 empty empty))
(12 (7 (6 empty empty) (9 empty empty)) (25 (15 empty empty) empty)))))

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (append! x y)
  (set-cdr! (last-pair x) y))


(define (member? item list) (cond ((null? list) #f)
((equal? (car list) item) #t)
(else (member? item (cdr list))) )
)
(define (remove-duplicates list) (cond ((null? list) '())
((member? (car list) (cdr list)) (remove-duplicates (cdr list)))
(else
(cons (car list) (remove-duplicates (cdr list))))
))


;3
(define (binary-tree->list n)
  (define z (list(list )))
  (define (bts! x)
    (cond ((empty? (left x)) (append! z (list(entry x))))
          (else
           (bts! (left x))))
    (append! z (list(entry x)))
    (cond ((empty? (right x)) (append! z (list(entry x))))
          (else
           (bts! (right x)))))
  (bts! (entry n))
  (cdr z))

(binary-tree->list bt)
