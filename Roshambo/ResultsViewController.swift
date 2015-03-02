//
//  ResultsViewController.swift
//  Roshambo
//

import UIKit

class ResultsViewController: UIViewController {

    // MARK: -
    // MARK: Outlets

    @IBOutlet private weak var resultImage: UIImageView!
    @IBOutlet private weak var resultLabel: UILabel!

    // MARK: Data

    var userChoice: Shape!
    var matchup: Matchup!

    // MARK: -
    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        matchup = Matchup(player: userChoice)
        displayResult()
    }

    // MARK: -
    // MARK: UI

    private func displayResult() {
        let imageName: String
        let text: String

        switch matchup.result() {
        case .Tie:
            text = "\(matchup.description): it's a tie!"
            imageName = "Tie"
        case .Win:
            text = "You win with \(matchup.description)!"
            imageName = "\(matchup.player.description)-\(matchup.opponent.description)"
        case .Loss:
            text = "You lose with \(matchup.description) :(."
            imageName = "\(matchup.opponent.description)-\(matchup.player.description)"
        }

        resultImage.image = UIImage(named: imageName.lowercaseString)
        resultLabel.text = text
    }

    @IBAction private func playAgain() {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
