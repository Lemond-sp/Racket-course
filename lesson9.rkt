(list 1 2 3 4)

(length (list 1 11 1))

(null? '())

(list (list 1 2) 3 (list 4 5))

(define r (cons (list 1 2) (list 3 4)))
(length r)
(car r)
;count - leaves
(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
              (count-leaves (cdr x))))))
(count-leaves r)
;concat
(define (concat x)
  (cond ((null? x) 0)
        ((not (pair?)) x)
        (else (cons(concat (car x)) (concat (cdr x))))))
(concat (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))

;map
(map abs (list -10 1 0 9))
(map (lambda (x) (* x x)) (list -10 1 0 9))

;filter
(define (filter predicate sequence)
  (cond ((null? sequence) '())
        ((predicate (car sequence))
(cons (car sequence)
(filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))
(filter even? (list 0 1 2 3 4))

;range
(define (range low high)
  (if (> low high)
      '()
      (cons low (range (+ low 1) high))))
(range 1 3)

(define (fib n)
  (if (< n 2)
      n
      (+ (fib (- n 1)) (fib (- n 2)))))
;homework
;1
(define (even-fibs n)
  (filter even? (map fib (range 0 n))))
(even-fibs 20)

(define (count pred seq)
  (length (filter pred seq)))
(count even? (range 0 9))

;2
(length  (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(cdr (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(car (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(cdr (car (cdr (cdr (list (list 1 2 3) (list 4 5 6) (list 7 8 9))))))
(count-leaves  (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))

