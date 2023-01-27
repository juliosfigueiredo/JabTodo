//
//  JabTodoApp.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 09/12/22.
//

import SwiftUI

@main
struct JabTodoApp: App {
    var viewModel: JobViewModel
    
    // MARK: - Checar se o usuario já clicou no botão Começar quando o app é reiniciado novamente
    init() {
        viewModel = JobViewModel()
        let appInit = viewModel.checkAppInit()
        if appInit {
            viewModel.appInit = false
        }
    }
    
    var body: some Scene {
        WindowGroup {
            JobView(viewModel: viewModel)
        }
    }
}
