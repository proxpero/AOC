import AdventOfCode

extension Day {

    private static func parse(input: String) -> [Int] {
        return input.split(separator: "\n").map { Int($0)! }
    }

    private static func twoSum(_ values: [Int], target: Int) -> (Int, Int)? {
        var seen: Set<Int> = []
        for value in values {
            if seen.contains(target - value) {
                return (target - value, value)
            }
            seen.insert(value)
        }
        return nil
    }

    private static func threeSum(_ values: [Int], target: Int) -> (Int, Int, Int)? {
        var partialSum: [Int: (Int, Int)] = [:]
        for i in values.indices.dropLast() {
            for j in values.indices.dropFirst() {
                partialSum[values[i] + values[j]] = (i, j)
            }
        }
        for k in values.indices {
            if let pair = partialSum[target - values[k]], k != pair.0, k != pair.1 {
                return (values[pair.0], values[pair.1], values[k])
            }
        }
        return nil
    }

    private static func p1(input: String) -> String {
        let values = twoSum(parse(input: input), target: 2020)!
        return String(describing: values.0 * values.1)
    }

    private static func p2(input: String) -> String {
        let values = threeSum(parse(input: input), target: 2020)!
        return String(describing: values.0 * values.1 * values.2)
    }

    static let d1 = Day(p1, p2)
}
