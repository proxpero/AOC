import AdventOfCode
@testable import AOC2021
import Parsing
import XCTest

final class Day8Tests: XCTestCase {
    func testEntryParser() {
        let sample = """
        acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf
        gabfed acbdfg cd gebcd gdfecb bgfdcae ecdf dcb gdbfe gaceb | dcb dgfceab cbfdeg edcf
        cdbeagf df bfcgd bfed cfd fgcbed gcedb cfeadg cegabd fbacg | acbfedg acbfg dfcaeg bfgca
        """

        struct Entry {
            let signalPatterns: [String]
            let output: [String]
        }

        let word = Prefix<Substring>(while: { $0.isLetter }).map(String.init)
        let words = Many(word, atMost: 10, separator: " ")
        let entry = words
            .skip(" | ")
            .take(words)
            .map(Entry.init)
        let entries = Many(entry, separator: "\n")
        _ = entries.parse(sample)!
    }

    func testInterpreter() {
        func parse(input: String) -> [Day.Entry] {
            let pattern = Prefix<Substring>(while: { $0.isLetter }).map(Day.Pattern.init)
            let patterns = Many(pattern, atMost: 10, separator: " ")
            let entry = patterns
                .skip(" | ")
                .take(patterns)
                .map(Day.Entry.init)
            let entries = Many(entry, separator: "\n")
            let result = entries.parse(input)!
            return result
        }

        let sample = """
        acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf
        """

        let entries = parse(input: sample)
        let interpreter = Day.Interpreter(signalPatterns: entries.reduce(into: Set<Day.Pattern>()) { $0.formUnion($1.signalPatterns) })

        /*
         cagedb: 0
         ab: 1
         gcdfa: 2
         fbcad: 3
         eafb: 4
         cdfbe: 5
         cdfgeb: 6
         dab: 7
         acedgfb: 8
         cefabd: 9
         */

        XCTAssertEqual(0, interpreter.interpret(Set<Character>("cagedb")))
        XCTAssertEqual(1, interpreter.interpret(Set<Character>("ab")))
        XCTAssertEqual(2, interpreter.interpret(Set<Character>("gcdfa")))
        XCTAssertEqual(3, interpreter.interpret(Set<Character>("fbcad")))
        XCTAssertEqual(4, interpreter.interpret(Set<Character>("eafb")))
        XCTAssertEqual(5, interpreter.interpret(Set<Character>("cdfbe")))
        XCTAssertEqual(6, interpreter.interpret(Set<Character>("cdfgeb")))
        XCTAssertEqual(7, interpreter.interpret(Set<Character>("dab")))
        XCTAssertEqual(8, interpreter.interpret(Set<Character>("acedgfb")))
        XCTAssertEqual(9, interpreter.interpret(Set<Character>("cefabd")))

        let output = interpreter.interpret(output: entries[0].output)
        XCTAssertEqual(output, 5353)
    }

    func testInterpretation() {
        let sample = """
        be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
        edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc
        fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg
        fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb
        aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea
        fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb
        dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe
        bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef
        egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb
        gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce
        """

        func parse(input: String) -> [Day.Entry] {
            let pattern = Prefix<Substring>(while: { $0.isLetter }).map(Day.Pattern.init)
            let patterns = Many(pattern, atMost: 10, separator: " ")
            let entry = patterns
                .skip(" | ")
                .take(patterns)
                .map(Day.Entry.init)
            let entries = Many(entry, separator: "\n")
            let result = entries.parse(input)!
            return result
        }

        let entries = parse(input: sample)
        let result = entries.map { $0.interpret() }.reduce(0, +)
        XCTAssertEqual(result, 61229)
    }
}
