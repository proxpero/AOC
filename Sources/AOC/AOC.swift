import Foundation
import Parser

extension Bundle {

    public func text(filename: String) -> String {
        let url = self.url(forResource: filename, withExtension: "txt")!
        let value = try! String(contentsOf: url)
        return value
    }
}

public enum Part {
    case p1
    case p2
}

struct Day {
    let name: Int
    var part1: (String) -> String
    var part2: (String) -> String

    func run(part: Part, input: String) -> String {
        switch part {
        case .p1:
            return part1(input)
        case .p2:
            return part2(input)
        }
    }
}

struct Year {

    let name: Int

    var d1: Day!
    var d2: Day!
    var d3: Day!
    var d4: Day!
    var d5: Day!
    var d6: Day!
    var d7: Day!
    var d8: Day!
    var d9: Day!
    var d10: Day!
    var d11: Day!
    var d12: Day!
    var d13: Day!
    var d14: Day!
    var d15: Day!
    var d16: Day!
    var d17: Day!
    var d18: Day!
    var d19: Day!
    var d20: Day!
    var d21: Day!
    var d22: Day!
    var d23: Day!
    var d24: Day!
    var d25: Day!

    func run(_ day: Day, _ part: Part, input: String) -> String {
        day.run(part: part, input: input)
    }
}
