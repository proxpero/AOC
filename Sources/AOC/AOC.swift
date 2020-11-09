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

public struct Day {
    public init(
        name: Int,
        part1: @escaping (String) -> String,
        part2: @escaping (String) -> String
    ) {
        self.name = name
        self.part1 = part1
        self.part2 = part2
    }

    let name: Int
    let part1: (String) -> String
    let part2: (String) -> String

    public func run(part: Part, input: String) -> String {
        switch part {
        case .p1:
            return part1(input)
        case .p2:
            return part2(input)
        }
    }

    func run(_ part: Part, _ event: Event, bundle: Bundle) -> String {
        event.run(self, part, bundle: bundle)
    }
}

public struct Event {
    public init(name: Int) {
        self.name = name
    }

    let name: Int

    public var d1: Day!
    public var d2: Day!
    public var d3: Day!
    public var d4: Day!
    public var d5: Day!
    public var d6: Day!
    public var d7: Day!
    public var d8: Day!
    public var d9: Day!
    public var d10: Day!
    public var d11: Day!
    public var d12: Day!
    public var d13: Day!
    public var d14: Day!
    public var d15: Day!
    public var d16: Day!
    public var d17: Day!
    public var d18: Day!
    public var d19: Day!
    public var d20: Day!
    public var d21: Day!
    public var d22: Day!
    public var d23: Day!
    public var d24: Day!
    public var d25: Day!

    public func filename(day: Day) -> String {
        return "\(name).\(day.name)"
    }

    public func input(day: Day, in bundle: Bundle) -> String {
        bundle.text(filename: filename(day: day))
    }

    public func run(_ day: Day, _ part: Part, input: String) -> String {
        day.run(part: part, input: input)
    }

    public func run(_ day: Day, _ part: Part, bundle: Bundle) -> String {
        day.run(part: part, input: self.input(day: day, in: bundle))
    }
}
