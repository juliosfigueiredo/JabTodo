//
//  AddTarefaViewModel.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 16/12/22.
//

import Foundation
import SwiftUI

class AddTarefaViewModel: ObservableObject {
    @Published var title = String()
    @Published var description = String()
    @Published var date = Date()
    @Published var lista: [Tarefa] = []
    @Published var selectedFrequencia: Frequencia = .umDia
    
    func createTarefa(){
        //Cria a Plist e Insere o novo item.
        let tarefa = Tarefa(title: title, description: description, date: date)
        StorageHandler.write(item: tarefa)
        //Atualiza os dados do array.
        updateListaTarefa()
    }
    
    
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
    
    var dateClosedRange: ClosedRange<Date> {
        let today = Calendar.current.date(byAdding: .minute, value: -1, to: Date())!
        let seven = Calendar.current.date(byAdding: .day, value: 90, to: Date())!
        return today...seven
    }
}
