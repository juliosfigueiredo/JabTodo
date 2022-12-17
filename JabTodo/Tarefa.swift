//
//  Tarefa.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 09/12/22.
//

import Foundation
import UIKit
import SwiftUI

struct Tarefa: Identifiable, Codable, Comparable, Hashable {
    var id: String
    var title: String
    var description: String
    var date: Date

    init(title: String, description: String, date: Date) {
        self.id = UUID().uuidString
        self.title = title
        self.description = description
        self.date = date
    }

    static func <(lhs: Tarefa, rhs: Tarefa) -> Bool {
        lhs.id < rhs.id
    }
}
