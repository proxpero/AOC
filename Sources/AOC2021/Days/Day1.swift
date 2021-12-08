import AdventOfCode

extension Day {
    private static func parse(input: String) -> [Int] {
        return input
            .split(separator: "\n")
            .map(String.init)
            .compactMap(Int.init)
    }

    private static func p1(input: String) -> String {
        let values = parse(input: input)
        let count = zip(values, values.dropFirst()).filter { $0 < $1 }.count
        return String(describing: count)
    }

    private static func p2(input: String) -> String {
        let values = parse(input: input)
        let sums = zip(values, values.dropFirst(), values.dropFirst().dropFirst()).map { $0 + $1 + $2 }
        let count = zip(sums, sums.dropFirst()).filter { $0 < $1 }.count
        return String(describing: count)
    }

    static let d1 = Day(p1, p2)
}
