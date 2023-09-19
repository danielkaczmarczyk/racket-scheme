#lang racket

; accepts the length of a side of an equilateral cube and computes its volume. If you have time, consider defining csurface, too.
(provide
  cvolume
  csurface
)

(define (cvolume x)
  (* x x x))

(define (ssurface x)
  sqr x)

(define (csurface x)
  (* 6 (ssurface x)))
