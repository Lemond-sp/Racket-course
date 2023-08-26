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

(define bt
'((5
(3 empty (4 empty empty))
(12 (7 (6 empty empty) (9 empty empty)) (25 (15 empty empty) empty)))))
(entry(entry bt))
(car(entry bt))
(entry(right(entry bt)))
(car(right(entry bt)))
(eq? (car(entry bt)) 5)
;12
(entry bt)

;1:find

(define (find n x)
  (define (find! node x1)
  (cond ((empty? node) #f)
        ((eq? (entry node) x1) #t)
        ((< (entry node) x1)
         (find! (right node) x1))
        (else
         (find! (left node) x1))))
  (find! (entry n) x))
(find bt 15)
(find bt 8)
(find bt 30)

bt
(cdr bt)
(define bt (make-binary-tree))
(define a (list bt))
a
(set! a 5)
a

;
;2:insert!
(define (insert! n x)
  (cond ((empty? (entry n))
      (set-entry! n (make-node x 'empty 'empty)))
        (else
         
        (cond ((< x (car(entry n)))
         (cond ((empty? (car(cdr(car n))))
                (set-left! (entry n) (make-node x 'empty 'empty)))
               (else(insert! (cdr(car n)) x))))
        ((> x (car(entry n)))
         (cond ((empty? (car(cdr(cdr(car n)))))
                (set-right! (entry n) (make-node x 'empty 'empty)))
               (else(insert! (cdr(cdr(car n))) x))))))))

(define bt (make-binary-tree))
;(entry bt)
(insert! bt 5)
(insert! bt 3)
(insert! bt 12)
(insert! bt 7)
(insert! bt 4)
(insert! bt 25)
(insert! bt 15)
(insert! bt 9)
(insert! bt 6)
(find bt 15)
(find bt 8)
bt
