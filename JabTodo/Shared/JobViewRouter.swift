//
//  JobViewRouter.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 26/01/23.
//

import Foundation
import Combine
import SwiftUI
import CoreData

enum JobViewRouter {
    // MARK: - Rota para chamar a tela de boas vindas
    static func makeLaunchView() -> some View {
        return LaunchView(viewModel: LaunchViewModel())
    }
    
    // MARK: - Rota para chamar a tela de nova tarefa, esta viewModel é diferente pois ela recebe da tela inicial um cara (publisher) que vai ficar escutado quando for criada uma nova tarefa e vai avisar a tela inicial
    static func makeAddJobView(jobPublisher: PassthroughSubject<Bool, Never>) -> some View {
        let viewModel = AddJobViewModel()
        viewModel.jobPublisher = jobPublisher
        return AddJobView(viewModel: viewModel)
    }
}
