#lang racket

(provide attendees)

(define (attendees ticket-price)
  (- 120 (* (- ticket-price 5.0) (/ 15 0.1))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ 180 (* 0.04 (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(profit 3)
