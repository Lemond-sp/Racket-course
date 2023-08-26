;lesson10
;symbol

;quarts
'a
(define a 3)
(define b 2)
(list a b)
(list 'a 'b)
(list 'a b)
'(a b)
(car '(a b c))
(cdr '(a b c))
'(1 2 3)

(cons 1 (list 2 3))

;記号の等価性
;eq?
(define xlist '(x (apple sauce) y apple pear))
(car xlist)
(cdr xlist)
(cdr (cdr xlist))
(memq 'apple '(x (apple sauce) y apple pear))

;string
(display "hello\n")
'(x (apple sauce))
(cdr '(x (apple sauce)))
(memq 'apple '(x (apple sauce)))
(eq? 'apple '(apple sauce))
;error (eq? 'apple 'apple sauce)

