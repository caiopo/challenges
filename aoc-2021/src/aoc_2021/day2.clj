(ns aoc-2021.day2
  (:require [aoc-2021.utils :as utils]
            [clojure.string :as str]))

(defn get-command-value-input
  [file]
  (->> file utils/get-lines-input (map #(str/split % #" ")) (map (fn [[c v]] [c (utils/parse-int v)]))))

(defn compute-depth-and-position
  [[depth position] [command value]]
  (case command
    "forward" [depth (+ position value)]
    "down" [(+ depth value) position]
    "up" [(- depth value) position]))

(defn day2-part1
  []
  (->> "day2.txt" get-command-value-input (reduce compute-depth-and-position [0 0]) utils/product))

(defn compute-depth-position-and-aim
  [[depth position aim] [command value]]
  (case command
    "forward" [(+ depth (* value aim)) (+ position value) aim]
    "down" [depth position (+ aim value)]
    "up" [depth position (- aim value)]))

(defn day2-part2
  []
  (->> "day2.txt" get-command-value-input (reduce compute-depth-position-and-aim [0 0 0]) (take 2) utils/product))
