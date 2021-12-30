import AdventOfCode
import Parsing

extension Day {
    private static func p1(input: String) -> String {
        func parse(input: String) -> Int {
            var sum = 0
            var index = input.startIndex
            var sign = 1
            var chars: [Character] = []
            while index < input.endIndex {
                let char = input[index]
                if char == "-" {
                    sign = -1
                } else if char.isNumber {
                    chars.append(char)
                } else if !chars.isEmpty {
                    let value = Int(String(chars))! * sign
                    sum += value
                    chars = []
                    sign = 1
                }
                index = input.index(after: index)
            }
            return sum
        }
        let value = parse(input: input)
        return String(describing: value)
    }

    private static func p2(input: String) -> String {
        let j = json.parse(input)!
        let result = j.numberValueExceptInRed()
        return String(describing: Int(result))
    }

    static let d12 = Day(p1, p2)
}

private enum JSON: Equatable {
    indirect case array([JSON])
    case boolean(Bool)
    case null
    case number(Double)
    indirect case object([String: JSON])
    case string(String)
}

extension JSON {
    func numberValueExceptInRed() -> Double {
        var result = 0.0
        switch self {
        case .boolean,
             .null,
             .string:
            break
        case .number(let value):
            result += value
        case .array(let elements):
            let sum = elements.reduce(0) { $0 + $1.numberValueExceptInRed() }
            result += sum
        case .object(let entries):
            if entries.values.contains(where: { json in
                switch json {
                case .string(let property):
                    return property == "red"
                default:
                    return false
                }
            }) {
                break
            }
            let sum = entries.reduce(0) { $0 + $1.value.numberValueExceptInRed() }
            result += sum
        }
        return result
    }
}

// From the swift-parsing library (Sources/swift-parsing-benchmark/JSON.swift)

private var json: AnyParser<Substring.UTF8View, JSON> {
    Skip(Whitespace())
        .take(
            object
                .orElse(array)
                .orElse(string)
                .orElse(number)
                .orElse(boolean)
                .orElse(null)
        )
        .skip(Whitespace())
        .eraseToAnyParser()
}

// MARK: Object

private let object = "{".utf8
    .take(
        Many(
            Skip(Whitespace())
                .take(stringLiteral)
                .skip(Whitespace())
                .skip(":".utf8)
                .take(Lazy { json }),
            into: [:],
            separator: ",".utf8.skip(Whitespace())
        ) { object, pair in
            let (name, value) = pair
            object[name] = value
        }
    )
    .skip("}".utf8)
    .map(JSON.object)

// MARK: Array

private let array = "[".utf8
    .take(
        Many(
            Lazy { json },
            separator: ",".utf8
        )
    )
    .skip("]".utf8)
    .map(JSON.array)

// MARK: String

private let unicode = Prefix(4) {
    (.init(ascii: "0") ... .init(ascii: "9")).contains($0)
        || (.init(ascii: "A") ... .init(ascii: "F")).contains($0)
        || (.init(ascii: "a") ... .init(ascii: "f")).contains($0)
}
.compactMap {
    UInt32(Substring($0), radix: 16)
        .flatMap(UnicodeScalar.init)
        .map(Character.init)
}

private let escape = "\\".utf8
    .take(
        "\"".utf8.map { "\"" }
            .orElse("\\".utf8.map { "\\" })
            .orElse("/".utf8.map { "/" })
            .orElse("b".utf8.map { "\u{8}" })
            .orElse("f".utf8.map { "\u{c}" })
            .orElse("n".utf8.map { "\n" })
            .orElse("r".utf8.map { "\r" })
            .orElse("t".utf8.map { "\t" })
            .orElse(unicode)
    )

private let literal = Prefix(1...) {
    $0 != .init(ascii: "\"") && $0 != .init(ascii: "\\")
}
.map { String(Substring($0)) }

private enum StringFragment {
    case escape(Character)
    case literal(String)
}

private let fragment = literal.map(StringFragment.literal)
    .orElse(escape.map(StringFragment.escape))

private let stringLiteral = "\"".utf8
    .take(
        Many(fragment, into: "") {
            switch $1 {
            case .escape(let character):
                $0.append(character)
            case .literal(let string):
                $0.append(contentsOf: string)
            }
        }
    )
    .skip("\"".utf8)

private let string =
    stringLiteral
        .map(JSON.string)

// MARK: Number

private let number = Double.parser(of: Substring.UTF8View.self)
    .map(JSON.number)

// MARK: Boolean

private let boolean = Bool.parser(of: Substring.UTF8View.self)
    .map(JSON.boolean)

// MARK: Null

private let null = "null".utf8
    .map { JSON.null }
