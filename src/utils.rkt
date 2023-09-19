#lang racket

(provide clear-screen print-message)

(define (clear-screen) (void (system "clear")))
(define SPACE " ")

; TODO this may not be necessary to use string-ref. check it out later
(define (print-char-n-times char n)
  (display (make-string n (string-ref char 0))))

(define (get-terminal-width)
  (string->number (string-trim (with-output-to-string
                 (lambda () (system "tput cols"))))))

(define (print-message message char)
  (define width (get-terminal-width))
  (define message-len (string-length message))
  ; space, char * n, space, message, space, char * n, space
  ; so n (times I mean) should be:
  ; (width - 4 (for spaces) - len(message)) / 2
  (define times (/ (- width 4 (string-length message)) 2))
  (display SPACE)
  (print-char-n-times char times)

  (display SPACE)
  (display message)
  (display SPACE)
  (print-char-n-times char times)
  (display SPACE)
  (display "\n")
  (display "\n"))

