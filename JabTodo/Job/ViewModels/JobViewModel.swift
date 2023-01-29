//
//  JobViewModel.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 13/01/23.
//

import Foundation
import SwiftUI
import Combine

class JobViewModel: ObservableObject {
    @Published var lista: [Job] = []
    @Published var appInit: Bool = true
    private let local: LocalDataSource = .shared
    private var cancellableNotify: AnyCancellable?
    private let jobPublisher = PassthroughSubject<Bool, Never>()
    
    init() {
        cancellableNotify = jobPublisher.sink(receiveValue: { itemSalvo in
            print("Novo item salvo: \(itemSalvo)")
            self.getList()
        })
    }
    
    deinit {
        cancellableNotify?.cancel()
    }
    
    // MARK: - Carrega itens existentes na PList
    func getList(){
        lista = []
        lista = StorageHandler.load()
    }
    
    // MARK: - Metodo para deletar que recebe pelo id do item, depois de deletado o item na PList é preciso limpar a lista da view para depois carregar ela novamente com os novos itens.
    func deleteItem(id: UUID) {
        StorageHandler.delete(id: id)
        getList()
    }
    
    func checkJob(job: Job) {
        let newJob = Job(id: job.id, title: job.title, description: job.description, date: job.date, isActive: false)
        deleteItem(id: job.id)
        StorageHandler.write(item: newJob)
        getList()
    }
}

extension JobViewModel {
    // MARK: - Checar se o sistema deve mostrar a mensagem de boas vindas
    func checkAppInit() -> Bool {
        return local.checkAppInit()
    }
    
    // MARK: - Função para chamar a tela de boas vindas
    func launchView() -> some View {
        return JobViewRouter.makeLaunchView()
    }
    
    // MARK: - Função para chamar a tela de nova tarefa
    func addJobView() -> some View {
        return JobViewRouter.makeAddJobView(jobPublisher: jobPublisher)
    }
}
