(ns aoc-2021.day3
  (:require [aoc-2021.utils :as utils]
            [clojure.string :as str]))

(defn count-ones
  [input-string]
  (->> input-string (filter (partial = \1)) count))

(defn transpose [input]
  (apply mapv vector input))

(defn binary-value
  [bin]
  (let [length (count bin)]
    (utils/sum (map-indexed (fn [idx v] (bit-shift-left v (- length idx 1))) bin))))

(defn compute-gamma-value
  [input input-length]
  (binary-value (map #(if (> %1 (/ input-length 2)) 1 0) (map count-ones (transpose input)))))

(defn compute-epsilon-value
  [gamma-value input-width]
  (- (bit-shift-left 1 input-width) 1 gamma-value))

(defn day3-part1
  []
  (let [input (->> "day3.txt" utils/get-lines-input)
        input-length (count input)
        input-width (count (first input))
        gamma-value (compute-gamma-value input input-length)
        epsilon-value (compute-epsilon-value gamma-value input-width)]
    (* gamma-value epsilon-value)))

(defn day3-part2
  []
  nil)
