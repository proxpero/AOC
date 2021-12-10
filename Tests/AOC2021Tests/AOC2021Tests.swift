import AdventOfCode
@testable import AOC2021
import XCTest

final class AOC2021Tests: XCTestCase {
    func testDay1() {
        let day = Year.days[1]!
        let input = Year.load(day: 1)
        XCTAssertEqual(day.p1(input), "1448")
        XCTAssertEqual(day.p2(input), "1471")
    }

    func testDay2() {
        let day = Year.days[2]!
        let input = Year.load(day: 2)
        XCTAssertEqual(day.p1(input), "1855814")
        XCTAssertEqual(day.p2(input), "1845455714")
    }

    func testDay3() {
        let day = Year.days[3]!
        let input = Year.load(day: 3)
        XCTAssertEqual(day.p1(input), "2640986")
        XCTAssertEqual(day.p2(input), "6822109")
    }

    func testDay4() {
        let day = Year.days[4]!
        let input = Year.load(day: 4)
        XCTAssertEqual(day.p1(input), "63552")
        XCTAssertEqual(day.p2(input), "9020")
    }

    func testDay5() {
        let day = Year.days[5]!
        let input = Year.load(day: 5)
        XCTAssertEqual(day.p1(input), "7438")
        XCTAssertEqual(day.p2(input), "21406")
    }

    func testDay6() {
        let day = Year.days[6]!
        let input = Year.load(day: 6)
        XCTAssertEqual(day.p1(input), "391888")
        XCTAssertEqual(day.p2(input), "1754597645339")
    }

    func testDay7() {
        let day = Year.days[7]!
        let input = Year.load(day: 7)
        XCTAssertEqual(day.p1(input), "355521")
        XCTAssertEqual(day.p2(input), "100148777")
    }

    func testDay8() {
        let day = Year.days[8]!
        let input = Year.load(day: 8)
        XCTAssertEqual(day.p1(input), "365")
        XCTAssertEqual(day.p2(input), "975706")
    }

    func testDay9() {
        let day = Year.days[9]!
        let input = Year.load(day: 9)
        XCTAssertEqual(day.p1(input), "572")
        XCTAssertEqual(day.p2(input), "847044")
    }

    func testDay10() {
        let day = Year.days[10]!
        let input = Year.load(day: 10)
        XCTAssertEqual(day.p1(input), "339411")
        XCTAssertEqual(day.p2(input), "2289754624")
    }

//    func testDay11() {
//        let day = Year.days[11]!
//        let input = Year.load(day: 11)
//        XCTAssertEqual(day.p1(input), "")
//        XCTAssertEqual(day.p2(input), "")
//    }
//
//    func testDay12() {
//        let day = Year.days[12]!
//        let input = Year.load(day: 12)
//        XCTAssertEqual(day.p1(input), "")
//        XCTAssertEqual(day.p2(input), "")
//    }
//
//    func testDay13() {
//        let day = Year.days[13]!
//        let input = Year.load(day: 13)
//        XCTAssertEqual(day.p1(input), "")
//        XCTAssertEqual(day.p2(input), "")
//    }
//
//    func testDay14() {
//        let day = Year.days[14]!
//        let input = Year.load(day: 14)
//        XCTAssertEqual(day.p1(input), "")
//        XCTAssertEqual(day.p2(input), "")
//    }
//
//    func testDay15() {
//        let day = Year.days[15]!
//        let input = Year.load(day: 15)
//        XCTAssertEqual(day.p1(input), "")
//        XCTAssertEqual(day.p2(input), "")
//    }
//
//    func testDay16() {
//        let day = Year.days[16]!
//        let input = Year.load(day: 16)
//        XCTAssertEqual(day.p1(input), "")
//        XCTAssertEqual(day.p2(input), "")
//    }
//
//    func testDay17() {
//        let day = Year.days[17]!
//        let input = Year.load(day: 17)
//        XCTAssertEqual(day.p1(input), "")
//        XCTAssertEqual(day.p2(input), "")
//    }
//
//    func testDay18() {
//        let day = Year.days[18]!
//        let input = Year.load(day: 18)
//        XCTAssertEqual(day.p1(input), "")
//        XCTAssertEqual(day.p2(input), "")
//    }
//
//    func testDay19() {
//        let day = Year.days[19]!
//        let input = Year.load(day: 19)
//        XCTAssertEqual(day.p1(input), "")
//        XCTAssertEqual(day.p2(input), "")
//    }
//
//    func testDay20() {
//        let day = Year.days[20]!
//        let input = Year.load(day: 20)
//        XCTAssertEqual(day.p1(input), "")
//        XCTAssertEqual(day.p2(input), "")
//    }
//
//    func testDay21() {
//        let day = Year.days[21]!
//        let input = Year.load(day: 21)
//        XCTAssertEqual(day.p1(input), "")
//        XCTAssertEqual(day.p2(input), "")
//    }
//
//    func testDay22() {
//        let day = Year.days[22]!
//        let input = Year.load(day: 22)
//        XCTAssertEqual(day.p1(input), "")
//        XCTAssertEqual(day.p2(input), "")
//    }
//
//    func testDay23() {
//        let day = Year.days[23]!
//        let input = Year.load(day: 23)
//        XCTAssertEqual(day.p1(input), "")
//        XCTAssertEqual(day.p2(input), "")
//    }
//
//    func testDay24() {
//        let day = Year.days[24]!
//        let input = Year.load(day: 24)
//        XCTAssertEqual(day.p1(input), "")
//        XCTAssertEqual(day.p2(input), "")
//    }
//
//    func testDay25() {
//        let day = Year.days[25]!
//        let input = Year.load(day: 25)
//        XCTAssertEqual(day.p1(input), "")
//        XCTAssertEqual(day.p2(input), "")
//    }
}
