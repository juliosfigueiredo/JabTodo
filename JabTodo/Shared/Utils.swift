//
//  Utils.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 13/01/23.
//

import Foundation
import SwiftUI

struct Utils {
    struct ValorFake {
        static let job = Job(id: UUID(), title: "Lavar", description: "Lavar a roupa da casa", date: Date(), isActive: true)
        static let job2 = Job(id: UUID(), title: "Inglês", description: "Estudar a materia da semana", date: Date(), isActive: true)
        static let listaJobFake: [Job] = [job, job2]
    }
}
