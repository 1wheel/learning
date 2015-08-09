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