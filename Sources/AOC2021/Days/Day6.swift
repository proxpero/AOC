import AdventOfCode
import Foundation
import Parsing

extension Day {

    private static func parse(input: String) -> [Int] {
        Many(Int.parser(), separator: ",").parse(input)!
    }


    private static func p1(input: String) -> String {
        var school = School(timers: parse(input: input))
        school.simulate(days: 80)
        return String(describing: school.count)
    }

    private static func p2(input: String) -> String {
        var school = School(timers: parse(input: input))
        school.simulate(days: 256)
        return String(describing: school.count)
    }

    static let d6 = Day(p1, p2)
}

struct School {

    let cycle: Int
    let initialDelay: Int
    var store: [Int: Int]

    init(timers: [Int], cycle: Int = 6, initialDelay: Int = 2) {
        self.cycle = cycle
        self.initialDelay = initialDelay
        self.store = timers.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    }

    mutating func simulate(days: Int) {
        for _ in 1 ... days {
            var newStore: [Int: Int] = [:]
            for (timer, count) in store {
                var newTimer = timer - 1
                if newTimer < 0 {
                    newTimer = cycle
                    newStore[cycle + initialDelay, default: 0] += count
                }
                newStore[newTimer, default: 0] += count
            }
            store = newStore
        }
    }

    var count: Int {
        store.reduce(0) { $0 + $1.value }
    }
}
