;filter
(define (filter predicate sequence)
  (cond ((null? sequence) '())
        ((predicate (car sequence))
(cons (car sequence)
(filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))
;reduce
(define (reduce op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (reduce op initial (cdr sequence)))))
;1
;quicksort
(define quicksort
  
(lambda (xs)
(cond
  ((null? xs) '())

  (else

   (append

    (quicksort (filter (lambda (x)(< x (car xs))) xs))

    (filter (lambda (x)(= x (car xs))) xs)

    (quicksort (filter (lambda (x) (> x (car xs))) xs)))))))

(quicksort '( 3 2 1 6 5 9 4 0 ))

;2

(define hash-size 257)
(define (hash-func x)
  (remainder (reduce + 0 (map char->integer (string->list (symbol->string x))))
             hash-size))
(define (make-hash-table) (make-vector hash-size '()))
(define x (make-hash-table))
(vector-set! x (hash-func 'banana) (list (list 'nabana 10) (list 'banana 100)))
(vector-set! x (hash-func 'apple) (list (list 'apple 200)))

;hash-ref
(define (hash-ref v w)
  (cond
    ((null? (vector-ref v (hash-func w)))
     '()
     )
    (else
     (car (filter (lambda (x) (eq? (car x) w)) (vector-ref v (hash-func w)))))))
(hash-ref x 'apple)
(hash-ref x 'nabana)
(hash-ref x 'banana)
(vector-ref x (hash-func 'nabana))
(set-car! (cdr(hash-ref x 'nabana)) 120)
;(hash-ref x 'nabana)
(vector-ref x (hash-func 'nabana))
;3
;hash-insert!
(define x (make-hash-table))
(vector-set! x (hash-func 'banana) (list (list 'nabana 10) (list 'banana 100)))
(vector-set! x (hash-func 'apple) (list (list 'apple 200)))
(append (list (list 'nabana 10) (list 'banana 100)) (list(list 'a 1)))
;追加(新規)
(vector-set! x (hash-func 'banana) (append (vector-ref x (hash-func 'banana)) (list(list 'a 1))))
(vector-ref x (hash-func 'banana))
;null?
(null? (hash-ref x 'pear))
;追加(上書き)
(define z (list (list 'a 1) (list 'b 2)))
(define t (list 'a 1))

(set-car! (cdr t) 100)

(set-car! (cdr(hash-ref x 'banana)) 120)
(hash-ref x 'banana)
(vector-ref x (hash-func 'banana))
;hash-insert!

(define (hash-insert! x k v)
  (cond 
    ((and(not(null? (vector-ref x (hash-func k)))) (null? (hash-ref x k)))
     
     (vector-set! x (hash-func k) (append (vector-ref x (hash-func k)) (list(list k v)))))
    
    ((and (null? (vector-ref x (hash-func k))))
     (vector-set! x (hash-func k) (list (list k v))))
    
    (else
     (set-car! (cdr(hash-ref x k)) v))))

(define x (make-hash-table))
(hash-insert! x 'banana 100)
(hash-ref x 'banana)
(vector-ref x (hash-func 'banana))
(vector-set! x (hash-func 'nabana) (append (vector-ref x (hash-func 'banana)) (list(list 'nabana 10))))
(vector-ref x (hash-func 'banana))
(hash-ref x 'nabana)
(hash-insert! x 'nabana 20)
(hash-insert! x 'apple 50)
(hash-ref x 'banana)
(hash-ref x 'nabana)
(hash-ref x 'apple)
(hash-insert! x 'banana 200)
(hash-ref x 'banana)
