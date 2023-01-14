//
//  TarefaUIState.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 13/01/23.
//

import Foundation

enum TarefaUIState: Equatable {
    case loading
    case emptyList
    case non
    //case fullList([RemedioRowViewModel])
    case error(String)
}
