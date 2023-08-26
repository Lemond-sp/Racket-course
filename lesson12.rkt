;mutable data object
;(set-car! <変更対象のぺア> <変更内容>)
;car変更内容に繋げ変える
;(set-cdr! <変更対象のペア> <変更内容>)
;append
(define x '(a b c d))
(define y '(e f))
(define z (append x y))
x
y
z

;last-pair
(define x '((a b) (c (d e))))

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(cdr x)
(cdr (cdr x))
(last-pair x)

;append!
(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)
(define x '(a b c d))
(define y '(e f))
x
y
(append! x y)
x
y

;eq?
(eq? 1 1)
(eq? 1 1.0)

