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

    @IBOutlet private weak var tableView: UITableView!

    // MARK: Data

    var history: [Matchup]?

    // MARK: -
    // MARK: Table View Data Source

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history?.count ?? 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("historyCell") as! UITableViewCell
        if let history = history {
            let matchup = history[indexPath.row]
            cell.textLabel?.text = "\(matchup.result())"
            cell.detailTextLabel?.text = "\(matchup)"
        }
        return cell
    }

    // MARK: -
    // MARK: UI

    @IBAction private func goBack() {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
