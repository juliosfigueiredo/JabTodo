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
    var description: String

    init(description: String) {
        self.id = UUID().uuidString
        self.description = description
    }

    static func <(lhs: Tarefa, rhs: Tarefa) -> Bool {
        lhs.id < rhs.id
    }
}
