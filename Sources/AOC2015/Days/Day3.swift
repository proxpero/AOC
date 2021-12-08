import AdventOfCode

extension Day {

    struct Position: Hashable {
        var x: Int
        var y: Int

        mutating func move(char: Character) {
            switch char {
            case "^": y += 1
            case ">": x += 1
            case "v": y -= 1
            case "<": x -= 1
            default: break
            }
        }
    }

    private static func p1(input: String) -> String {
        var current = Position(x: 0, y: 0)
        var positions: [Position: Int] = [
            current: 1
        ]
        for char in input {
            current.move(char: char)
            positions[current, default: 0] += 1
        }
        let result = positions.count
        return String(describing: result)
    }

    private static func p2(input: String) -> String {
        var santa = Position(x: 0, y: 0)
        var robo = santa
        var positions: [Position: Int] = [
            santa: 2
        ]
        var index = input.startIndex
        while index < input.index(before: input.endIndex) {
            santa.move(char: input[index])
            positions[santa, default: 0] += 1
            index = input.index(after: index)
            robo.move(char: input[index])
            positions[robo, default: 0] += 1
            index = input.index(after: index)
        }
        let result = positions.count
        return String(describing: result)
    }

    static let d3 = Day(p1, p2)
}
