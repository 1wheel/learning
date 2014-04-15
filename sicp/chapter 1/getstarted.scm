(+ 234234 234234)
123123
12

(define size 100)

(define (square x) (* x x) )

(define (e1.3 a b c)
	(+ (square a) (square b) (square b) (- (min a b c) ) )
)


(define (cube-iter guess x)
	(if (good-enough? guess x)
		guess
		(cube-iter (improveCube guess x)
								x)
	)
)

(define (improveCube x y) 
	(/ (+ (/ x (* y y )) y y) 3)
)

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))



(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(define (count-change amount)
  (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))


(define (f1.11 n) 
	(if (< n 3)
		n
		(+ (f1.11 (- n 1))
			 (* (f1.11 (- n 2)) 2)
			 (* (f1.11 (- n 3)) 3))))

(define (f1.12 r c)
	(cond ((= c 0) 1)
				((= r c) 1)
				(else (+ (f1.12 (- r 1) c) (f1.12 (- r 1) (- c 1))))))



(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b
                (- counter 1)
                (* b product)))) 

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))



(define (lexpt b n)
	(expt-iter b n p))

(define (expt-iter b n p)
	(cond ((= n 0) p))
				((= (remainder n 2) 0) (expt-iter (* b b) (/ n 2) p))
				((else (expt-iter (* b b) (/ (- n 1) 2) (* p b))))
)


b = 3
n = 7
p = 1

while (n > 0){
    if (n % 2 == 1){
        n = (n - 1);
        p = p*b;
    }
    n = n/2;
    b = b*b;
}
console.log(p)


(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

Exercise 1.30.  The sum procedure above generates a linear recursion. The procedure can be rewritten so that the sum is performed iteratively. Show how to do this by filling in the missing expressions in the following definition:

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))


(accumulate combiner null-value term a next b)


(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum term a next b)
	(accumulate + 0 term a next b)
)

(define (double fun)
  (lambda (x) (fun (fun x))))

((double square) 10)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (cond ((= n 1) f)
        (else (compose (repeated f (- n 1)) f))))

(define dx .0001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(((repeated smooth 5) square) 3)