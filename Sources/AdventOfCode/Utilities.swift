public extension Collection where Element == Int {
    func median() -> Double {
        let sortedArray = sorted()
        guard count.isMultiple(of: 2) else {
            let middle = count / 2
            return Double(sortedArray[middle] + sortedArray[middle - 1]) / 2.0
        }
        return Double(sortedArray[count / 2])
    }

    func mean() -> Double {
        Double(reduce(into: 0) { $0 += $1 }) / Double(count)
    }
}

public struct Point: Hashable {
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    public let x: Int
    public let y: Int
}

extension Point: CustomStringConvertible {
    public var description: String {
        "(\(x),\(y))"
    }
}

public struct Grid<A> {
    var store: Array<Array<A>>

    public init(store: Array<Array<A>>) {
        self.store = store
    }
}

public extension Grid {

    subscript(_ point: Point) -> A {
        get {
            store[point.y][point.x]
        }
        set {
            store[point.y][point.x] = newValue
        }
    }

    var width: Int { store[0].count }
    var height: Int { store.count }

    var points: [Point] {
        var result: [Point] = []
        for row in store.indices {
            for col in store[row].indices {
                result.append(.init(x: col, y: row))
            }
        }
        return result
    }

    func orthogonalNeighbors(of point: Point) -> Set<Point> {
        var result: Set<Point> = []
        if point.x > 0 {
            result.insert(.init(x: point.x - 1, y: point.y))
        }
        if point.x < width - 1 {
            result.insert(.init(x: point.x + 1, y: point.y))
        }
        if point.y > 0 {
            result.insert(.init(x: point.x, y: point.y - 1))
        }
        if point.y < height - 1 {
            result.insert(.init(x: point.x, y: point.y + 1))
        }
        return result
    }

    func diagonalNeighbors(of point: Point) -> Set<Point> {
        var result: Set<Point> = []
        if point.x > 0, point.y > 0 {
            result.insert(.init(x: point.x - 1, y: point.y - 1))
        }
        if point.x < width - 1, point.y > 0 {
            result.insert(.init(x: point.x + 1, y: point.y - 1))
        }
        if point.x > 0, point.y < height - 1 {
            result.insert(.init(x: point.x - 1, y: point.y + 1))
        }
        if point.x < width - 1, point.y < height - 1 {
            result.insert(.init(x: point.x + 1, y: point.y + 1))
        }
        return result
    }

    func neighbors(of point: Point) -> Set<Point> {
        orthogonalNeighbors(of: point).union(diagonalNeighbors(of: point))
    }
}

extension Grid: CustomStringConvertible where A == Int {
    public var description: String {
        var result: [String] = []
        for row in store {
            result.append(row.map(String.init).joined())
        }

        return result.joined(separator: "\n")
    }
}

public struct Line: Hashable {
    public let start: Point
    public let end: Point

    public init(start: Point, end: Point) {
        self.start = start
        self.end = end
    }
}
