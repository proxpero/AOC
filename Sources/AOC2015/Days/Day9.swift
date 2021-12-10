import AdventOfCode
import Algorithms
import Parsing

extension Day {

    private static func parse(input: String) -> [String: [String: Int]] {
        let item = PrefixUpTo(" ")
            .skip(" to ")
            .take(PrefixUpTo(" "))
            .skip(" = ")
            .take(Int.parser())
            .map { (String($0), String($1), $2) }
        let items = Many(item, separator: "\n")
        let result = items.parse(input)!.reduce(into: [String: [String: Int]]()) { acc, info in
            acc[info.0, default: [:]][info.1] = info.2
            acc[info.1, default: [:]][info.0] = info.2
        }
        return result
    }

    private static func p1(input: String) -> String {
        var result = Int.max
        let map = parse(input: input)
        let permutations = map.keys.permutations()
        for permutation in permutations {
            var candidate = 0
            for (origin, destination) in zip(permutation, permutation.dropFirst()) {
                candidate += map[origin]![destination]!
            }
            result = min(result, candidate)
        }
        return String(describing: result)
    }

    private static func p2(input: String) -> String {
        var result = Int.min
        let map = parse(input: input)
        let permutations = map.keys.permutations()
        for permutation in permutations {
            var candidate = 0
            for (origin, destination) in zip(permutation, permutation.dropFirst()) {
                candidate += map[origin]![destination]!
            }
            result = max(result, candidate)
        }
        return String(describing: result)
    }

    static let d9 = Day(p1, p2)
}
