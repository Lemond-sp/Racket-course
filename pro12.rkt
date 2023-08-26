(define data
  (cons (cons (cons (cons 1 5) (cons 8 7))
(cons (cons 10 11) 14))
(cons (cons (cons 2 17) (cons 100 (cons 253 30)))
              (cons 121 (cons 83 35)))))
data

(define (rewrite-30 x)
  (set-cdr! (cdr(cdr(car(cdr data)))) x))
(rewrite-30 353)
data

(define (rewrite-8 x)
  (set-car! (cdr(car(car data))) x))
(rewrite-8 21)
data


;setting
(define x (list 'a 'b))
(define z1 (cons x x))
(define z2 (cons (list 'a 'b) (list 'a 'b)))
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))
(define x '(1 2 3 4 5))
;(set-car! x (car(reverse x)))
;append!
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))
(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)



(define (reverse! x)
  (define (rev x y)
    (set-car! x (car y))
    (set-cdr! x (cdr y)))
  (rev x (reverse x))
  x)


(define x '(1 2 3 4 5))
(reverse! x)
x

