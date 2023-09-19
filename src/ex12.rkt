#lang racket

; accepts the length of a side of an equilateral cube and computes its volume. If you have time, consider defining csurface, too.
(provide cvolume)

(define (cvolume x)
  (* x x x))
