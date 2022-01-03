import AdventOfCode

extension Day {
    private static func p1(input: String) -> String {
        let entries = input.components(separatedBy: "\n\n")
        let valid = entries.filter { entry in
            entry.contains("byr:") &&
                entry.contains("iyr:") &&
                entry.contains("eyr:") &&
                entry.contains("hgt:") &&
                entry.contains("hcl:") &&
                entry.contains("ecl:") &&
                entry.contains("pid:")
        }
        let count = valid.count
        return String(describing: count)
    }

    private static func isValid(_ entry: String) -> Bool {
        let items = entry.split(whereSeparator: { $0.isWhitespace || $0.isNewline })
        func hasValidInteger(for prefix: String, count: Int, radix: Int = 10, in range: ClosedRange<Int> = Int.min ... Int.max) -> Bool {
            func validInteger(in substring: Substring, digitCount: Int = 4, radix: Int = 10) -> Int? {
                guard substring.count == digitCount, let value = Int(String(substring), radix: radix) else { return nil }
                return value
            }

            guard let item = items.first(where: { $0.starts(with: prefix) }),
                  let value = validInteger(in: item.dropFirst(prefix.count), digitCount: count, radix: radix),
                  range.contains(value)
            else { return false }

            return true
        }

        guard hasValidInteger(for: "byr:", count: 4, in: 1920 ... 2002),
              hasValidInteger(for: "iyr:", count: 4, in: 2010 ... 2020),
              hasValidInteger(for: "eyr:", count: 4, in: 2020 ... 2030),
              hasValidInteger(for: "pid:", count: 9),
              hasValidInteger(for: "hcl:#", count: 6, radix: 16)
        else {
            return false
        }

        guard let hgt = items.first(where: { $0.starts(with: "hgt:") })?.dropFirst("hgt:".count) else { return false }
        if hgt.hasSuffix("cm") {
            guard let cm = Int(String(hgt.dropLast("cm".count))), (150 ... 193).contains(cm) else { return false }
        } else if hgt.hasSuffix("in") {
            guard let inches = Int(String(hgt.dropLast("in".count))), (59 ... 76).contains(inches) else { return false }
        } else {
            return false
        }

        guard let ecl = items.first(where: { $0.starts(with: "ecl:") })?.dropFirst("ecl:".count) else { return false }
        switch ecl {
        case "amb",
             "blu",
             "brn",
             "grn",
             "gry",
             "hzl",
             "oth":
            return true
        default:
            return false
        }
    }

    private static func p2(input: String) -> String {
        let entries = input.components(separatedBy: "\n\n")
        let count = entries.filter(isValid).count
        return String(describing: count)
    }

    static let d4 = Day(p1, p2)
}
