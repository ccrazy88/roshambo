//
//  ResultsViewController.swift
//  Roshambo
//

import UIKit

enum Shape: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"

    static func randomShape() -> Shape {
        let shapes = ["Rock", "Paper", "Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[randomChoice])!
    }
}

class ResultsViewController: UIViewController {

    // MARK: -
    // MARK: Outlets

    @IBOutlet private weak var resultImage: UIImageView!
    @IBOutlet private weak var resultLabel: UILabel!

    // MARK: Shapes

    var userChoice: Shape!
    private let opponentChoice: Shape = Shape.randomShape()

    // MARK: -
    // MARK: View Lifecycle

    override func viewWillAppear(animated: Bool) {
        displayResult()
    }

    // MARK: -
    // MARK: UI

    private func displayResult() {
        // Ideally, most of this would be handled by a model.
        let imageName: String
        let text: String
        let matchup = "\(userChoice.rawValue) vs. \(opponentChoice.rawValue)"

        // Why is an exclamation point necessary? :(
        switch (userChoice!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            text = "\(matchup): it's a tie!"
            imageName = "Tie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            text = "You win with \(matchup)!"
            imageName = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
        default:
            text = "You lose with \(matchup) :(."
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
        }

        resultImage.image = UIImage(named: imageName.lowercaseString)
        resultLabel.text = text
    }

    @IBAction private func playAgain() {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
