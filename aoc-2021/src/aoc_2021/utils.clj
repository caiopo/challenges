(ns aoc-2021.utils  (:require [clojure.java.io :as io]
                              [clojure.string :as str]))

(defn parse-int [s]
  (Integer/parseInt (re-find #"\A-?\d+" s)))

(defn get-lines-input
  [file]
  (->> file io/resource slurp str/split-lines))

(defn get-int-list-input
  [file]
  (->> file get-lines-input (map parse-int)))

(defn sum
  [input]
  (reduce + 0 input))

(defn product
  [input]
  (reduce * 1 input))
