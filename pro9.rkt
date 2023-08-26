;lesson9-homework
;concat
(define (filter predicate sequence)
  (cond ((null? sequence) '())
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (count pred seq)
  (length (filter pred seq)))
(count even? (list 1 2 3 4))
;reduce
(define (reduce op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (reduce op initial (cdr sequence)))))

(reduce cons (list -1 -2 -3) (list 0 1 2 3 4 5))
;test2
(define (concat x)
  (reduce cons (car(cdr (cdr x))) (reduce cons (car (cdr x)) (reduce cons '() (car x)))))
(concat (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))

(cons (list 1 2) (list 1 2) )

(define (range low high)
  (if (> low high)
      '()
      (cons low (range (+ low 1) high))))
;pro3
(define (superpow seq)
  (reduce +  0 (map (lambda (x) (* x x)) seq)))
(superpow (range 1 10000))

(* (reduce + 0 (range 1 100)) (reduce + 0 (range 1 200)))
(define (skw x)
  (reduce * 1 (range (+ x 1) (+ x 10))))
;pro3c
(reduce + 0 (range 1 20))
(reduce * 1 (range 1 10))
(reduce + 0 (map skw (range 1 20)))

