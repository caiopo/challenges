(ns aoc-2021.utils  (:require [clojure.java.io :as io]
                              [clojure.string :as str]))

(defn parse-int [s]
  (Integer/parseInt (re-find #"\A-?\d+" s)))

(defn get-int-list-input
  [file]
  (->> file io/resource slurp str/split-lines (map parse-int)))

(defn sum
  [input]
  (reduce + 0 input))
