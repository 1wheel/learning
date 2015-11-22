(ns drawing.lines
  (:require [quil.core :as q]))



(defn setup []
  (q/frame-rate 30)
  (q/color-mode :rgb)
  (q/stroke 255 0 0))

(defn draw []
  (def x (q/mouse-x))
  (def y (q/mouse-y))

  (q/fill-float 0 0 0 10)
  (q/rect 0 0 500 500)

  (q/stroke (mod (- x y) 255) (mod x 255) (mod y 255))
  (q/stroke 0 255 0)

  (q/line 0   0   x y)
  (q/line 500 0   x y)
  (q/line 0   500 x y)
  (q/line 500 500 x y))

(q/defsketch hello-lines
  :title "Multicolor lines"
  :size [500 500]
  :setup setup
  :draw draw
  :features [:keep-on-top])


