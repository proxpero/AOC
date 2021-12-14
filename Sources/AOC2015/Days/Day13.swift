import AdventOfCode
import Parsing

extension Day {

    private static func parse(input: String) -> [(String, Int, String)] {
        let value = "gain ".map { 1 }
            .orElse("lose ".map { -1 })
            .take(Int.parser())
            .map { $0.0 * $0.1 }
        let item = PrefixUpTo(" ").map(String.init)
            .skip(" would ")
            .take(value)
            .skip(" happiness units by sitting next to ")
            .take(PrefixUpTo(".").map(String.init))
            .skip(".")
        let items = Many(item, separator: "\n").parse(input)!
        return items
    }

    static func change(people: Set<String>, values: [Set<String> : Int]) -> Int {
        let permutations = people
            .permutations()
            .map({ $0 + [$0[0]] })
        var maxChange = Int.min
        for permutation in permutations {
            let change = permutation
                .adjacentPairs()
                .map({ Set([$0.0, $0.1]) })
                .reduce(into: 0) { $0 += values[$1] ?? 0 }
            maxChange = max(maxChange, change)
        }
        return maxChange
    }

    private static func p1(input: String) -> String {
        let items = parse(input: input)
        let people = Set(items.map { $0.0 })
        let values: [Set<String>: Int] = items.reduce(into: [:]) { $0[[$1.0, $1.2], default: 0] += $1.1 }
        let change = change(people: people, values: values)
        return String(describing: change)
    }

    private static func p2(input: String) -> String {
        let items = parse(input: input)
        var people = Set(items.map { $0.0 })
        people.insert("Me")
        let values: [Set<String>: Int] = items.reduce(into: [:]) { $0[[$1.0, $1.2], default: 0] += $1.1 }
        let change = change(people: people, values: values)
        return String(describing: change)
    }

    static let d13 = Day(p1, p2)
}
