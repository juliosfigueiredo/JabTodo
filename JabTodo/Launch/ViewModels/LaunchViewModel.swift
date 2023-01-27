//
//  LaunchViewModel.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 26/01/23.
//

import Foundation

class LaunchViewModel: ObservableObject {
    @Published var appInit: Bool = true
    private let local: LocalDataSource = .shared
    
    init() {
        appInit = checkAppInit()
    }
}

extension LaunchViewModel {
    // MARK: - Função acionada no clique do botão Começar que marca no app que o usuario começou a utilizar o app para que a mensagem não apareça da proxima vez que o app for iniciado.
    func setAppInit() {
        local.setAppInit()
    }
    
    // MARK: - Checa se o usuario clicou no botão Começar para assim mostrar ou não a mensagem de boas vindas.
    func checkAppInit() -> Bool {
        return local.checkAppInit()
    }
}
