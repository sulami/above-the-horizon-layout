//
//  ViewController.swift
//  Above The Horizon
//
//  Created by Robin Schroer on 2018-08-25.
//  Copyright © 2018 Robin Schroer. All rights reserved.
//

import UIKit

import Layout

class ViewController: UIViewController, LayoutLoading, UITableViewDataSource,
    UITableViewDelegate {

    // TODO: Make this reactive or something.
    let tasks: [Task] = [
        "A New Hope",
        "The Empire Strikes Back",
        "Return of the Jedi",
        ].map({
            title in Task(title: title)
        })

    override func viewDidLoad() {
        super.viewDidLoad() 
        // Do any additional setup after loading the view, typically from a nib.

        self.loadLayout(
            named: "layouts/home.xml",
            constants: [
                "backgroundColor": UIColor.white
            ]
        )
    }

    // MARK: - TableView Stuff

    @IBOutlet var tableView: UITableView? {
        didSet {
            // This doesn't do anything.
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
            -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            // Use special Layout extension method to dequeue the node rather
            // than the view itself.
            let node = tableView.dequeueReusableCellNode(
                withIdentifier: "cell", for: indexPath)

            // Set the node state to update the cell.
            node.setState(tasks[indexPath.row])

            // Cast the node view to a table cell and return it.
            return node.view as! UITableViewCell
    }
}
