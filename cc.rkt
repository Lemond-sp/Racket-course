;for
(define (for seq proc)
  (if (null? seq)
      'done
      (begin (proc (car seq))
             (for (cdr seq) proc))))
;range
(define (range low high)
  (if (> low high)
      '()
      (cons low (range (+ low 1) high))))
;b
(define (mulmap opx ll)
  (map (lambda (i) (* i opx)) ll))
(define (cov l)
  (define res (list (list)))
  (for (range 0 (-(length l) 1))
    (lambda (i)(set! res (append res (list(mulmap (list-ref l i) l))))))
  (cdr res))

(cov '(1 2 3 4 5) )

(define x (list (list 1 2 3 4 5) (list 6 7 8 9 10) (list 11 12 13 14 15)))
x
(display "(")
(car x)
(display "\n")
(display " ")
(cdr x)
(list-ref x 1)
;(define printm x)