(ns advent.core
  (:require [clj-http.client :as client]))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println "Hello, World!"))


(def tenNum (+ 4 6))

;;name space not resolving
;;require login
(def input1HTTP (clj-http.client/get "http://adventofcode.com/day/1/input"))


;;day 1
(def input1 (slurp "inputs/1"))

;;part one
(- (count (re-seq #"\(" input1)) (count (re-seq #"\)" input1)))

;;part two

(.indexOf (reduce (fn [output element]
          (conj output (+ (or (last output) 0) (if (= element \() 1 -1))))
        []
        (seq input1)) -1)