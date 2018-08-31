//
//  TaskViewController.swift
//  Above The Horizon
//
//  Created by Robin Schroer on 2018-08-27.
//  Copyright © 2018 Robin Schroer. All rights reserved.
//

import UIKit

import Layout

class TaskViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    var task: Task?

    override func viewDidLoad() {
        super.viewDidLoad()

        if task == nil {
            task = Task()
        }

        self.loadLayout(
            named: "Layouts/Screens/Task.xml",
            state: [
                "task": task
            ],
            constants: [
                "backgroundColor": UIColor.white,
                // These are overridden on a per-case basis.
                "labelText": "",
                "contentText": "",
            ]
        )
    }

    let dataRows: [(String, String, (Task) -> String)] = [
        ("UUID", "textLabel", {"UUID: " + $0.uuid.uuidString}),
        ("Title", "textField", {$0.title}),
        ]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            return dataRows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            // Use special Layout extension method to dequeue the node rather
            // than the view itself.
            let node = tableView.dequeueReusableCellNode(
                withIdentifier: dataRows[indexPath.row].1, for: indexPath)

            let text = dataRows[indexPath.row].0
            let content = dataRows[indexPath.row].2(task!)

            // Set the node state to update the cell.
            node.setState([
                "labelText": text,
                "contentText": content,
                ])

            // Cast the node view to a table cell and return it.
            return node.view as! UITableViewCell
    }
}
