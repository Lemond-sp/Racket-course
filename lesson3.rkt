(define (cube x) (* x x x))
(define (square x) (* x x))
(define (f x) (-(+ (cube x) (* 3 (square x))) 25))
(f 132)

(define (f x y) (+(* y(square x)) (* 83 x) (* -25 y)))
(f 132 20)

(define (f x y z) (+(* 3 (square x) (square y) z) (* 5 x (square z)) (* 7 (cube y) (square z))))
(f 12 2 8)

(define (f x y z) (+ (* (square x) (square x)) (* 10 x y z)
                     (* -1 (cube x) (square x) (cube z)) (* -1 (square y)) (* -6 y z) (* -1 x z)))
(f 2 3 8)


(define (f x y z) (+ (* -1 (square x)(square z)) (* 12 (square x) z) (* -37 (square x))
                     (* 14 x (square z)) (* -167 x z) (* 516 x) (* -1 (square y))
                     (* 4 y) (* -50 (square z)) (* 597 z)))
(f 8 2 7)

