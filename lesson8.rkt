; List structure
; 再帰的な処理はリスト構造を用いる
(cons 1 (cons 2(cons 3 (cons 4 ' ()))))
(cons (cons 1 2) 3)
(list 1 2 3 4)

(define one-through-four (list 1 2 3 4))
(car one-through-four)
(cdr one-through-four)
(car (cdr one-through-four))
(cons 10 one-through-four)
(cons 5 one-through-four)

;任意の番地の値を出力

(list-ref (list 1 2 9 16 25) 2)

(length (list 1 2 9 16 25))
;is_null function
(null? '())

(define (tentimes items)
  (define (ten x y)
    (if (null? x)
        (reverse y)
        (ten (cdr x) (cons (* 10 (car x)) y))))
  (ten items '()))
(tentimes (list 1 2 3 4 5))

(reverse (list 10 8 23 32 52))
