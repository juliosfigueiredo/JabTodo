//
//  LaunchView.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 26/01/23.
//

import SwiftUI

struct LaunchView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var viewModel: LaunchViewModel
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 40)
            
            VStack (spacing: 20) {
                Text("Bem-vindo(a) ao")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Tarefas")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .font(.title)
                    .fontWeight(.bold)
            }
            .padding()
            
            Spacer()
                .frame(height: 40)
            
            VStack (alignment: .leading) {
                HStack {
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundStyle(.blue)
                    VStack (alignment: .leading) {
                        Text("Notas")
                            .font(.system(size: 18, weight: .bold))
                        Text("Registre as tarefas que você precisa realizar.")
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
                
                HStack {
                    Image(systemName: "calendar")
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundStyle(.blue)
                    VStack (alignment: .leading) {
                        Text("Calendario")
                            .font(.system(size: 18, weight: .bold))
                        Text("Defina a data das tarefas.")
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
                
                HStack {
                    Image(systemName: "bell.badge.fill")
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundStyle(.blue)
                    VStack (alignment: .leading) {
                        Text("Notificação")
                            .font(.system(size: 18, weight: .bold))
                        Text("Receba notificações na hora que suas tarefas precisam ser concluidas.")
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
            }
            .padding()
            
            Spacer()
            
            Button {
                viewModel.setAppInit()
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Começar")
                    .font(.title3)
                    .bold()
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding()
        }
        
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(viewModel: LaunchViewModel())
    }
}
