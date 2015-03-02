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
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        vc.matchup = setupMatchup(getUserShape(sender))
        presentViewController(vc, animated: true, completion: nil)
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
        // Titles are 0 (rock), 1 (paper), or 2 (scissors).
        let shape = sender.titleForState(.Normal)!.toInt()!
        return Shape(rawValue: shape)!
    }

    private func setupMatchup(player: Shape) -> Matchup {
        let matchup = Matchup(player: player)
        history.append(matchup)
        return matchup
    }

}
