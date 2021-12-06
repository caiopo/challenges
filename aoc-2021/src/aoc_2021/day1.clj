(ns aoc-2021.day1
  (:require [aoc-2021.utils :as utils]))

(defn compare-previous-current-and-increment
  [acc [v1 v2]]
  (if (< v1 v2) (+ acc 1) acc))

(defn day1-part1
  []
  (->> "day1.txt" utils/get-int-list-input (partition 2 1) (reduce compare-previous-current-and-increment 0)))

(defn build-sliding-window
  [input]
  (->> input (partition 3 1) (map utils/sum)))

(defn day1-part2
  []
  (->> "day1.txt" utils/get-int-list-input build-sliding-window (partition 2 1) (reduce compare-previous-current-and-increment 0)))
