//
//  ViewController.swift
//  Above The Horizon
//
//  Created by Robin Schroer on 2018-08-25.
//  Copyright © 2018 Robin Schroer. All rights reserved.
//

import UIKit

import Layout

class ViewController: UIViewController, LayoutLoading {

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
}

