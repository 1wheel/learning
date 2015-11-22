(ns drawing.practice
  (:require [quil.core :as q]
            [quil.middleware :as m]))

(defn setup []
  (q/smooth)
  {:flake (q/load-image "images/white_flake.png")
   :background (q/load-image "images/blue_background.png")
   :params [{:x 10  :swing 1 :y 10  :speed 1}       ;; swing was added in step 7-1
            {:x 200 :swing 3 :y 100 :speed 4}       ;;
            {:x 390 :swing 2 :y 50  :speed 2}]})    ;;

;; this update-x function was added in step 7-2
(defn update-x
  [m]
  (let [x (:x m)
        swing (:swing m)
        y (:y m)]
    (cond
     (< x 0) (assoc m :x (q/width))
     (< x (q/width)) (update-in m [:x] + (* swing (q/sin (/ y 50))))
     :else (assoc m :x 0))))

(defn update-y
  [m]
  (let [y (:y m)
        speed (:speed m)]
    (if (>= y (q/height))
      (assoc m :y 0)
      (update-in m [:y] + speed))))

(defn update [state]
  (:params state)
  (let [params  (:params state)
        params (map update-y params)
        params (map update-x params)]               ;; added in step 7-3
    (assoc state :params params)))

(defn draw [state]
  (q/background-image (:background state))
  (let [params (:params state)]
    (dotimes [n 3]
      (let [param (nth params n)]
        (q/image (:flake state) (:x param) (:y param))))))

(q/defsketch practice
  :title "Clara's Quil practice"
  :size [500 500]
  :setup setup
  :update update
  :draw draw
  :features [:keep-on-top]
  :middleware [m/fun-mode])
