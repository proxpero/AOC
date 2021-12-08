import AdventOfCode
import Foundation
import Parsing

extension Day {

    private static func parse(input: String) -> ([Int], [BingoCard]) {
        let numbers = Many(Int.parser(), separator: ",")
        let zeroOrMoreSpaces = Prefix<Substring> { $0 == " " }
        let row = Many(Skip(zeroOrMoreSpaces).take(Int.parser()))
        let card = row
            .skip("\n")
            .take(row)
            .skip("\n")
            .take(row)
            .skip("\n")
            .take(row)
            .skip("\n")
            .take(row)
            .map { r1, r2, r3, r4, r5 in
                BingoCard(values: [r1, r2, r3, r4, r5])
            }
        let cards = Many(card, separator: "\n\n")
        let parser = numbers
            .skip("\n\n")
            .take(cards)
            .map { numbers, cards in
                (numbers, cards)
            }
        return parser.parse(input)!
    }

    private static func p1(input: String) -> String {
        var (numbers, cards) = parse(input: input)
        for number in numbers {
            for cardIndex in cards.indices {
                if let score = cards[cardIndex].mark(number) {
                    return String(describing: score)
                }
            }
        }
        fatalError()
    }

    private static func p2(input: String) -> String {
        var (numbers, cards) = parse(input: input)
        var winningCardIndices: Set<Int> = []
        for number in numbers {
            for cardIndex in cards.indices where !winningCardIndices.contains(cardIndex) {
                if let score = cards[cardIndex].mark(number) {
                    winningCardIndices.insert(cardIndex)
                    if winningCardIndices.count == cards.count {
                        return String(describing: score)
                    }
                }
            }
        }
        fatalError()
    }

    static let d4 = Day(p1, p2)
}

struct BingoCard: Equatable {

    struct Location: Equatable {
        let row: Int
        let col: Int
    }

    var values: [[Int]]

    func isWinningAtRow(_ row: Int) -> Bool {
        values[row].allSatisfy { $0 == -1 }
    }

    func isWinningAtColumn(_ col: Int) -> Bool {
        values.indices.allSatisfy { values[$0][col] == -1 }
    }

    func sum() -> Int {
        var result = 0
        for row in values.indices {
            for col in values[row].indices {
                let value = values[row][col]
                if value == -1 { continue }
                result += values[row][col]
            }
        }
        return result
    }

    mutating func mark(_ number: Int) -> Int? {
        for row in values.indices {
            for col in values[row].indices {
                if values[row][col] == number {
                    values[row][col] = -1
                    if isWinningAtRow(row) || isWinningAtColumn(col) {
                        return sum() * number
                    }
                }
            }
        }
        return nil
    }
}
