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

    var matchup: Matchup?

    // MARK: -
    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        displayResult()
    }

    // MARK: -
    // MARK: UI

    private func displayResult() {
        if let matchup = matchup {
            let imageName: String
            let text: String

            switch matchup.result() {
            case .Tie:
                text = "\(matchup): it's a tie!"
                imageName = "\(matchup.result())"
            case .Win:
                text = "You win with \(matchup)!"
                imageName = "\(matchup.player)-\(matchup.opponent)"
            case .Loss:
                text = "You lose with \(matchup) :(."
                imageName = "\(matchup.opponent)-\(matchup.player)"
            }

            resultImage.image = UIImage(named: imageName.lowercaseString)
            resultLabel.text = text
        }
    }

    @IBAction private func playAgain() {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

}
