//
//  JobRowViewModel.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 28/01/23.
//

import Foundation

class JobRowViewModel: ObservableObject {
    @Published var title = String()
    @Published var description = String()
    @Published var data = String()
    @Published var isActive: Bool = false
    
    init(job: Job) {
        self.title = job.title
        self.description = job.description
        self.data = job.date.formatted()
        self.isActive = job.isActive
    }
}
