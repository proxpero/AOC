import AdventOfCode

extension Day {

    private static func parse(input: String) -> Grid<Bool> {
        Grid(store: input
                .split(separator: "\n")
                .map { line in
                    line.map { $0 == "#" }
                }
        )
    }

    private static func trees(at slope: (right: Int, down: Int), in grid: Grid<Bool>) -> Int {
        var current = Point(x: 0, y: 0)
        var count = 0
        while current.y < grid.height {
            if grid[current] { count += 1 }
            current = Point(x: (current.x + slope.right) % grid.width, y: current.y + slope.down)
        }
        return count
    }

    private static func p1(input: String) -> String {
        let grid = parse(input: input)
        let count = trees(at: (3, 1), in: grid)
        return String(describing: count)
    }

    private static func p2(input: String) -> String {
        let grid = parse(input: input)
        let slopes: [(Int, Int)] = [
            (1, 1),
            (3, 1),
            (5, 1),
            (7, 1),
            (1, 2)
        ]
        let count = slopes.reduce(1) { $0 * trees(at: $1, in: grid) }
        return String(describing: count)
    }

    static let d3 = Day(p1, p2)
}
