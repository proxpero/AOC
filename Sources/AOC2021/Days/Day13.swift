import AdventOfCode
import Algorithms
import Parsing

extension Day {

    struct Fold {
        enum Axis { case x, y }
        let axis: Axis
        let value: Int

        func applies(to point: Point) -> Bool {
            switch axis {
            case .x:
                return point.x > value
            case .y:
                return point.y > value
            }
        }

        func transforming(_ point: Point) -> Point {
            switch axis {
            case .x:
                return Point(x: value - (point.x - value), y: point.y)
            case .y:
                return Point(x: point.x, y: value - (point.y - value))
            }
        }
    }

    private static func parse(input: String) -> (Set<Point>, [Fold]) {
        let axis = "x".map { Fold.Axis.x }.orElse("y".map { Fold.Axis.y })
        let fold = "fold along "
            .take(axis)
            .skip("=")
            .take(Int.parser())
            .map(Fold.init)
        let output = Many(Point.parser, separator: "\n").map(Set.init)
            .skip("\n\n")
            .take(Many(fold, separator: "\n"))
        return output.parse(input)!
    }

    private static func p1(input: String) -> String {
        var (points, folds) = parse(input: input)
        for fold in folds[0 ..< 1] {
            for point in points.filter({ fold.applies(to: $0) }) {
                points.remove(point)
                points.insert(fold.transforming(point))
            }
        }

        return String(describing: points.count)
    }

    private static func p2(input: String) -> String {
        var (points, folds) = parse(input: input)
        for fold in folds {
            for point in points.filter({ fold.applies(to: $0) }) {
                points.remove(point)
                points.insert(fold.transforming(point))
            }
        }
        let colCount = folds
            .filter { $0.axis == .x }
            .map { $0.value }
            .min()
        let rowCount = folds
            .filter { $0.axis == .y }
            .map { $0.value }
            .min()

        var grid = Grid<Character>.init(store: .init(repeating: .init(repeating: " ", count: colCount!), count: rowCount!))
        for point in points {
            grid[point] = "#"
        }
        return String(describing: grid)

    }

    static let d13 = Day(p1, p2)
}
