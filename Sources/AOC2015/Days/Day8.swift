import AdventOfCode

extension Day {

    static func literalCharacterCount(_ line: Substring) -> Int {
        line.count
    }

    static func inMemoryCharacterCount(_ line: Substring) -> Int {
        let line = line.dropFirst().dropLast()
        var result = 0
        var index = line.startIndex
        while index < line.endIndex {
            var offset = 1
            if line[index] == "\\" {
                offset = 2
                let next = line.index(after: index)
                if line[next] == "x" {
                    offset = 4
                }
            }
            index = line.index(index, offsetBy: offset)
            result += 1
        }
        return result
    }

    static func encodedCharacterCount(_ line: Substring) -> Int {
        var result = 2
        for char in line {
            result += 1
            if char == "\"" || char == "\\" {
                result += 1
            }
        }
        return result
    }

    private static func p1(input: String) -> String {
        let lines = input.split(separator: "\n")
        var literal = 0
        var inMemory = 0
        for line in lines {
            literal += literalCharacterCount(line)
            inMemory += inMemoryCharacterCount(line)
        }
        let result = literal - inMemory
        return String(describing: result)
    }

    private static func p2(input: String) -> String {
        let lines = input.split(separator: "\n")
        var literal = 0
        var encoded = 0
        for line in lines {
            literal += literalCharacterCount(line)
            encoded += encodedCharacterCount(line)
        }
        let result = encoded - literal
        return String(describing: result)
    }

    static let d8 = Day(p1, p2)
}
