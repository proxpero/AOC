import AdventOfCode
import Parsing

extension Day {
    typealias Pattern = Set<Character>

    struct Interpreter {
        var patterns: [Pattern] = .init(repeating: Pattern(), count: 10)

        /*

           0:      1:      2:      3:      4:
          aaaa    ....    aaaa    aaaa    ....
         b    c  .    c  .    c  .    c  b    c
         b    c  .    c  .    c  .    c  b    c
          ....    ....    dddd    dddd    dddd
         e    f  .    f  e    .  .    f  .    f
         e    f  .    f  e    .  .    f  .    f
          gggg    ....    gggg    gggg    ....

           5:      6:      7:      8:      9:
          aaaa    aaaa    aaaa    aaaa    aaaa
         b    .  b    .  .    c  b    c  b    c
         b    .  b    .  .    c  b    c  b    c
          dddd    dddd    ....    dddd    dddd
         .    f  e    f  .    f  e    f  .    f
         .    f  e    f  .    f  e    f  .    f
          gggg    gggg    ....    gggg    gggg

         */

        // 0: 6 ABC EFG
        // 1: 2   C  F
        // 2: 5 A CDE G
        // 3: 5 A CD FG
        // 4: 4  BCD F
        // 5: 5 AB D FG
        // 6: 6 AB DEFG
        // 7: 3 A C  F
        // 8: 7 ABCDEFG
        // 9: 6 ABCD FG

        init(signalPatterns: Set<Pattern>) {
            patterns[1] = signalPatterns.first(where: { $0.count == 2 })!
            patterns[7] = signalPatterns.first(where: { $0.count == 3 })!
            patterns[4] = signalPatterns.first(where: { $0.count == 4 })!
            patterns[8] = signalPatterns.first(where: { $0.count == 7 })!

            // 5 segments and is superset of one == three
            patterns[3] = signalPatterns.first(where: { $0.count == 5 && $0.isSuperset(of: patterns[1]) })!

            // 6 segments and NOT a superset of seven == six
            patterns[6] = signalPatterns.first(where: { $0.count == 6 && !$0.isSuperset(of: patterns[7]) })!

            let C = patterns[8].subtracting(patterns[6]).first!

            // 5 segments and does not include C == five
            patterns[5] = signalPatterns.first(where: { $0.count == 5 && !$0.contains(C) })!

            let E = patterns[6].subtracting(patterns[5]).first!

            patterns[9] = patterns[8].subtracting([E])

            // 5 segments and is not three or five == two
            patterns[2] = signalPatterns.first(where: { $0.count == 5 && !$0.isSubset(of: patterns[3]) && !$0.isSubset(of: patterns[5]) }) ?? []

            // 6 segments and is not six or nine == zero
            patterns[0] = signalPatterns.first(where: { $0.count == 6 && !$0.isSubset(of: patterns[6]) && !$0.isSubset(of: patterns[9]) }) ?? []
        }

        
        func interpret(_ sample: Pattern) -> Int {
            patterns.indices.first(where: { patterns[$0] == sample })!
        }

        func interpret(output: [Pattern]) -> Int {
            zip(output.indices, [1000, 100, 10, 1]).reduce(into: 0) { $0 += interpret(output[$1.0]) * $1.1 }
        }
    }

    struct Entry {
        let signalPatterns: [Pattern]
        let output: [Pattern]

        init(
            signalPatterns: [Pattern],
            output: [Pattern]
        ) {
            self.signalPatterns = signalPatterns
            self.output = output
        }

        var unambiguousPatterns: [Pattern] {
            output.filter { [2, 3, 4, 7].contains($0.count) }
        }

        func interpret() -> Int {
            var patterns: [Pattern] = .init(repeating: Pattern(), count: 10)

            patterns[1] = signalPatterns.first(where: { $0.count == 2 })!
            patterns[7] = signalPatterns.first(where: { $0.count == 3 })!
            patterns[4] = signalPatterns.first(where: { $0.count == 4 })!
            patterns[8] = signalPatterns.first(where: { $0.count == 7 })!

            // 5 segments and is superset of one == three
            patterns[3] = signalPatterns.first(where: { $0.count == 5 && $0.isSuperset(of: patterns[1]) })!

            // 6 segments and NOT a superset of seven == six
            patterns[6] = signalPatterns.first(where: { $0.count == 6 && !$0.isSuperset(of: patterns[7]) })!

            let C = patterns[8].subtracting(patterns[6]).first!

            // 5 segments and does not include C == five
            patterns[5] = signalPatterns.first(where: { $0.count == 5 && !$0.contains(C) })!

            let E = patterns[6].subtracting(patterns[5]).first!

            patterns[9] = patterns[8].subtracting([E])

            // 5 segments and is not three or five == two
            patterns[2] = signalPatterns.first(where: { $0.count == 5 && !$0.isSubset(of: patterns[3]) && !$0.isSubset(of: patterns[5]) }) ?? []

            // 6 segments and is not six or nine == zero
            patterns[0] = signalPatterns.first(where: { $0.count == 6 && !$0.isSubset(of: patterns[6]) && !$0.isSubset(of: patterns[9]) }) ?? []

            func interpret(_ sample: Pattern) -> Int {
                for index in patterns.indices {
                    if sample == patterns[index] {
                        return index
                    }
                }
                return -1
            }

            return interpret(output[0]) * 1000 + interpret(output[1]) * 100 + interpret(output[2]) * 10 + interpret(output[3])
        }
    }

    private static func parse(input: String) -> [Entry] {
        let pattern = Prefix<Substring>(while: { $0.isLetter }).map(Pattern.init)
        let patterns = Many(pattern, atMost: 10, separator: " ")
        let entry = patterns
            .skip(" | ")
            .take(patterns)
            .map(Entry.init)
        let entries = Many(entry, separator: "\n")
        let result = entries.parse(input)!
        return result
    }

    private static func p1(input: String) -> String {
        let entries = parse(input: input)
        let result = entries.map(\.unambiguousPatterns.count).reduce(0, +)
        return String(describing: result)
    }

    private static func p2(input: String) -> String {
        let entries = parse(input: input)
        let result = entries.map { $0.interpret() }.reduce(0, +)
        return String(describing: result)
    }

    static let d8 = Day(p1, p2)
}
