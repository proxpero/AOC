import AdventOfCode
@testable import AOC2015
import XCTest

final class Day5Tests: XCTestCase {
    func testHasTwoNonOverlappingPairs() {
        XCTAssertTrue("xyxy".hasTwoNonOverlappingPairs)
        XCTAssertTrue("aabcdefgaa".hasTwoNonOverlappingPairs)
        XCTAssertFalse("aaa".hasTwoNonOverlappingPairs)
        XCTAssertTrue("aaaa".hasTwoNonOverlappingPairs)
        XCTAssertTrue("aaabaa".hasTwoNonOverlappingPairs)
        XCTAssertTrue("qjhvhtzxzqqjkmpb".hasTwoNonOverlappingPairs)
        XCTAssertTrue("xxyxx".hasTwoNonOverlappingPairs)
        XCTAssertFalse("ieodomkazucvgmuy".hasTwoNonOverlappingPairs)
    }

    func testHasRepeatingLetterWithOneLetterBetween() {
        XCTAssertTrue("xyx".hasRepeatingLetterWithOneLetterBetween)
        XCTAssertTrue("abcdefeghi".hasRepeatingLetterWithOneLetterBetween)
        XCTAssertTrue("aaa".hasRepeatingLetterWithOneLetterBetween)
        XCTAssertTrue("qjhvhtzxzqqjkmpb".hasRepeatingLetterWithOneLetterBetween)
        XCTAssertTrue("xxyxx".hasRepeatingLetterWithOneLetterBetween)
        XCTAssertTrue("ieodomkazucvgmuy".hasRepeatingLetterWithOneLetterBetween)
    }

    func testPart2() {
        XCTAssertEqual(Day.d5.p2("qjhvhtzxzqqjkmpb"), "1")
        XCTAssertEqual(Day.d5.p2("xxyxx"), "1")
        XCTAssertEqual(Day.d5.p2("uurcxstgmygtbstg"), "0")
        XCTAssertEqual(Day.d5.p2("ieodomkazucvgmuy"), "0")
    }
}

final class Day8Tests: XCTestCase {
    func testInMemoryParser1() {
        let sample = #"""
        ""
        """#
        let result = Day.inMemoryCharacterCount(sample.trimmingCharacters(in: .whitespacesAndNewlines)[...])
        XCTAssertEqual(result, 0)
    }

    func testInMemoryParser2() {
        let sample = #"""
        "abc"
        """#
        let result = Day.inMemoryCharacterCount(sample.trimmingCharacters(in: .whitespacesAndNewlines)[...])
        XCTAssertEqual(result, 3)
    }

    func testInMemoryParser3() {
        let sample = #"""
        "aaa\"aaa"
        """#
        let result = Day.inMemoryCharacterCount(sample.trimmingCharacters(in: .whitespacesAndNewlines)[...])
        XCTAssertEqual(result, 7)
    }

    func testInMemoryParser4() {
        let sample = #"""
        "\x27"
        """#
        let result = Day.inMemoryCharacterCount(sample.trimmingCharacters(in: .whitespacesAndNewlines)[...])
        XCTAssertEqual(result, 1)
    }
}
