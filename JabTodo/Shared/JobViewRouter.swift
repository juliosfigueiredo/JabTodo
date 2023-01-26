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
}
