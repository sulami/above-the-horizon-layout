//
//  TaskViewController.swift
//  Above The Horizon
//
//  Created by Robin Schroer on 2018-08-27.
//  Copyright © 2018 Robin Schroer. All rights reserved.
//

import UIKit

import Layout

class TaskViewController: UIViewController, LayoutLoading {
    var task: Task?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadLayout(
            named: "layouts/task.xml",
            state: [
                "task": task
            ],
            constants: [
                "backgroundColor": UIColor.white
            ]
        )
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
