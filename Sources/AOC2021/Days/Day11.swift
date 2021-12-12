import AdventOfCode

private extension Grid where A == Int {
    mutating func increment() -> Int {
        var flashers: Set<Point> = []
        for point in points {
            self[point] += 1
            if self[point] > 9 {
                flashers.insert(point)
            }
        }

        var didFlash: Set<Point> = []

        func flash(_ point: Point) {
            guard !didFlash.contains(point) else { return }
            didFlash.insert(point)
            for neighbor in neighbors(of: point) where !didFlash.contains(neighbor) {
                self[neighbor] += 1
                if self[neighbor] > 9 {
                    flash(neighbor)
                }
            }
        }

        for point in flashers {
            flash(point)
        }

        defer {
            for point in didFlash {
                self[point] = 0
            }
        }

        return didFlash.count
    }

    mutating func increment(count: Int) -> Int {
        guard count > 0 else { return 0 }
        var total = 0
        for _ in 1 ... count {
            total += increment()
        }
        return total
    }
}

extension Day {

    private static func parse(input: String) -> [[Int]] {
        var result: [[Int]] = []
        let rows = input.split(separator: "\n")
        for row in rows {
            var ints: [Int] = []
            for char in row {
                ints.append(Int(String(char))!)
            }
            result.append(ints)
        }
        return result
    }

    private static func p1(input: String) -> String {
        var grid = Grid(store: parse(input: input))
        let result = grid.increment(count: 100)
        return String(describing: result)
    }

    private static func p2(input: String) -> String {
        var grid = Grid(store: parse(input: input))
        var result = 0
        var total = 0
        while total < 100 {
            total = grid.increment()
            result += 1
        }
        return String(describing: result)
    }

    static let d11 = Day(p1, p2)
}
