import AdventOfCode
@testable import AOC2016
import XCTest

final class AOC2016Tests: XCTestCase {
    func testDay1() {
        let day = Year.days[1]!
        let input = Year.load(day: 1)
        XCTAssertEqual(day.p1(input), "234")
        XCTAssertEqual(day.p2(input), "113")
    }

    func testDay2() {
        let day = Year.days[2]!
        let input = Year.load(day: 2)
        XCTAssertEqual(day.p1(input), "24862")
        XCTAssertEqual(day.p2(input), "46C91")
    }

    func testDay3() {
        let day = Year.days[3]!
        let input = Year.load(day: 3)
        XCTAssertEqual(day.p1(input), "982")
        XCTAssertEqual(day.p2(input), "1826")
    }

    func testDay4() {
        let day = Year.days[4]!
        let input = Year.load(day: 4)
        XCTAssertEqual(day.p1(input), "173787")
        XCTAssertEqual(day.p2(input), "548")
    }

    func testDay5() {
        let day = Year.days[5]!
        let input = Year.load(day: 5)
        XCTAssertEqual(day.p1(input), "801b56a7")
        XCTAssertEqual(day.p2(input), "424a0197")
    }

    func testDay6() {
        let day = Year.days[6]!
        let input = Year.load(day: 6)
        XCTAssertEqual(day.p1(input), "cyxeoccr")
        XCTAssertEqual(day.p2(input), "batwpask")
    }

    func testDay7() {
        let day = Year.days[7]!
        let input = Year.load(day: 7)
        XCTAssertEqual(day.p1(input), "115")
        XCTAssertEqual(day.p2(input), "231")
    }

    func testDay8() {
        let day = Year.days[8]!
        let input = Year.load(day: 8)
        XCTAssertEqual(day.p1(input), "116")
        XCTAssertEqual(day.p2(input), "UPOJFLBCEZ")
    }

    func testDay9() {
        let day = Year.days[9]!
        let input = Year.load(day: 9)
        XCTAssertEqual(day.p1(input), "74532")
        XCTAssertEqual(day.p2(input), "11558231665")
    }

    func testDay10() {
        let day = Year.days[10]!
        let input = Year.load(day: 10)
        XCTAssertEqual(day.p1(input), "157")
        XCTAssertEqual(day.p2(input), "1085")
    }

    func testDay11() {
        let day = Year.days[11]!
        let input = Year.load(day: 11)
        XCTAssertEqual(day.p1(input), "")
        XCTAssertEqual(day.p2(input), "")
    }

    func testDay12() {
        let day = Year.days[12]!
        let input = Year.load(day: 12)
        XCTAssertEqual(day.p1(input), "318083")
        XCTAssertEqual(day.p2(input), "9227737")
    }

    func testDay13() {
        let day = Year.days[13]!
        let input = Year.load(day: 13)
        XCTAssertEqual(day.p1(input), "90")
        XCTAssertEqual(day.p2(input), "135")
    }

    func testDay14() {
        let day = Year.days[14]!
        let input = Year.load(day: 14)
        XCTAssertEqual(day.p1(input), "23890")
        XCTAssertEqual(day.p2(input), "22696")
    }

    func testDay15() {
        let day = Year.days[15]!
        let input = Year.load(day: 15)
        XCTAssertEqual(day.p1(input), "317371")
        XCTAssertEqual(day.p2(input), "2080951")
    }

    func testDay16() {
        let day = Year.days[16]!
        let input = Year.load(day: 16)
        XCTAssertEqual(day.p1(input), "11111000111110000")
        XCTAssertEqual(day.p2(input), "10111100110110100")
    }

    func testDay17() {
        let day = Year.days[17]!
        let input = Year.load(day: 17)
        XCTAssertEqual(day.p1(input), "RDRLDRDURD")
        XCTAssertEqual(day.p2(input), "596")
    }

    func testDay18() {
        let day = Year.days[18]!
        let input = Year.load(day: 18)
        XCTAssertEqual(day.p1(input), "1974")
        XCTAssertEqual(day.p2(input), "19991126")
    }

    func testDay19() {
        let day = Year.days[19]!
        let input = Year.load(day: 19)
        XCTAssertEqual(day.p1(input), "1842613")
        XCTAssertEqual(day.p2(input), "")
    }

    func testDay20() {
        let day = Year.days[20]!
        let input = Year.load(day: 20)
        XCTAssertEqual(day.p1(input), "22887907")
        XCTAssertEqual(day.p2(input), "109")
    }

    func testDay21() {
        let day = Year.days[21]!
        let input = Year.load(day: 21)
        XCTAssertEqual(day.p1(input), "cbeghdaf")
        XCTAssertEqual(day.p2(input), "")
    }

    func testDay22() {
        let day = Year.days[22]!
        let input = Year.load(day: 22)
        XCTAssertEqual(day.p1(input), "993")
        XCTAssertEqual(day.p2(input), "")
    }

    func testDay23() {
        let day = Year.days[23]!
        let input = Year.load(day: 23)
        XCTAssertEqual(day.p1(input), "")
        XCTAssertEqual(day.p2(input), "")
    }

    func testDay24() {
        let day = Year.days[24]!
        let input = Year.load(day: 24)
        XCTAssertEqual(day.p1(input), "")
        XCTAssertEqual(day.p2(input), "")
    }

    func testDay25() {
        let day = Year.days[25]!
        let input = Year.load(day: 25)
        XCTAssertEqual(day.p1(input), "")
        XCTAssertEqual(day.p2(input), "")
    }
}
