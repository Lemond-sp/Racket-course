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
;define [for]
(define (for seq proc)
  (if (null? seq)
      'done
      (begin (proc (car seq))
             (for (cdr seq) proc))))
;define sum
(define (sum n)
  (define result 0)
  (for (range 1 n)
    (lambda (i) (set! result (+ result i))))
  result)
(sum 10)
;1
(define (pr1 n)
  (define res 0)
  (for (range 1 n)
    (lambda (i) (set! res (+ res (* i i)))))
  res)
(pr1 10000)
;2
(reduce + 0
        (map (lambda (i)
               (reduce + 0 (map (lambda (j) (* i j))
                                (range 1 200))))
             (range 1 100)))
(define (pr2 n m)
  (define res 0)
  (for (range 1 n)
    (lambda (i) (for (range 1 m)
                  (lambda (j) (set! res (+ res (* i j)))))))
  res)
(pr2 100 200)
;3(for seq proc) forは結果の残らないmapである
(define (pr3 n m)
  (define sum 1)
  (define res 0)
  (for (range 1 n)
    (lambda (i) (for (range 1 m)
                  (lambda (j) (set! sum (* sum (+ i j)))))
      (set! res (+ res sum))
      (set! sum (/ sum sum))))
    res)

(pr3 20 10)

;3_1
;(map proc items)
;lambdaとforの関係を探せ
(reduce + 0
        (map (lambda (i)
               (reduce * 1 (map (lambda (j) (+ i j))
                                (range 1 10))))
             (range 1 20)))


(length(list 1 4 9 16 25))
(append '() '(1))
;myreverse
;新しいリストを作成、対象のリストの末尾を追加する
;末尾を削除したリストをsetで返す
;以上ループ


(define (myreverse items)
  (define l '())
  (define (append_l x)
     (set! l (append  (list x) l))l)
  (for items
    append_l)
  l)
(myreverse (list 1 2 3 4) )

;(define x (list 1 2 3 4))
;(length x)
;(cdr x)


