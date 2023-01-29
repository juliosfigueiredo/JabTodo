//
//  Job.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 09/12/22.
//

import Foundation
import UIKit
import SwiftUI

class Job: Identifiable, Codable, Hashable {
    static func == (lhs: Job, rhs: Job) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: UUID
    var title: String
    var description: String
    var date: Date
    var isActive: Bool

    init(id: UUID, title: String, description: String, date: Date, isActive: Bool) {
        self.id = id
        self.title = title
        self.description = description
        self.date = date
        self.isActive = isActive
    }
}
