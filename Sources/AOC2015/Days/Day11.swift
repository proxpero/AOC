import AdventOfCode

extension String {

    func contains(characters: Set<Character>) -> Bool {
        self.contains(where: { characters.contains($0) })
    }

    var hasIncreasingStraightOfThree: Bool {
        let ascii = self.compactMap(\.asciiValue)
        for (a, b, c) in zip(ascii, ascii.dropFirst(), ascii.dropFirst().dropFirst()) {
            if a == b - 1, b == c - 1 {
                return true
            }
        }
        return false
    }

    var containsAtLeastTwoDifferentNonOverlappingPairs: Bool {
        var count = 0
        for (index, a, b) in zip(self.indices, self, self.dropFirst()) {
            if a == b, self[self.index(before: index)] != a {
                count += 1
                if count == 2 { return true }
            }
        }
        return false
    }

    func increment() -> String {
        var chars = self.map { $0 }

        func incrementForbiddenCharacter(char: Character, replacement: Character) {
            if let index = chars.firstIndex(of: char) {
                chars[index] = replacement
                for i in (index + 1) ..< chars.endIndex {
                    chars[i] = "a"
                }
            }
        }

        incrementForbiddenCharacter(char: "i", replacement: "j")
        incrementForbiddenCharacter(char: "l", replacement: "m")
        incrementForbiddenCharacter(char: "o", replacement: "p")

        for index in (0 ..< chars.count).reversed() {
            let (char, carry) = String.increment(char: chars[index])
            chars[index] = char
            if !carry { break }
        }
        return String(chars)
    }

    static let alphabet = "abcdefghjkmnpqrstuvwxyz"

    static func increment(char: Character) -> (Character, Bool) {
        var carry = false
        let index = alphabet.firstIndex(of: char)!
        var next = alphabet.index(after: index)
        if next == alphabet.endIndex {
            next = alphabet.startIndex
            carry = true
        }
        return (alphabet[next], carry)
    }

    var isValidPassword: Bool {
        self.hasIncreasingStraightOfThree && self.containsAtLeastTwoDifferentNonOverlappingPairs
    }
}

extension Day {

    private static func increment(input: String, count: Int) -> String {
        var result = input
        for _ in 1 ... count {
            result = result.increment()
            while !result.isValidPassword {
                result = result.increment()
            }
        }
        return result
    }

    private static func p1(input: String) -> String {
        return increment(input: input, count: 1)
    }

    private static func p2(input: String) -> String {
        return increment(input: input, count: 2)
    }

    static let d11 = Day(p1, p2)
}
