import AdventOfCode
import Parsing

typealias Wire = String
typealias Value = UInt16

enum Input {
    case value(Value)
    case wire(Wire)
}

enum Signal {
    case gate(Gate)
    case input(Input)
}

enum Gate {
    case not(Input)
    case and(Input, Input)
    case or(Input, Input)
    case rShift(Input, Input)
    case lShift(Input, Input)
}

struct Circuit {

    private var memo: [Wire: Value] = [:]
    var graph: [Wire: Signal]

    init(graph: [Wire : Signal]) {
        self.graph = graph
    }

    private mutating func eval(_ gate: Gate) -> Value {
        switch gate {
        case .not(let signal):
            return ~(eval(signal))
        case .and(let lhs, let rhs):
            return eval(lhs) & eval(rhs)
        case .or(let lhs, let rhs):
            return eval(lhs) | eval(rhs)
        case .rShift(let signal, let shift):
            return eval(signal) >> eval(shift)
        case .lShift(let signal, let shift):
            return eval(signal) << eval(shift)
        }
    }

    private mutating func eval(_ input: Input) -> Value {
        switch input {
        case .value(let value):
            return value
        case .wire(let wire):
            return memo[wire] ?? {
                let v = value(for: wire)
                memo[wire] = v
                return v
            }()
        }
    }

    mutating func eval(_ signal: Signal) -> Value {
        switch signal {
        case .gate(let gate):
            return eval(gate)
        case .input(let input):
            return eval(input)
        }
    }

    mutating func value(for wire: Wire) -> Value {
        guard let signal = graph[wire] else {
            fatalError("Unexpected wire: \(wire)")
        }
        return eval(signal)
    }
}

extension Day {

    private static func parse(input: String) -> Circuit {
        var graph: [Wire: Signal] = [:]

        let lines = input.split(separator: "\n").map { line -> (String, String) in
            let items = line.components(separatedBy: " -> ")
            return (items[0], items[1])
        }

        func parseInput(_ input: String) -> Input {
            if let value = Value(input) {
                return .value(value)
            }
            return .wire(input)
        }

        func parseGate(_ gate: String) -> Signal? {
            let components = gate.split(separator: " ").map(String.init)
            guard components.count > 1 else {
                return nil
            }

            if components[0] == "NOT" {
                return .gate(.not(parseInput(components[1])))
            }

            let gate: Gate
            let lhs = parseInput(components[0])
            let rhs = parseInput(components[2])
            switch components[1] {
            case "AND":
                gate = .and(lhs, rhs)
            case "OR":
                gate = .or(lhs, rhs)
            case "RSHIFT":
                gate = .rShift(lhs, rhs)
            case "LSHIFT":
                gate = .lShift(lhs, rhs)
            default:
                fatalError("Unexpected gate: \(components[1])")
            }

            return .gate(gate)
        }

        for (lhs, rhs) in lines {
            graph[rhs] = parseGate(lhs) ?? Signal.input(parseInput(lhs))
        }

        return Circuit(graph: graph)
    }

    private static func p1(input: String) -> String {
        var circuit = parse(input: input)
        let result = circuit.value(for: "a")
        return String(describing: result)
    }

    private static func p2(input: String) -> String {
        var c1 = parse(input: input)
        var c2 = c1
        let a = c1.value(for: "a")
        c2.graph["b"] = .input(.value(a))
        let result = c2.value(for: "a")
        return String(describing: result)
    }

    static let d7 = Day(p1, p2)
}
