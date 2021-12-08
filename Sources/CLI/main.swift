import AdventOfCode
import AOC2015
import AOC2016
import AOC2017
import AOC2018
import AOC2019
import AOC2020
import AOC2021
import Foundation

let year: Year = .y2021
let day = 7
let part = 2

let (result, measurement) = year.run(day: day, part: part)
print("""
Year \(year.index), Day \(day), Part \(part): ** \(result) **
execution time: \(measurement) milliseconds

""")
