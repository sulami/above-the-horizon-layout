//
//  Task.swift
//  Above The Horizon
//
//  Created by Robin Schroer on 2018-08-25.
//  Copyright © 2018 Robin Schroer. All rights reserved.
//

import Foundation

class Task {
    @objc dynamic var uuid: UUID
    @objc dynamic var title: String

    convenience init() {
        self.init(title: "")
    }

    init(title: String) {
        self.uuid = UUID()
        self.title = title
    }
}
