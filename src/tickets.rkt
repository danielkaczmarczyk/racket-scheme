#lang racket

(provide profit)

(define BASE_ATTENDANCE 120)
(define TICKET_PRICE_CHANGE_STEP 0.1) ; in dollars
(define TICKET_PRICE_CHANGE_ATTENDANCE 15) ; n of people that TICKET_PRICE_CHANGE_STEP affects
(define BASE_TICKET_PRICE 5.0)
(define FIXED_COST 180)
(define COST_VARIABLE_PER_PERSON 0.04)


(define (attendees ticket-price)
  (- BASE_ATTENDANCE (* (- ticket-price BASE_TICKET_PRICE) (/ TICKET_PRICE_CHANGE_ATTENDANCE TICKET_PRICE_CHANGE_STEP))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXED_COST (* COST_VARIABLE_PER_PERSON (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

;ex 28
;determine potential profit for prices $1, $2, ... $5. What price maximizes the profit of the movie theater? Determine the best ticket price to a dime.
; set up a variable max profit
; loop the function profit and if its result is larger than max profit, then update max profit and price set.
; v2
(define (max-profit range-start range-stop step)
  ;(define current-max-profit (profit price))
  ;(define current-max-price price)

  (for/fold ([current-max-profit -inf.0] [current-max-price -inf.0])
    ([x (in-range range-start range-stop step)])
    (let ([current-value (profit x)])
      (if (> current-value current-max-profit)
        (values current-value x)
        (values current-max-profit current-max-price)))))

  
; print out all caluclations to a file
; read the file and sort it
; output number 1

;(max-profit 0 10003.0 0.01)
