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

