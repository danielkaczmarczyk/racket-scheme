#lang racket

(require htdp/2e)

; hey fractionals are cool
(define (C f)
  (* 5/9 (- f 32)))

(define (convert in out)
  (write-file out
    (string-append
      (number->string
        (C
          (string-number
            (read-file in))))
      "\n")))
