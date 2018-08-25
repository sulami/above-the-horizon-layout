//
//  ViewController.swift
//  Above The Horizon
//
//  Created by Robin Schroer on 2018-08-25.
//  Copyright © 2018 Robin Schroer. All rights reserved.
//

import UIKit

import Layout

class ViewController: UIViewController, LayoutLoading, UITableViewDataSource, UITableViewDelegate {

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

            // Register your cells after the tableView has been created
            // the `didSet` handler for the tableView property is a good place
            //tableView?.register(MyCellClass.self, forCellReuseIdentifier: "cell")
        }
    }

    // TODO: Make this reactive or something.
    var rowData: [Task] = [Task(title: "A New Hope")]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Use special Layout extension method to dequeue the node rather than the view itself
        let node = tableView.dequeueReusableCellNode(withIdentifier: "cell", for: indexPath)

        // Set the node state to update the cell
        node.setState(rowData[indexPath.row])

        // Cast the node view to a table cell and return it
        return node.view as! UITableViewCell
    }
}
