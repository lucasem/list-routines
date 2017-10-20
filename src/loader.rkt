#lang racket
; INPUT json:
;     { "op": <evaluate|validate|generate>,
;       "routine": <str>,
;       "input": <list/number>,
;       "params": {obj}  // for generate, can specify "count" or routine-specific param
;     }
; OUTPUT json:
; op = validate => bool
; op = evaluate => null if invalid, else routine output
; op = generate => list of routine inputs
; op = examples => list of routine inputs

(require json)
(require racket/sandbox)

(define allowed-requires-std '("src/prelude.rkt" math/distributions))
(define allowed-requires-routines
  (map (λ (p) (string-append "src/routines/" (path->string p)))
       (directory-list "src/routines")))
(define allowed-requires (append allowed-requires-std allowed-requires-routines))

(define (main)
  (let ([line (read-bytes-line)])
    (if (eof-object? line)
      (exit)
      (let* ([js          (bytes->jsexpr line)]
             [op          (hash-ref js 'op "evaluate")]
             [routine     (hash-ref js 'routine)]
             [inp         (hash-ref js 'input '())]
             [gen-params  (hash-ref js 'params (make-hasheq))]
             [evaluator   (make-evaluator 'racket/base
                                          #:allow-for-require allowed-requires)])
      (evaluator `(require ,(string-append "src/routines/" routine ".rkt")))
      (write-json (case op
        [("validate") (evaluator `(validate ',inp))]
        [("evaluate") (evaluator `(let ([inp ',inp])
                                    (if (validate inp) (evaluate inp) 'null)))]
        [("examples") (evaluator '(examples))]
        [("generate") (evaluator `(generate ,gen-params))]
        [else 'null]))
      (newline)
      (main)))))
(main)