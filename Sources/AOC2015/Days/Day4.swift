import AdventOfCode
import CryptoKit
import Foundation

extension Data {
    func md5() -> String {
        let hashed = Insecure.MD5.hash(data: self)
        return hashed.compactMap { String(format: "%02x", $0) }.joined()
    }

    func hasZeroPrefix(count: Int) -> Bool {
        Insecure.MD5.hash(data: self).compactMap { String(format: "%02x", $0) }.joined().prefix(count).allSatisfy { $0 == "0" }
    }
}

extension Day {
    private static func p1(input: String) -> String {
        var value = 1
        while !Data("\(input)\(value)".utf8).hasZeroPrefix(count: 5) {
            value += 1
        }
        return String(describing: value)
    }

    private static func p2(input: String) -> String {
        var value = 1
        while !Data("\(input)\(value)".utf8).hasZeroPrefix(count: 6) {
            value += 1
        }
        return String(describing: value)
    }

    static let d4 = Day(p1, p2)
}
