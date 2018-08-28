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

        self.loadLayout(
            named: "Layouts/Task.xml",
            state: [
                "task": task
            ],
            constants: [
                "backgroundColor": UIColor.white
            ]
        )
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            // Use special Layout extension method to dequeue the node rather
            // than the view itself.
            let node = tableView.dequeueReusableCellNode(
                withIdentifier: "text", for: indexPath)

            let text: String = indexPath.row == 0
                ? task!.uuid.uuidString
                : task!.title

            // Set the node state to update the cell.
            node.setState([
                "labelText": indexPath.row == 0 ? "UUID" : "Title",
                "contentText": text,
                ])

            // Cast the node view to a table cell and return it.
            return node.view as! UITableViewCell
    }
}
