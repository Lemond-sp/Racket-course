(define (cube x) (* x x x))
(cube 3)
;f,g関数
(define (f g x y z)
  (+ (g x) (g y) (g z)))
(f cube 2 3 4)

(define (sum f a b)
  (if (> a b)
      0
      (+ (f a)
         (sum f (+ a 1) b))))
;1-10 sum-of cube
(sum cube 1 10)
(define (identity x) x)
(define (square x) (* x x))

((lambda (x y z) (+ x y (square z))) 1 2 3)

;kyokusho_hensu(let)
(define (f x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))
