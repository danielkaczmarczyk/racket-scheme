#lang racket

; accepts the length of a side of an equilateral cube and computes its volume. If you have time, consider defining csurface, too.
(provide
  cvolume
  csurface

  string-first
)

;ex 12
(define (cvolume x)
  (* x x x))

(define (ssurface x)
  sqr x)

(define (csurface x)
  (* 6 (ssurface x)))

;ex 13
;Define the function string-first, which extracts the first 1String from a non-empty string
(define (string-first str)
  (if
    (eq? (string-length str) 0)
    ""
    (substring str 0 1)))

