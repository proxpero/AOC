import AdventOfCode
import Foundation
import Parsing

extension Day {

    private static func parse(input: String) -> [Line] {
        let point = Int.parser()
            .skip(",")
            .take(Int.parser())
            .map(Point.init)
        let vent = point
            .skip(" -> ")
            .take(point)
            .map(Line.init)
        let vents = Many(vent, separator: "\n")
        return vents.parse(input)!
    }

    private static func pointCounts(vents: [Line], members: KeyPath<Line, Set<Point>>) -> [Point: Int] {
        var points: [Point: Int] = [:]
        for vent in vents {
            for point in vent[keyPath: members] {
                points[point, default: 0] += 1
            }
        }
        return points
    }

    private static func p1(input: String) -> String {
        let result = pointCounts(
            vents: parse(input: input),
            members: \Line.orthogonalMembers
        ).values.filter { $0 > 1 }.count
        return String(describing:result)
    }

    private static func p2(input: String) -> String {
        let result = pointCounts(
            vents: parse(input: input),
            members: \Line.allMembers
        ).values.filter { $0 > 1 }.count
        return String(describing: result)
    }

    static let d5 = Day(p1, p2)
}

extension Line {
    
    var isVertical: Bool {
        start.x == end.x
    }

    var isHorizontal: Bool {
        start.y == end.y
    }

    var isDiagonal: Bool {
        abs(start.y - end.y) == abs(start.x - end.x)
    }

    var horizontalMembers: Set<Point> {
        var result: Set<Point> = []
        guard isHorizontal else {
            return result
        }
        let minX = min(start.x, end.x)
        let maxX = max(start.x, end.x)
        for x in minX ... maxX {
            result.insert(.init(x: x, y: start.y))
        }
        return result
    }

    var verticalMembers: Set<Point> {
        var result: Set<Point> = []
        guard isVertical else {
            return result
        }
        let minY = min(start.y, end.y)
        let maxY = max(start.y, end.y)
        for y in minY ... maxY {
            result.insert(.init(x: start.x, y: y))
        }
        return result
    }

    var diagonalMembers: Set<Point> {
        var result: Set<Point> = []
        guard isDiagonal else {
            return result
        }
        let xs = stride(from: start.x, through: end.x, by: start.x < end.x ? 1 : -1)
        let ys = stride(from: start.y, through: end.y, by: start.y < end.y ? 1 : -1)
        for (x, y) in zip(xs, ys) {
            result.insert(.init(x: x, y: y))
        }
        return result
    }

    var orthogonalMembers: Set<Point> {
        horizontalMembers.union(verticalMembers)
    }

    var allMembers: Set<Point> {
        horizontalMembers
            .union(verticalMembers)
            .union(diagonalMembers)
    }
}
