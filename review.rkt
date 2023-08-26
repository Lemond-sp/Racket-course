;7(data-abstraction)
(define x (cons 1 2))
(car x)
(define y (cons 3 4))
(define z (cons x y))
z
(car(car z))
(cdr z)

;8 list
(define x (list 1 2 3 4))
x
(car x)
(cdr x)
(car (cdr x))
(cdr (cdr x))
(length x)
(null? x)

;9 apply list
(define x(list (list 1 2) 3 (list 4 5)))
(cdr(cdr x))
(car(cdr(cdr x)))
(cdr(cdr(cdr x)))

(define y(list (list (list 1 (list 2 3)) (list 4 5 6) 7) (list 8 9)))
(car y)
(define z(cons (list 1 2) (list 3 4)))
(car z)
(cdr z)

(define x '())
(define y (list 1 2 3))
(define z(append x (cdr(cdr y))))
(append z (car(cdr y)))
(reverse y)
;map
(map abs (list -10 10 9))

