//
//  ResultsViewController.swift
//  Roshambo
//

import UIKit

class ResultsViewController: UIViewController {

    // MARK: -
    // MARK: Outlets

    // 18–19) Implicitly unwrapped optional
    // More outlets!
    @IBOutlet private weak var resultImage: UIImageView!
    @IBOutlet private weak var resultLabel: UILabel!

    // MARK: Data

    // 20) Optional
    // As with the history property in the history view controller, this ensures that if you somehow
    // forget to set this property (or deliberately don't set it), the corresponding view still
    // works. Some programmers might want the app to crash instead. In this case, I was too lazy to
    // include code for when the matchup doesn't exist, but it would be easy to add.
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
        // 21) if / let
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

        // This is where code to handle a missing matchup would go: in an else clause.
    }

    @IBAction private func playAgain() {
        // 22) Optional chaining
        self.navigationController?.popToRootViewControllerAnimated(true)

        // I like this use of optional chaining because popping to a root view controller is
        // something that only makes sense if a navigation controller exists.
    }

}
