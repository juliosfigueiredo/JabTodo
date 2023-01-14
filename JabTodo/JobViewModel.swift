//
//  JobViewModel.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 13/01/23.
//

import Foundation
import SwiftUI

class JobViewModel: ObservableObject {
    @Published var lista: [Job] = []
    
    func getList(){
        //Carregar itens existentes na PList.
        lista = StorageHandler.load()
    }
}
