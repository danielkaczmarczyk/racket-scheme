#lang racket

; accepts the length of a side of an equilateral cube and computes its volume. If you have time, consider defining csurface, too.
(provide
  cvolume
  csurface

  string-first
  string-last

  ==>
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

;ex 14
(define (string-last str)
  (define last-i
    (string-length str))

  (substring str (- last-i 1) last-i))

;ex 15
;Define ==>. The function consumes two Boolean values, call them sunny and friday. Its answer is #true if sunny is false or friday is true. Note Logicians call this Boolean operation implication, and they use the notation sunny => friday for this purpose
(define (==> sunny friday)
  (define first-predicate (eq? sunny #false))
  (define second-predicate (eq? friday #true))
  (or first-predicate second-predicate))
