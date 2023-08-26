;problem10
(memq 'apple '(x (apple sauce) y apple pear))
(memq 'apple (car '((apple 100) (orange 5) (pear 20) (banana 80))))
(car '((apple 100) (orange 5) (pear 20) (banana 80)))
(cdr '((apple 100) (orange 5) (pear 20) (banana 80)))
(cdr (cdr '((apple 100) (orange 5) (pear 20) (banana 80))))
(memq 'apple (car '((apple 100) (orange 5) (pear 20) (banana 80))))
(memq 'apple '((apple 100) (orange 5) (pear 20) (banana 80)))
;1
(define (assoc-find item x)
  (cond ((null? x) 'assoc-not-found)
        ((eq? item (car(car x))) (car x))
        (else (assoc-find item (cdr x)))))
(assoc-find 'foo '((apple 100) (orange 5) (pear 20) (banana 80)))

;(expt x n) = x^n
(define x 3)
(expt x 3)
;2
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2) (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (=number? exp num) (and (number? exp) (= exp num)))

(define (sum? x) (and (pair? x) (eq? (car x) '+)))
(define (product? x) (and (pair? x) (eq? (car x) '*)))
(define (power? x) (and (pair? x) (eq? (car x) '^)))
(define (arg1 s) (car (cdr s)))
(define (arg2 s) (car (cdr (cdr s))))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (arg1 exp) var)
                   (deriv (arg2 exp) var)))
        ((product? exp)
         (make-sum
          (make-product (arg1 exp)
                        (deriv (arg2 exp) var))
          (make-product (deriv (arg1 exp) var)(arg2 exp))))
        ((power? exp)
         (make-product (arg2 exp)
                       (make-product (make-power (arg1 exp) (- (arg2 exp) 1)) (deriv (arg1 exp) var))))
        
;**************************************************
;****ここにべき乗に対応するプログラムを埋め込む****
;**************************************************
        (else
         (error "unknown expression type --DERIV" exp))))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
      ((=number? m1 1) m2)
      ((=number? m2 1) m1)
      ((and (number? m1) (number? m2)) (* m1 m2))
      (else (list '* m1 m2))))
(define (make-power k1 k2)
  (cond ((=number? k2 0) 1)
        ((=number? k2 1) k1)
        ((and (number? k1) (number? k2)) (expt k1 k2))
        (else (list '^ k1 k2))))
;**************************************************
;**** ここに make-power を書く *****
;**************************************************
(deriv '(+ (* 3 (^ (+ (* 8 x) 2) 5) ) (* 2 (^ x 2)) 15) 'x)


;3

