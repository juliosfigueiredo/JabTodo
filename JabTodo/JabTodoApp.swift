//
//  JabTodoApp.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 09/12/22.
//

import SwiftUI

@main
struct JabTodoApp: App {
    var body: some Scene {
        WindowGroup {
            JobView(viewModel: JobViewModel())
        }
    }
}
