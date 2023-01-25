//
//  Frequency.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 25/01/23.
//

import Foundation

enum Frequency: String, CaseIterable, Identifiable {
    case umDia = "Uma vez ao dia"
    case dozeHoras = "12 em 12 horas"
    case dezHoras = "10 em 10 horas"
    case oitoHoras = "8 em 8 horas"
    case seisHoras = "6 em 6 horas"
    case tresHoras = "3 em 3 horas"
    case umaHora = "1 em 1 hora"
    var id: Self { self }
}
