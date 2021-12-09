import AdventOfCode

extension String {
    var hasThreeVowels: Bool {
        var count = 0
        let vowels = "aeiou"
        for char in self where vowels.contains(char) {
            count += 1
            if count == 3 { return true }
        }
        return false
    }

    var hasConsecutiveDoubleLetter: Bool {
        for (a, b) in zip(self, self.dropFirst()) {
            if a == b { return true }
        }
        return false
    }

    var hasNoForbiddenStrings: Bool {
        let forbiddens: Set<String> = ["ab", "cd", "pq", "xy"]
        for (a, b) in zip(self, self.dropFirst()) {
            if forbiddens.contains(.init([a, b])) {
                return false
            }
        }
        return true
    }

    var hasTwoNonOverlappingPairs: Bool {
        var pairs: [String: String.Index] = [:]
        for (index, a, b) in zip(self.indices, self, self.dropFirst()) {
            let candidate = String([a, b])
            if let previousIndex = pairs[candidate], previousIndex != self.index(before: index) {
                return true
            }
            if pairs[candidate] == nil {
                pairs[candidate] = index
            }
        }
        return false
    }

    var hasRepeatingLetterWithOneLetterBetween: Bool {
        for (a, b) in zip(self, self.dropFirst().dropFirst()) {
            if a == b {
                return true
            }
        }
        return false
    }
}


extension Day {

    private static func parse(input: String) -> [String] {
        input.split(separator: "\n").map(String.init)
    }

    private static func p1(input: String) -> String {
        let nice = parse(input: input).filter {
            $0.hasThreeVowels &&
            $0.hasConsecutiveDoubleLetter &&
            $0.hasNoForbiddenStrings
        }.count
        return String(describing: nice)
    }

    private static func p2(input: String) -> String {
        let nice = parse(input: input).filter {
            $0.hasTwoNonOverlappingPairs &&
            $0.hasRepeatingLetterWithOneLetterBetween
        }.count
        return String(describing: nice)

    }

    static let d5 = Day(p1, p2)
}
