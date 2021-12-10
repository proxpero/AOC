import AdventOfCode

extension Day {

    static func lookAndSay(input: String) -> String {
        var result = ""
        var index = input.startIndex
        while index != input.endIndex {
            let current = input[index]
            var count = 1
            var next = input.index(after: index)
            while next < input.endIndex, input[next] == current {
                count += 1
                next = input.index(after: next)
            }
            result += "\(count)\(current)"
            index = next
        }
        return result
    }

    static func lookAndSay(input: String, count: Int) -> String {
        (1 ... count).reduce(into: input) { result, _ in result = lookAndSay(input: result) }
    }

    private static func p1(input: String) -> String {
        let result = lookAndSay(input: input, count: 40).count
        return String(describing: result)
    }

    private static func p2(input: String) -> String {
        let result = lookAndSay(input: input, count: 50).count
        return String(describing: result)
    }

    static let d10 = Day(p1, p2)
}
