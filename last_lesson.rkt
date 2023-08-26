;range
(define (range low high)
  (if (> low high)
      '()
      (cons low (range (+ low 1) high))))
;reduce
(define (reduce op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (reduce op initial (cdr sequence)))))
;cube
(define (cube x) (* x x))
;for
(define (for seq proc)
  (if (null? seq)
      'done
      (begin (proc (car seq))
             (for (cdr seq) proc))))

;1
(/ (-(+ (/ 19 42) 364)74) (+ 84 (/ (* 38 13) 567)))


(- (+ 723 (/ (+(+ -351  934) (/ 91 6)) (+(- 832 (/ 538 27)) 5))) 643)

(reduce * 1 (range 1 30))

(reduce + 0
        (map (lambda (i)
               (reduce + 0 (map (lambda (j) (cube (- i j)))
                                (range 1 100))))
             (range 1 100)))
;2

;3


;4
(define (concat ll)
  (if (null? ll)
      '()
      (append
       (car ll)
       (concat (cdr ll)))))

(concat '((10 8) (6) (8 15 87) () (9 5 6) (10 34)))

;5
;a
(define (mulmap opx ll)
  (map (lambda (i) (* i opx)) ll))
(mulmap 10 '(1 2 3 4 5))
;b
(define (mulmaq opx ll)
  (list(map (lambda (i) (* i opx)) ll)))
(mulmaq 10 '(1 2 3 4 5))

(list (list 1 2 3) (list 4 5 6) (list 7 8 9))
(* 10 (list-ref (list 1 2 3) 2))
(append (list(list 1 2 3)) (list(list 4 5 6)))

(define (cov l)
  (define res (list (list)))
  (for (range 0 (-(length l) 1))
    (lambda (i)(set! res (append res (list(mulmap (list-ref l i) l))))))
  (cdr res))
(cov '(1 2 3 4 5))