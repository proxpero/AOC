import AdventOfCode
import Parsing

extension Day {

    private static func p1(input: String) -> String {
        let values = input.asBinaryNumbers
        let length = input.lengthOfFirstElement

        var gamma = 0
        var epsilon = 0

        for shift in (0 ..< length).reversed() {
            var result = 0
            for value in values {
                let mask = 1 << shift
                let bit = value & mask
                result += bit == 0 ? -1 : 1
            }
            if result > 0 {
                gamma |= (1 << shift)
            } else {
                epsilon |= (1 << shift)
            }
        }
        return String(describing: gamma * epsilon)
    }

    private static func p2(input: String) -> String {
        let values = input.asBinaryNumbers
        let length = input.lengthOfFirstElement
        let indices: [Int] = values.indices.map({ $0 })

        let oxy = oxygenGeneratorRating(values: values, length: length, indices: indices)
        let co2 = carbonDioxideScrubberRating(values: values, length: length, indices: indices)

        return String(describing: oxy * co2)
    }

    static let d3 = Day(p1, p2)
}

private func oxygenGeneratorRating(values: [Int], length: Int, indices: [Int]) -> Int {
    var indices = indices
    for shift in (0 ..< length).reversed() {
        let result = values.mostCommonBit(at: shift, using: indices)
        switch result {
        case true?, .none:
            indices = values.indices(withValueSetAt: shift, validIndices: indices)
        case false?:
            indices = values.indices(withValueEmptyAt: shift, validIndices: indices)
        }
        if indices.count == 1 {
            break
        }
    }
    return values[indices[0]]
}

private func carbonDioxideScrubberRating(values: [Int], length: Int, indices: [Int]) -> Int {
    var indices = indices
    for shift in (0 ..< length).reversed() {
        let result = values.mostCommonBit(at: shift, using: indices)
        switch result {
        case false?:
            indices = values.indices(withValueSetAt: shift, validIndices: indices)
        case true?, .none:
            indices = values.indices(withValueEmptyAt: shift, validIndices: indices)
        }
        if indices.count == 1 {
            break
        }
    }
    return values[indices[0]]
}

private extension Collection where Element == Int, Index == Int {
    func mostCommonBit(at bitPosition: Int, using validIndices: [Int]) -> Bool? {
        let mask = 1 << bitPosition

        var result = 0
        for index in validIndices {
            let value = self[index] & mask
            result += value > 0 ? 1 : -1
        }

        if result > 0 {
            return true
        } else if result < 0 {
            return false
        } else {
            return nil
        }
    }

    func indices(satisfying: @escaping (Int, Int) -> Bool, at bitPosition: Int, using validIndices: [Int]) -> [Int] {
        validIndices.filter { satisfying(self[$0], bitPosition) }
    }

    func indices(withValueSetAt bitPosition: Int, validIndices: [Int]) -> [Int] {
        indices(satisfying: { value, bitPosition in
            value.isBitSet(at: bitPosition)
        }, at: bitPosition, using: validIndices)
    }

    func indices(withValueEmptyAt bitPosition: Int, validIndices: [Int]) -> [Int] {
        indices(satisfying: { value, bitPosition in
            !value.isBitSet(at: bitPosition)
        }, at: bitPosition, using: validIndices)
    }
}

private extension Int {
    func isBitSet(at bitPosition: Int) -> Bool {
        self & (1 << bitPosition) > 0
    }
}

private extension String {
    var lines: [String] {
        split(separator: "\n")
            .map(String.init)
    }

    var asBinaryNumbers: [Int] {
        split(separator: "\n")
            .map(String.init)
            .compactMap { Int($0, radix: 2) }
    }

    var lengthOfFirstElement: Int {
        PrefixUpTo("\n")
            .map { $0.count }
            .parse(self[...])
            .output!
    }
}
