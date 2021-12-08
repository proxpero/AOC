public extension Collection where Element == Int {
    func median() -> Double {
        let sortedArray = sorted()
        guard count.isMultiple(of: 2) else {
            let middle = count / 2
            return Double(sortedArray[middle] + sortedArray[middle - 1]) / 2.0
        }
        return Double(sortedArray[count / 2])
    }

    func mean() -> Double {
        Double(reduce(into: 0) { $0 += $1 }) / Double(count)
    }
}
