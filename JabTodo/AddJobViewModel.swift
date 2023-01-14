//
//  AddTarefaViewModel.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 16/12/22.
//

import Foundation
import SwiftUI

class AddJobViewModel: ObservableObject {
    @Published var title = String()
    @Published var description = String()
    @Published var date = Date()
    @Published var selectedFrequency: Frequency = .umDia
    
    func createJob(){
        //Cria a Plist e Insere o novo item.
        let job = Job(title: title, description: description, date: date, isActive: true)
        StorageHandler.write(item: job)
    }
    
    /*
    func updateListaTarefa(){
        //Carregar itens existentes na PList.
        lista = StorageHandler.load()
    }
    
    
    func resetTarefa(){
        //Deleta o arquivo da Plist.
        StorageHandler.deleteAll()
        //Limpa o array.
        lista = StorageHandler.load()
    }
     */
    
    var dateClosedRange: ClosedRange<Date> {
        let today = Calendar.current.date(byAdding: .minute, value: -1, to: Date())!
        let seven = Calendar.current.date(byAdding: .day, value: 90, to: Date())!
        return today...seven
    }
}
