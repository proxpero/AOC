import AdventOfCode
import Foundation

extension Year {
    static func load(day: Int) -> String {
        let url = Bundle.module.url(forResource: "2015.\(day)", withExtension: nil)
        return try! String(contentsOf: url!)
    }

    static let days: [Int: Day] = [
        1: .d1,
        2: .d2,
        3: .d3,
        4: .d4,
        5: .d5,
        6: .d6,
        7: .d7,
        8: .d8,
        9: .d9,
        10: .d10,
        11: .d11,
        12: .d12,
        13: .d13,
        14: .d14,
        15: .d15,
        16: .d16,
        17: .d17,
        18: .d18,
        19: .d19,
        20: .d20,
        21: .d21,
        22: .d22,
        23: .d23,
        24: .d24,
        25: .d25,
    ]

    public static let y2015 = Year(2015, days: days, load: load(day:))
}