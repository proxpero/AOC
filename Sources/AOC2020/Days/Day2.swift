import AdventOfCode
import Parsing

extension String {
    func charCounts() -> [Character: Int] {
        self.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    }
}

struct Rule {
    let range: ClosedRange<Int>
    let char: Character
    let sample: [Character]
}

extension Rule {
    var isValidInRange: Bool {
        let counts = sample.reduce(into: [:]) { $0[$1, default: 0] += 1 }
        guard let count = counts[char] else { return false }
        return range.contains(count)
    }

    var isValidAtBounds: Bool {
        func charExists(at index: Int) -> Bool {
            sample.indices.contains(index) && sample[index] == char
        }
        let lower = charExists(at: range.lowerBound - 1)
        let upper = charExists(at: range.upperBound - 1)
        return (lower && !upper) || (!lower && upper)
    }
}

extension Day {

    private static func parse(input: String) -> [Rule] {
        let range = Int.parser().skip("-").take(Int.parser()).map { $0.0 ... $0.1 }
        let char = Prefix<Substring>(1).map({ Character(String($0)) })
        let sample = PrefixUpTo("\n").map(Array<Character>.init)
        let rule = range.skip(" ").take(char).skip(": ").take(sample).map(Rule.init)
        let rules = Many(rule, separator: "\n").parse(input)!
        return rules
    }

    private static func p1(input: String) -> String {
        let rules = parse(input: input)
        let filtered = rules.filter(\.isValidInRange)
        return String(describing: filtered.count)
    }

    private static func p2(input: String) -> String {
        let rules = parse(input: input)
        let filtered = rules.filter(\.isValidAtBounds)
        return String(describing: filtered.count)
    }

    static let d2 = Day(p1, p2)
}
