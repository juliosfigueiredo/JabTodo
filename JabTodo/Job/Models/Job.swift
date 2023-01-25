//
//  Job.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 09/12/22.
//

import Foundation
import UIKit
import SwiftUI

struct Job: Identifiable, Codable, Hashable {
    var id = UUID()
    var title: String
    var description: String
    var date: Date
    var isActive: Bool

    init(title: String, description: String, date: Date, isActive: Bool) {
        self.title = title
        self.description = description
        self.date = date
        self.isActive = isActive
    }
}
