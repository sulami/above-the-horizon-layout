//
//  MainViewController.swift
//  Above The Horizon
//
//  Created by Robin Schroer on 2018-08-27.
//  Copyright © 2018 Robin Schroer. All rights reserved.
//

import UIKit

class MainViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.isHidden = true
        self.viewControllers = [TaskListController()]
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
