;range
(define (range low high)
  (if (> low high)
      '()
      (cons low (range (+ low 1) high))))
;局所状態変数
;set!
;(set! <name> <new-value>)
;begin
;(begin <exp1> <exp2> ... <expk>)
;evaluate exp1 to expk
;return value of <expk> as a whole values
(define balance 100)
(define (withdraw amount)
  (if (>= balance amount)
      (begin
        (set! balance (- balance amount))
        balance)
      "insufficient funds"))
;同じ引数でも返り値が異なる
(withdraw 25)
(withdraw 25)

;create object
(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
        (begin
          (set! balance (- balance amount))
          balance)
        "Insufficient funds")))
(define W1 (make-withdraw 100))
(define W2 (make-withdraw 100))
(W1 50)
(W2 70)


;account with multiple features
(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin
          (set! balance (- balance amount))
          balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  ;internally defined
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (display "Unknown request -- MAKE-ACCOUNT")
                (display m))))
  dispatch)
(define acc (make-account 100))
((acc 'withdraw) 50)
;((acc 'unko) 10)
((acc 'deposit) 120)
(define acc1 (make-account 1000))
((acc1 'deposit) 100)

;set! is insert operation, procedural laguage!
;sum function by functional lang
(define (sum n)
  (if (= n 1)
      1
      (+ n (sum (- n 1)))))
(sum 10)
;by procedural
(define (sum n)
  (define result 0)
  (define i 1)
  ;iter func(no return val)
  (define (iter)
    (if (<= i n)
        (begin
          (set! result (+ result i))
          (set! i (+ i 1))
          (iter))
        'done))
  ;execute iter
  (iter)
  ;return result
  result)
(sum 10)
;define [for]
(define (for seq proc)
  (if (null? seq)
      'done
      (begin (proc (car seq))
             (for (cdr seq) proc))))

(define (sum n)
  (define result 0)
  (for (range 1 n)
    (lambda (i) (set! result (+ result i))))
  result)
(sum 10)

;cost of insert

