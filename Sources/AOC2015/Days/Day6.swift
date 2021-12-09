import AdventOfCode
import Parsing

extension Day {

    struct Grid {
        var store: Array<Array<Int>>

        init(size: Int) {
            store = .init(repeating: Array<Int>(repeating: 0, count: size), count: size)
        }

        mutating func execute(_ instruction: Instruction, using configurator: @escaping (Command, Int) -> Int) {
            for row in (instruction.p1.y ... instruction.p2.y) {
                for col in instruction.p1.x ... instruction.p2.x {
                    store[row][col] = configurator(instruction.command, store[row][col])
                }
            }
        }

        var values: [Int] {
            var result: [Int] = []
            for row in store.indices {
                for col in store[row].indices {
                    result.append(store[row][col])
                }
            }
            return result
        }
    }

    enum Command {
        case turnOn
        case turnOff
        case toggle
    }

    struct Instruction {
        let command: Command
        let p1: Point
        let p2: Point
    }

    private static func parse(input: String) -> [Instruction] {
        let command = OneOfMany([
            StartsWith<Substring>("turn on").map { Command.turnOn },
            StartsWith("turn off").map { Command.turnOff },
            StartsWith("toggle").map { Command.toggle }
        ])
        let point = Int.parser()
            .skip(",")
            .take(Int.parser())
            .map(Point.init)
        let instruction = command
            .skip(" ")
            .take(point)
            .skip(" through ")
            .take(point)
            .map(Instruction.init)
        let instructions = Many(instruction, separator: "\n").parse(input)!
        return instructions
    }

    private static func p1(input: String) -> String {
        let instructions = parse(input: input)
        var grid: Grid = .init(size: 1000)
        func configurator(command: Command, value: Int) -> Int {
            switch command {
            case .turnOn:
                return 1
            case .turnOff:
                return 0
            case .toggle:
                return value == 1 ? 0 : 1
            }
        }
        instructions.forEach {
            grid.execute($0, using: configurator)
        }

        let result = grid.values.filter { $0 > 0 }.count
        return String(describing: result)
    }

    private static func p2(input: String) -> String {
        let instructions = parse(input: input)
        var grid: Grid = .init(size: 1000)
        func configurator(command: Command, value: Int) -> Int {
            switch command {
            case .turnOn:
                return value + 1
            case .turnOff:
                return max(0, value - 1)
            case .toggle:
                return value + 2
            }
        }
        instructions.forEach {
            grid.execute($0, using: configurator)
        }

        let result = grid.values.reduce(0, +)
        return String(describing: result)
    }

    static let d6 = Day(p1, p2)
}
