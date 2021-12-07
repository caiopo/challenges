(ns aoc-2021.core
  (:require [aoc-2021.day1]
            [aoc-2021.day2]
            [aoc-2021.day3]))

(defn print-day
  [day part1 part2]
  (println (str "Day " day ":"))
  (println (str "Part 1: " part1))
  (println (str "Part 2: " part2))
  (println))

(defn -main []
  (println "Starting")
  (print-day 1 (aoc-2021.day1/day1-part1) (aoc-2021.day1/day1-part2))
  (print-day 2 (aoc-2021.day2/day2-part1) (aoc-2021.day2/day2-part2))
  (print-day 3 (aoc-2021.day3/day3-part1) (aoc-2021.day3/day3-part2))
  ;(println (aoc-2021.day2/day2-part1))
  ;(println (aoc-2021.day1/day1-part1))
  ;(println (aoc-2021.day2/day2-part2))
  ;(println (aoc-2021.day3/day3-part1))
  ;
  )
