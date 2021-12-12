import AdventOfCode

extension Day {

    private static func parse(input: String) -> Grid<Int> {
        var result: [[Int]] = []
        for line in input.split(separator: "\n") {
            var row: [Int] = []
            for char in line {
                row.append(Int(String(char))!)
            }
            result.append(row)
        }
        return Grid(store: result)
    }

    static func lowPoints(in grid: Grid<Int>) -> [Point] {
        var lowPoints: [Point] = []
        nextPoint: for point in grid.points {
            let value = grid[point]
            for neighbor in grid.orthogonalNeighbors(of: point) {
                if grid[neighbor] <= value {
                    continue nextPoint
                }
            }
            lowPoints.append(point)
        }
        return lowPoints
    }

    static func basins(in grid: Grid<Int>) -> [Point : Set<Point>] {
        var visited: Set<Point> = []
        var basins = lowPoints(in: grid).reduce(into: [Point: Set<Point>]()) { $0[$1] = [$1] }

        func visit(_ point: Point, for lowPoint: Point) {
            visited.insert(point)
            for neighbor in grid.orthogonalNeighbors(of: point) where !visited.contains(neighbor) {
                visited.insert(neighbor)
                guard grid[neighbor] != 9 else { continue }
                basins[lowPoint]?.insert(neighbor)
                visit(neighbor, for: lowPoint)
            }
        }

        for lowPoint in basins.keys {
            visit(lowPoint, for: lowPoint)
        }

        return basins
    }

    private static func p1(input: String) -> String {
        let grid = parse(input: input)
        let lowPoints = lowPoints(in: grid)
        let result = lowPoints.reduce(into: 0) { $0 += grid[$1] + 1 }
        return String(describing: result)
    }

    private static func p2(input: String) -> String {
        let grid = parse(input: input)
        let basins = basins(in: grid)
        let result = basins.map { $0.value.count }.sorted(by: >).prefix(3).reduce(1, *)
        return String(describing: result)
    }

    static let d9 = Day(p1, p2)
}
