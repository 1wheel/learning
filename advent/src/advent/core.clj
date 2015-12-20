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



;;day 2
(def input2 (slurp "inputs/2"))

(def presentStrs (clojure.string/split-lines input2))

(defn presentStrToObj [str]
  (let [dims (map #(Integer/parseInt %) (clojure.string/split str #"x"))
         x (nth dims 0)
         y (nth dims 1)
         z (nth dims 2)
         xy (* x y)
         yz (* y z)
         zx (* z x)
         min (min xy yz zx)
         paper (+ (* 2 (+ xy yz zx)) min)
         smallestFace (+ x y z (- (max x y z)))
         ribbon (+ smallestFace smallestFace (* x y z))
         ]
    {:x x :y y :z z :min min :paper paper :dims dims :str str :smallestFace smallestFace :ribbon ribbon}))

(presentStrToObj "21x9x11")
(presentStrToObj "2x3x4")
(presentStrToObj "1x1x10")

(def presents (map presentStrToObj presentStrs))

;;part 1
(reduce + (map :paper presents))

;;part 2
(reduce + (map :ribbon presents))



;;day 3
(def input3 (seq (slurp "inputs/3")))

;;Map literal must contain an even number of forms??
(reduce
  (fn [p v]
    (let [x (+ (:x p) (cond (= v \<) -1 (= v \>) 1 :else 0))
          y (+ (:y p) (cond (= v \v) -1 (= v \^) 1 :else 0))
          places (assoc (:places p) {(keyword (str x "-" y))} 1)]
      {:x x :y y :places places})
  {:x 0 :y 0 :places {(keyword "0-0") 1}})
  input3)

(defn seqToWalk [seq] (reduce
  (fn [p v]
    (let [x (+ (:x p) (cond (= v \<) -1 (= v \>) 1 :else 0))
          y (+ (:y p) (cond (= v \v) -1 (= v \^) 1 :else 0))
          places (conj (:places p) (str x "_" y))]
      {:x x :y y :places places}))
    {:x 0 :y 0 :places ["0_0"]}
  seq))

;;part 1
(count (distinct (:places (seqToWalk input3))))

(count (distinct (concat
                   (:places (seqToWalk (take-nth 2 input3)))
                   (:places (seqToWalk (take-nth 2 (rest input3)))))))




;;day 4

(import 'java.security.MessageDigest
        'java.math.BigInteger)

(defn md5 [s]
  (let [algorithm (MessageDigest/getInstance "MD5")
        size (* 2 (.getDigestLength algorithm))
        raw (.digest algorithm (.getBytes s))
        sig (.toString (BigInteger. 1 raw) 16)
        padding (apply str (repeat (- size (count sig)) "0"))]
    (str padding sig)))

(md5 "12312312")

;;part 1/2
(loop [x 0]
  (if (.startsWith (md5 (str "bgvyzdsv" x)) "000000")
    x
    (recur (+ x 1))))

(md5 (str "bgvyzdsv" 254575))
(.startsWith (md5 (str "bgvyzdsv" 1136268)) "00000")
(.startsWith (md5 (str "bgvyzdsv" 0)) "0")


;;day 5
(def input5 (slurp "inputs/5"))
(def strings (clojure.string/split-lines input5))

(defn isVowel [x]
  (not= nil (re-find #"a|e|i|o|u" x)))

(defn has3Vowels [str]
  (> (count
       (filter isVowel (clojure.string/split str #"")))
  2))
(has3Vowels "asdfasdfasdf")

(defn hasRepeat [str]
  (true? (reduce
    (fn [p v]
      (cond (= p true) true (= p v) true :else v))
    (clojure.string/split str #""))))
(hasRepeat "asdfasdf")

(defn hasNoBadSubstr [str]
  (= nil (re-find #"ab|cd|pq|xy" str)))
(hasNoBadSubstr "asdfasdfadab")

;;part 1
(->>
  (slurp "inputs/5")
  (clojure.string/split-lines)
  (filter hasRepeat)
  (filter has3Vowels)
  (filter hasNoBadSubstr)
  count)

(def testStr "haegwjzuvuyypxyu")
(hasRepeat testStr)
(has3Vowels testStr)
(hasNoBadSubstr testStr)

(defn noOverlap [clist]
  (cond
    (< (count clist) 3) true
    (= (first clist) (first (rest clist)) (first (rest (rest clist)))) false
    :else (noOverlap (rest clist))))

(defn hasPair [clist]
  (let [slist (sort clist)]
    (cond
      (< (count slist) 2) false
      (= (first slist) (first (rest slist))) true
      :else (hasPair (rest slist)))))

(hasPair clist)
(def slist (sort clist))
(= (first slist) (first (rest slist)))
(first slist)
(first (rest slist))
(< (count slist) 2)

(defn hasSpacedPair [clist]
  (let [slist (sort clist)]
    (cond
      (< (count slist) 3) false
      (= (first slist) (first (rest (rest clist)))) true
      :else (hasSpacedPair (rest slist)))))
(hasSpacedPair clist)

(defn strToList [str]
  (clojure.string/split  str #""))

;;part 2
(->>
  (slurp "inputs/5")
  (clojure.string/split-lines)
  (map strToList)
  (filter hasPair)
  (filter hasSpacedPair)
  (filter noOverlap)
  count)



(noOverlap (clojure.string/split  "aaaasdfasd" #""))
(noOverlap (clojure.string/split  "aasdfasd" #""))


(def clist (clojure.string/split  "uurcxstgmygtbstg" #""))
(hasPair clist)
(hasSpacedPair clist)
(noOverlap clist)



;;day 6


 (count (map (fn [x] 0) (range 1000000)))



;; day 7
(bit-xor 10 32)
(bit-shift-left 8 1)
(bit-shift-right 8 1)


(->>
  (slurp "inputs/6")
  (clojure.string/split-lines))

(def wires (clojure.string/split-lines (slurp "inputs/7")))








































