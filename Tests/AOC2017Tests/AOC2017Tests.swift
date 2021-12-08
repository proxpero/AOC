import AdventOfCode
@testable import AOC2017
import XCTest

final class AOC2017Tests: XCTestCase {
    func testDay1() {
        let day = Year.days[1]!
        let input = Year.load(day: 1)
        XCTAssertEqual(day.p1(input), "1102")
        XCTAssertEqual(day.p2(input), "1076")
    }

    func testDay2() {
        let day = Year.days[2]!
        let input = Year.load(day: 2)
        XCTAssertEqual(day.p1(input), "36766")
        XCTAssertEqual(day.p2(input), "261")
    }

    func testDay3() {
        let day = Year.days[3]!
        let input = Year.load(day: 3)
        XCTAssertEqual(day.p1(input), "326")
        XCTAssertEqual(day.p2(input), "361527")
    }

    func testDay4() {
        let day = Year.days[4]!
        let input = Year.load(day: 4)
        XCTAssertEqual(day.p1(input), "383")
        XCTAssertEqual(day.p2(input), "265")
    }

    func testDay5() {
        let day = Year.days[5]!
        let input = Year.load(day: 5)
        XCTAssertEqual(day.p1(input), "355965")
        XCTAssertEqual(day.p2(input), "26948068")
    }

    func testDay6() {
        let day = Year.days[6]!
        let input = Year.load(day: 6)
        XCTAssertEqual(day.p1(input), "3156")
        XCTAssertEqual(day.p2(input), "1610")
    }

    func testDay7() {
        let day = Year.days[7]!
        let input = Year.load(day: 7)
        XCTAssertEqual(day.p1(input), "qibuqqg")
        XCTAssertEqual(day.p2(input), "1079")
    }

    func testDay8() {
        let day = Year.days[8]!
        let input = Year.load(day: 8)
        XCTAssertEqual(day.p1(input), "4902")
        XCTAssertEqual(day.p2(input), "7037")
    }

    func testDay9() {
        let day = Year.days[9]!
        let input = Year.load(day: 9)
        XCTAssertEqual(day.p1(input), "11846")
        XCTAssertEqual(day.p2(input), "6285")
    }

    func testDay10() {
        let day = Year.days[10]!
        let input = Year.load(day: 10)
        XCTAssertEqual(day.p1(input), "46600")
        XCTAssertEqual(day.p2(input), "23234babdc6afa036749cfa9b597de1b")
    }

    func testDay11() {
        let day = Year.days[11]!
        let input = Year.load(day: 11)
        XCTAssertEqual(day.p1(input), "720")
        XCTAssertEqual(day.p2(input), "1485")
    }

    func testDay12() {
        let day = Year.days[12]!
        let input = Year.load(day: 12)
        XCTAssertEqual(day.p1(input), "380")
        XCTAssertEqual(day.p2(input), "181")
    }

    func testDay13() {
        let day = Year.days[13]!
        let input = Year.load(day: 13)
        XCTAssertEqual(day.p1(input), "2508")
        XCTAssertEqual(day.p2(input), "3913186")
    }

    func testDay14() {
        let day = Year.days[14]!
        let input = Year.load(day: 14)
        XCTAssertEqual(day.p1(input), "8074")
        XCTAssertEqual(day.p2(input), "1212")
    }

    func testDay15() {
        let day = Year.days[15]!
        let input = Year.load(day: 15)
        XCTAssertEqual(day.p1(input), "600")
        XCTAssertEqual(day.p2(input), "313")
    }

    func testDay16() {
        let day = Year.days[16]!
        let input = Year.load(day: 16)
        XCTAssertEqual(day.p1(input), "kgdchlfniambejop")
        XCTAssertEqual(day.p2(input), "fjpmholcibdgeakn")
    }

    func testDay17() {
        let day = Year.days[17]!
        let input = Year.load(day: 17)
        XCTAssertEqual(day.p1(input), "")
        XCTAssertEqual(day.p2(input), "")
    }

    func testDay18() {
        let day = Year.days[18]!
        let input = Year.load(day: 18)
        XCTAssertEqual(day.p1(input), "1187")
        XCTAssertEqual(day.p2(input), "5969")
    }

    func testDay19() {
        let day = Year.days[19]!
        let input = Year.load(day: 19)
        XCTAssertEqual(day.p1(input), "SXPZDFJNRL")
        XCTAssertEqual(day.p2(input), "18126")
    }

    func testDay20() {
        let day = Year.days[20]!
        let input = Year.load(day: 20)
        XCTAssertEqual(day.p1(input), "161")
        XCTAssertEqual(day.p2(input), "438")
    }

    func testDay21() {
        let day = Year.days[21]!
        let input = Year.load(day: 21)
        XCTAssertEqual(day.p1(input), "")
        XCTAssertEqual(day.p2(input), "")
    }

    func testDay22() {
        let day = Year.days[22]!
        let input = Year.load(day: 22)
        XCTAssertEqual(day.p1(input), "5259")
        XCTAssertEqual(day.p2(input), "2511722")
    }

    func testDay23() {
        let day = Year.days[23]!
        let input = Year.load(day: 23)
        XCTAssertEqual(day.p1(input), "6724")
        XCTAssertEqual(day.p2(input), "903")
    }

    func testDay24() {
        let day = Year.days[24]!
        let input = Year.load(day: 24)
        XCTAssertEqual(day.p1(input), "1906")
        XCTAssertEqual(day.p2(input), "1824")
    }

    func testDay25() {
        let day = Year.days[25]!
        let input = Year.load(day: 25)
        XCTAssertEqual(day.p1(input), "4769")
        XCTAssertEqual(day.p2(input), "")
    }
}
