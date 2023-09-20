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

(profit 3)
