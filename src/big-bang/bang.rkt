#lang racket

(require 2htdp/image)
(require 2htdp/universe)

(define (number->square s)
  (square s "solid" "red"))

(define small (number->square 5))
(define medium (number->square 10))
(define large (number->square 15))

(define images (list small medium large))
(define filenames (list "small" "medium" "large"))
(define filenames-full (map (lambda (filename) (string-append filename ".png")) filenames))

(define (save-images)
  (for-each save-image images filenames-full))

(define (bang)
  (big-bang 100
    [to-draw number->square]
    [on-tick sub1]
    [stop-when zero?]))
            

(define (run)
  (bang))

(define (handle-input input-string)
  (cond
    [(string=? input-string "bang") (bang)]
    [(string=? input-string "exit") (displayln "Exiting...") (exit)]
    [else print-debug-input-info input-string]))

(define (print-debug-input-info input-string)
  (printf "input: ~a, length: ~a, last character: ~a\n"
        input-string 
        (string-length  input-string)
        (char->integer (string-ref  input-string (- (string-length input-string) 1)))))

(define (repl)
  (let loop()
    (printf "$: ")
    (define a (read-line (current-input-port) 'any))
    (if (= (string-length a) 0)
      (printf "")
      (handle-input a))
    (loop)))

(repl)

