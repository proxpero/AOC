import AdventOfCode
import Parsing

extension Day {

    struct Prism {

        let length: Int
        let width: Int
        let height: Int

        init(
            length: Int,
            width: Int,
            height: Int
        ) {
            self.length = length
            self.width = width
            self.height = height
        }

        var surfaceArea: Int {
            2 * length * width + 2 * width * height + 2 * height * length
        }

        var areaOfSmallestSide: Int {
            min(length * width, width * height, height * length)
        }

        var surfaceAreaAndSmallestSide: Int {
            surfaceArea + areaOfSmallestSide
        }

        var perimeterOfSmallestFace: Int {
            min(length + width, width + height, height + length) * 2
        }

        var volume: Int {
            length * width * height
        }
    }

    private static func parse(input: String) -> [Prism] {
        let prism = Int.parser()
            .skip("x")
            .take(Int.parser())
            .skip("x")
            .take(Int.parser())
            .map(Prism.init)
        let metrics = Many(prism, separator: "\n")
        return metrics.parse(input)!
    }

    private static func p1(input: String) -> String {
        let prisms = parse(input: input)
        let result = prisms.reduce(into: 0) { $0 += $1.surfaceAreaAndSmallestSide }
        return String(describing: result)
    }

    private static func p2(input: String) -> String {
        let prisms = parse(input: input)
        let result = prisms.reduce(into: 0) { $0 += $1.perimeterOfSmallestFace + $1.volume }
        return String(describing: result)
    }

    static let d2 = Day(p1, p2)
}
