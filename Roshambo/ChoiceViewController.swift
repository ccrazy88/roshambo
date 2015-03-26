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

        // The philosophy here is to make things that I very explicitly control and won't change
        // failable casts, and things that could potentially be out of my control optional chains
        // rather than force unwrappings. I wouldn't be opposed to making the storyboard optional
        // chain a force unwrapping since it's already "unsafe".
    }

    // MARK: Segue with Code Approach

    @IBAction private func playPaper(sender: UIButton) {
        performSegueWithIdentifier("play", sender: sender)
    }

    // MARK: Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "play" {
            // 4) Failable cast
            let vc = segue.destinationViewController as! ResultsViewController
            // 5) Failable cast
            vc.matchup = setupMatchup(getUserShape(sender as! UIButton))
        } else if segue.identifier == "history" {
            // 6) Failable cast
            let vc = segue.destinationViewController as! HistoryViewController
            vc.history = history
        }

        // I control the UI and the UI is static, so I'm comfortable filling this function with lots
        // of exclamation points.
    }

    // MARK: -
    // MARK: Utilities

    private func getUserShape(sender: UIButton) -> Shape {
        // Titles are 0 (rock), 1 (paper), or 2 (scissors).
        // 7) Force unwrapping
        // 8) Force unwrapping
        let shape = sender.titleForState(.Normal)!.toInt()!
        // 9) Force unwrapping
        return Shape(rawValue: shape)!

        // Same here as above.
    }

    private func setupMatchup(player: Shape) -> Matchup {
        let matchup = Matchup(player: player)
        history.append(matchup)
        return matchup
    }

}
