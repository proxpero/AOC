import AdventOfCode

struct BoardingPass {
    let row: Int
    let col: Int
    let id: Int
}

extension BoardingPass {
    init(code: Substring) {
        var rows = (0 ... 127)[...]
        for char in code.dropLast(3) {
            switch char {
            case "F": rows = rows.dropLast(rows.count / 2)
            case "B": rows = rows.dropFirst(rows.count / 2)
            default: break
            }
        }
        let row = rows.removeFirst()

        var cols = (0 ... 7)[...]
        for char in code.dropFirst(7) {
            switch char {
            case "R": cols = cols.dropFirst(cols.count / 2)
            case "L": cols = cols.dropLast(cols.count / 2)
            default: break
            }
        }
        let col = cols.removeFirst()
        self = BoardingPass(row: row, col: col, id: row * 8 + col)
    }
}

extension Day {

    private static func parse(input: String) -> [BoardingPass] {
        input.split(separator: "\n").map(BoardingPass.init)
    }

    private static func p1(input: String) -> String {
        let bps = parse(input: input)
        let max = bps.map(\.id).max()!
        return String(describing: max)
    }

    private static func p2(input: String) -> String {
        let ids = parse(input: input).map(\.id).sorted()
        var result = 0
        for (low, high) in zip(ids, ids.dropFirst().dropFirst()) {
            if low != high - 2 {
                result = low + 1
            }
        }
        return String(describing: result)
    }

    static let d5 = Day(p1, p2)
}
