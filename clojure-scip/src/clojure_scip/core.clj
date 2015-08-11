(ns clojure-scip.core
  (:gen-class))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println "Hello, World!"))

(println 23123)
(println 23123)
(println 23123)

(let [my-var (+ 1
                2
                3)])

(defn my-fn [x y z] x)

(count (my-fn "hello" 3 4))

(def a 123123)

(+ a 123)

(defn square [x] (* x x))

(square 10)

(square (square 10))

(defn sum-of-squares [x y z] (+ (square x) (square y)))


(defn abs [x]
  (if (> x 0)
    x
    (- 0 x)))

(abs -10)

;;1.3

(defn smallest-square [x y z]
  (+ (square x) (square y) (square z) (- (square (min x y z)))))

(smallest-square 10 8 1)


;;1.4 - adds the absolute values of b to a


;;1.1.7

(defn average [x y]
  (/ (+ x y) 2))

(defn improve [guess x]
  (println guess x "improve")^
  (println (average guess (/ x guess)))
  (average guess (/ x guess)))

(defn good-enough? [guess x]
  (< (abs (- (square guess) x)) 0.0005))

(defn sqrt-iter [guess x]
  (println guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
               x)))

(sqrt-iter 1.0 2)

(improve 1 2)


;;1.6
(defn new-if [pre tc ec]
  (cond (pre tc) ))




;;2.1
(+ 10 10)

(def x [1 2])

(first x)
(last x)
(rest x)


(defn gcd [a b]
  (if (= b 0)
    a
    (gcd b (rem a b))))
(gcd 10 3)
(gcd 10 4)

(defn make-rat [n d]
  (let [g (gcd n d)]
    [(/ n g) (/ d g)]))

(defn make-rat [n d]
  (let [g (Math/abs (gcd n d))
        m (if (neg? d) (* -1 g) g)]
    [(/ n m) (/ d m)]))

(make-rat 1 2)


;;2.2
(defn make-segment [a b]
  [a b])
(def start-segment first)
(def end-segment last)
(def x-point first)
(def y-point last)
(defn make-point [a b] [a b])
(def seg [[1 2] [10 3]])
(defn midpoint-segment [s]
  (let [a (start-segment s)
        b (end-segment s)]
    [(average (x-point a) (x-point b))
     (average (y-point a) (y-point b))]))
(midpoint-segment seg)


;;2.3
(def rect [[15 23] [3 20]])
(defn rect-hieght [[a b]]
  (Math/abs (- (first a) (first b))))
(defn rect-width [[a b]]
  (Math/abs (- (last a) (last b))))

(defn rect-perm [r]
  (* 2 (+ (rect-hieght rect) (rect-width rect))))
(rect-perm rect)
(defn rect-area [r]
  (* (rect-hieght rect) (rect-width rect)))
(rect-area rect)
