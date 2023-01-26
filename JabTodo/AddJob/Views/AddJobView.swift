//
//  AddTarefaView.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 21/12/22.
//

import SwiftUI

struct AddJobView: View {
    
    @StateObject var viewModel: AddJobViewModel
    @Environment(\.presentationMode) var presentationMode
    
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Título", text: $viewModel.title)
                    TextField("Descrição", text: $viewModel.description)
                    DatePickerView()
                }
                Section {
                    Picker("Alerta", selection: $viewModel.selectedFrequency) {
                        ForEach(Frequency.allCases) { frequencia in
                            Text(frequencia.rawValue.capitalized)
                        }
                    }
                }
            }
            .navigationBarTitle("Adicionar tarefa")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(id: "close", placement: ToolbarItemPlacement.navigationBarLeading, showsByDefault: true) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancelar")
                    }
                }
                ToolbarItem(id: "add", placement: ToolbarItemPlacement.navigationBarTrailing, showsByDefault: true) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Adicionar")
                    }
                    .disabled(viewModel.title.isEmpty)
                    .disabled(viewModel.description.isEmpty)
                }
            }
        }
        .environmentObject(viewModel)
    }
    
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddJobView_Previews: PreviewProvider {
    static var previews: some View {
        AddJobView(viewModel: AddJobViewModel())
    }
}
