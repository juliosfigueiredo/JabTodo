//
//  AddTarefaViewModel.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 16/12/22.
//

import Foundation
import SwiftUI
import Combine

class AddJobViewModel: ObservableObject {
    @Published var title = String()
    @Published var description = String()
    @Published var date = Date()
    @Published var selectedFrequency: Frequency = .umDia
    private let local: LocalDataSource = .shared
    
    var jobPublisher: PassthroughSubject<Bool, Never>?
    
    func createJob(){
        //Cria a Plist e Insere o novo item.
        let job = Job(title: title, description: description, date: date, isActive: true)
        StorageHandler.write(item: job)
        // Seta o publisher para avisar a tela inicial que ela precisa se atualizar
        self.jobPublisher?.send(true)
        
        //TODO: - Tenho que acabar essa função
        // Adiciona a notificação local
        //local.addNotification(id: job.id, message: "Teste", time: TimeInterval(1 * 60 * 60))
    }
    
    // MARK: - Range que define o tamanho do calendario
    var dateClosedRange: ClosedRange<Date> {
        let today = Calendar.current.date(byAdding: .minute, value: -1, to: Date())!
        let seven = Calendar.current.date(byAdding: .day, value: 90, to: Date())!
        return today...seven
    }
}
