import AdventOfCode

extension Day {
    enum Result {
        case valid
        case incomplete([Character])
        case unexpectedCharacter(Character)

        var unexpectedCharacter: Character? {
            switch self {
            case .unexpectedCharacter(let char):
                return char
            default:
                return nil
            }
        }

        var incompleteCharacters: [Character]? {
            switch self {
            case .incomplete(let chars):
                return chars
            default:
                return nil
            }
        }
    }

    static func validate(line: Substring) -> Result {
        var expectedClosers: [Character] = []
        for char in line {
            switch char {
            case "(":
                expectedClosers.append(")")
            case "[":
                expectedClosers.append("]")
            case "{":
                expectedClosers.append("}")
            case "<":
                expectedClosers.append(">")
            case ")",
                 "]",
                 "}",
                 ">":
                let expected = expectedClosers.removeLast()
                if expected != char {
                    return .unexpectedCharacter(char)
                }
            default:
                fatalError()
            }
        }
        return expectedClosers.isEmpty ? .valid : .incomplete(expectedClosers.reversed())
    }

    private static func p1(input: String) -> String {
        let scoreTable: [Character: Int] = [
            ")": 3,
            "]": 57,
            "}": 1197,
            ">": 25137,
        ]
        let result = input
            .split(separator: "\n")
            .compactMap { validate(line: $0).unexpectedCharacter }
            .map {
                scoreTable[$0]!
            }
            .reduce(0, +)
        return String(describing: result)
    }

    private static func p2(input: String) -> String {

        let scoreTable: [Character: Int] = [
            ")": 1,
            "]": 2,
            "}": 3,
            ">": 4,
        ]
        func score(for chars: [Character]) -> Int {
            var total = 0
            for char in chars {
                total = 5 * total + scoreTable[char]!
            }
            return total
        }
        let scores = input
            .split(separator: "\n")
            .compactMap { validate(line: $0).incompleteCharacters }
            .map(score)
            .sorted()
        let result = scores[scores.count / 2]
        return String(describing: result)
    }

    static let d10 = Day(p1, p2)
}
