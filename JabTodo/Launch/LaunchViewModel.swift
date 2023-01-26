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
    
    func setAppInit() {
        local.setAppInit()
    }
    
    func checkAppInit() -> Bool {
        return local.checkAppInit()
    }
}
