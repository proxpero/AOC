import AdventOfCode
import Parsing

private typealias Cave = String
private extension Cave {
    var isStart: Bool {
        self == "start"
    }

    var isEnd: Bool {
        self == "end"
    }

    var isLarge: Bool {
        self == uppercased()
    }

    var isSmall: Bool {
        !isLarge && !isStart && !isEnd
    }
}

extension Day {
    private static func parse(input: String) -> [Cave: Set<Cave>] {
        let cave = Prefix(while: { $0.isLetter })
        let connections = Many(
            cave.skip("-").take(cave),
            into: [Cave: Set<Cave>](),
            separator: "\n"
        ) { connection, pair in
            let c1 = String(pair.0)
            let c2 = String(pair.1)
            connection[c1, default: Set<Cave>()].insert(c2)
            connection[c2, default: Set<Cave>()].insert(c1)
        }
        let result = connections.parse(input)!
        return result
    }

    private static func pathCount(using connections: [Cave: Set<Cave>], predicate: @escaping (Cave, [Cave]) -> Bool = { _, _ in true }) -> Set<[Cave]> {
        let start = connections.keys.first(where: { $0.isStart })!
        var paths: Set<[Cave]> = []

        func visit(_ cave: Cave, path: [Cave]) {
            if cave.isEnd {
                paths.insert(path + [cave])
                return
            }
            let neighbors = connections[cave] ?? []
            for neighbor in neighbors.filter({ !path.contains($0) || $0.isLarge || !predicate($0, path) }) {
                visit(neighbor, path: path + [cave])
            }
        }

        visit(start, path: [])

        return paths
    }

    private static func p1(input: String) -> String {
        let connections = parse(input: input)
        let result = pathCount(using: connections)
        return String(describing: result.count)
    }

    private static func p2(input: String) -> String {
        let connections = parse(input: input)
        var result: Set<[Cave]> = []
        for double in connections.keys.filter({ $0.isSmall }) {
            let paths = pathCount(using: connections) { neighbor, path in
                neighbor != double || path.filter { $0 == double }.count == 2
            }
            result.formUnion(paths)
        }
        return String(describing: result.count)
    }

    static let d12 = Day(p1, p2)
}
