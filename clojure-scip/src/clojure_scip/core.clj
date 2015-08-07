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



