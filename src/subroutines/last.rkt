#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require racket/list)
(require "../prelude.rkt")

(define input '(int-list (length-at-least 1)))
(define output '(int element))
(define params '())

(define description "gets the last element of the list.")
(define deps '())

(define example-params '(()))

(define (evaluate l params) (last l))

(define generate (generate-many
  #:len-valid (λ (len _) (positive? len))
  #:len-default (λ _ (random 1 8))))