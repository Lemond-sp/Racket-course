;queue
(define (make-queue) (cons '() '()))
(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))

(define (empty-queue?) (null? (front-ptr queue)))
;return front queue data
(define (front-queue queue)
  (if (empty-queue? queue)
      (error "FRONT called with an empty queue" queue)
      (car (front-ptr queue))))

;insert-queue
(define (insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-queue? queue)
           (set-front-ptr! queue new-pair)
           (set-rear-ptr! queue new-pair)
           queue)
          (else
           (set-cdr! (rear-ptr queue) new-pair)
           (set-rear-ptr! queue new-pair)
           queue))))
;delete-queue
(define (delete-queue! queue)
  (cond ((empty-queue? queue)
         (error "DELETE! called with an empty queue" queue))
        (else
         (set-front-ptr! queue (cdr (front-ptr queue)))
         queue)))

;3.3.3表の表現
;連想リスト
(define (make-table) (list '*table*))
;等しいキーがあるかどうか順に見る
(define (myassoc key records)
  (cond ((null? records) #f)
        ((equal? key (car (car records))) (car records))
        (else (myassoc key (cdr records)))))
;lookup
(define (lookup key table)
  (let ((record (myassoc key (cdr table))))
    (if record
        (cdr record)
        #f)))
;insert!
(define (insert! key value table)
  (let ((record (myassoc key (cdr table))))
    (if record
        (set-cdr! record value)
        (set-cdr! table
                  (cons (cons key value) (cdr table)))))
  'ok)
(define a (make-table))
a
(insert! 'a 1 a)
a
(insert! 'b 2 a)
a
(lookup 'b a)
a

(< 3 5)

