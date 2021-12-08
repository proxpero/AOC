import AdventOfCode
import Parsing

extension Day {
    
    enum Direction { case forward, up, down }
    struct Command {
        let direction: Direction
        let value: Int
    }

    private static func parse(input: String) -> [Command] {
        var input = input[...]
        let command = OneOfMany(
            StartsWith<Substring>("forward").map { Direction.forward },
            StartsWith("up").map { Direction.up },
            StartsWith("down").map { Direction.down }
        )
        .skip(" ")
        .take(Int.parser())
        .map(Command.init)
        return Many(command, separator: "\n").parse(&input)!
    }

    private static func p1(input: String) -> String {
        let commands = parse(input: input)
        var hor = 0
        var dir = 0
        for command in commands {
            switch command.direction {
            case .forward:
                hor += command.value
            case .up:
                dir -= command.value
            case .down:
                dir += command.value
            }
        }
        return String(describing: hor * dir)
    }

    private static func p2(input: String) -> String {
        let commands = parse(input: input)
        var hor = 0
        var dir = 0
        var aim = 0
        for command in commands {
            switch command.direction {
            case .forward:
                hor += command.value
                dir += aim * command.value
            case .up:
                aim -= command.value
            case .down:
                aim += command.value
            }
        }
        return String(describing: hor * dir)
    }

    static let d2 = Day(p1, p2)
}
