import Foundation

public typealias Input = String
public typealias Output = String
public typealias Milliseconds = Double

public struct Day {
    public let p1: (Input) -> Output
    public let p2: (Input) -> Output

    public init(
        _ p1: @escaping (Input) -> Output,
        _ p2: @escaping (Input) -> Output
    ) {
        self.p1 = p1
        self.p2 = p2
    }

    func run(_ part: Int, input: Input) -> (Output, Double) {
        assert([1, 2].contains(part))
        let f: (Input) -> Output = part == 1 ? p1 : p2
        let start = DispatchTime.now()
        let result = f(input)
        let end = DispatchTime.now()
        return (result, Double(end.uptimeNanoseconds - start.uptimeNanoseconds) / 1_000_000)
    }
}

public struct Year {
    public var index: Int
    let load: (Int) -> String
    let days: [Int: Day]

    public init(_ index: Int, days: [Int: Day], load: @escaping (Int) -> String) {
        self.index = index
        self.days = days
        self.load = load
    }

    public func run(
        day: Int,
        part: Int,
        input: String? = nil
    ) -> (value: String, metric: Double) {
        days[day]!.run(part, input: input ?? load(day))
    }
}
