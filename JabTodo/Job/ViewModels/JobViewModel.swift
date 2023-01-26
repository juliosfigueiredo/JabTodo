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
    @Published var appInit: Bool = true
    private let local: LocalDataSource = .shared
    
    
}

extension JobViewModel {
    // MARK: - Carrega itens existentes na PList
    func getList(){
        lista = StorageHandler.load()
    }
    
    // MARK: - Checar se o sistema deve mostrar a mensagem de boas vindas
    func checkAppInit() -> Bool {
        return local.checkAppInit()
    }
    
    // MARK: - Função para chamar a tela de boas vindas
    func launchView() -> some View {
        return JobViewRouter.makeLaunchView()
    }
}
