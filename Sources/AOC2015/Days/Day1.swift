import AdventOfCode

extension Day {
    private static func p1(input: String) -> String {
        var position = 0
        for char in input {
            switch char {
            case "(": position += 1
            case ")": position -= 1
            default: break
            }
        }
        return String(describing: position)
    }

    private static func p2(input: String) -> String {
        var position = 0
        for (index, char) in zip(1..., input) {
            switch char {
            case "(": position += 1
            case ")": position -= 1
            default: break
            }
            if position == -1 {
                return String(describing: index)
            }
        }
        fatalError()
    }

    static let d1 = Day(p1, p2)
}
