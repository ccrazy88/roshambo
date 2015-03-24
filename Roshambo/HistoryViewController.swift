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

    // 7) Implicitly unwrapped optional
    @IBOutlet private weak var tableView: UITableView!

    // MARK: Data

    // 8) Optional
    var history: [Matchup]?

    // MARK: -
    // MARK: Table View Data Source

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 9) Optional chaining
        // 10) Nil coalescing
        return history?.count ?? 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 11) Failable cast
        let cell = tableView.dequeueReusableCellWithIdentifier("historyCell") as! UITableViewCell
        // 12) if / let
        if let history = history {
            let matchup = history[indexPath.row]
            // 13) Optional chaining
            cell.textLabel?.text = "\(matchup.result())"
            // 14) Optional chaining
            cell.detailTextLabel?.text = "\(matchup)"
        }
        return cell
    }

}
