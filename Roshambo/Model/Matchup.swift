//
//  Matchup.swift
//  Roshambo
//

import Foundation

enum Shape: Int, Printable {

    case Rock, Paper, Scissors

    // MARK: -
    // MARK: Computed Properties

    var description: String {
        switch self {
        case .Rock: return "Rock"
        case .Paper: return "Paper"
        case .Scissors: return "Scissors"
        }
    }

    // MARK: -
    // MARK: Utilities

    static private func allShapes() -> [Shape] {
        var shapes = [Shape]()
        var n = 0
        // 20) if / let
        while let shape = Shape(rawValue: n) {
            shapes.append(shape)
            ++n
        }
        return shapes
    }

    static func randomShape() -> Shape {
        let shapes = allShapes()
        let index = Int(arc4random_uniform(UInt32(shapes.count)))
        return shapes[index]
    }

}

enum Result: Printable {

    case Tie, Win, Loss

    var description: String {
        switch self {
        case .Tie: return "Tie"
        case .Win: return "Win"
        case .Loss: return "Loss"
        }
    }

}

struct Matchup: Printable {

    // MARK: -
    // MARK: Properties

    let player: Shape
    let opponent = Shape.randomShape()

    // MARK: Computed Properties

    var description: String {
        return "\(player.description) vs. \(opponent.description)"
    }

    // MARK: -
    // MARK: Initialization

    init(player: Shape) {
        self.player = player
    }

    // MARK: -
    // MARK: Result

    func result() -> Result {
        switch (player, opponent) {
        case let (player, opponent) where player == opponent: return .Tie
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper): return .Win
        default: return .Loss
        }
    }
    
}
