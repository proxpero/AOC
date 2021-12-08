import AdventOfCode
import Foundation
import Parsing

extension Day {

    private static func parse(input: String) -> [Int] {
        input
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .split(separator: ",")
            .map { Int(String($0))! }
    }

    private static func p1(input: String) -> String {
        let positions = parse(input: input)
        let target = positions.sorted()[positions.count / 2]
        let fuel = positions.reduce(0) { $0 + abs($1 - target) }
        return String(describing: fuel)
    }

    private static func p2(input: String) -> String {
        let positions = parse(input: input)
        let mean = positions.mean()
        let fuel = [mean.rounded(.down), mean.rounded(.up)]
            .map { target in
                positions.reduce(into: 0) { acc, position in
                    let distance = abs(position - Int(target))
                    let cost = distance * (distance + 1) / 2
                    return acc += cost
                }
            }
            .min()!
        return String(describing: fuel)
    }

    static let d7 = Day(p1, p2)
}
