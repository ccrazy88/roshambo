//
//  ChoiceViewController.swift
//  Roshambo
//

import UIKit

class ChoiceViewController: UIViewController {

    // MARK: -
    // MARK: Data

    private lazy var history = [Matchup]()

    // MARK: -
    // MARK: Programmatic Approach

    @IBAction private func playRock(sender: UIButton) {
        // 1) Optional chaining
        // 2) Failable cast
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        vc.matchup = setupMatchup(getUserShape(sender))
        // 3) Optional chaining
        self.navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: Segue with Code Approach

    @IBAction private func playPaper(sender: UIButton) {
        performSegueWithIdentifier("play", sender: sender)
    }

    // MARK: Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "play" {
            let vc = segue.destinationViewController as! ResultsViewController
            vc.matchup = setupMatchup(getUserShape(sender as! UIButton))
        } else if segue.identifier == "history" {
            let vc = segue.destinationViewController as! HistoryViewController
            vc.history = history
        }
    }

    // MARK: -
    // MARK: Utilities

    private func getUserShape(sender: UIButton) -> Shape {
        // This is a bit unsafe!
        // Titles are 0 (rock), 1 (paper), or 2 (scissors).
        // 4) Force unwrapping
        // 5) Force unwrapping
        let shape = sender.titleForState(.Normal)!.toInt()!
        // 6) Force unwrapping
        return Shape(rawValue: shape)!
    }

    private func setupMatchup(player: Shape) -> Matchup {
        let matchup = Matchup(player: player)
        history.append(matchup)
        return matchup
    }

}
