//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by Chrisna Aing on 3/19/15.
//  Copyright (c) 2015 Chrisna Aing. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {

    // MARK: -
    // MARK: Table View

    // 10) Implicitly unwrapped optional
    // Outlets are, by default, implicitly unwrapped optionals. This is because view controllers
    // typically go without initializers, and, to have a non-optional variable, it has to have a
    // value by the time the initializer is done. Storyboards put values inside outlets after the
    // initializer finishes, hence the implicitly unwrapped optional.
    @IBOutlet private weak var tableView: UITableView!

    // MARK: Data

    // 11) Optional
    // This ensures that if you somehow forget to set this property (or deliberately don't set it),
    // the corresponding table view still works. Some programmers might want the app to crash
    // instead.
    var history: [Matchup]?

    // MARK: -
    // MARK: Table View Data Source

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 12) Optional chaining
        // 13) Nil coalescing
        return history?.count ?? 0

        // Since our history is an optional array of matchups, we need to chain it in order to get
        // its count. Of course, if it doesn't exist, we don't have any rows, so our default value
        // is a sensible 0.
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 14) Failable cast
        // According to the documentation, as long as we register the identifier, this cast is
        // guaranteed to work, so I'm fine allowing a crash if this isn't the case.
        let cell = tableView.dequeueReusableCellWithIdentifier("historyCell") as! UITableViewCell
        // 15) if / let
        if let history = history {
            let matchup = history[indexPath.row]
            // 16) Optional chaining
            cell.textLabel?.text = "\(matchup.result())"
            // 17) Optional chaining
            cell.detailTextLabel?.text = "\(matchup)"
        }
        return cell

        // The rationale here is to be accepting of all types of UITableViewCell objects. Whether
        // the history exists and whether the cell has a text label or a detail label or nothing,
        // this function will give the table view an appropriate cell to display.
    }

}
