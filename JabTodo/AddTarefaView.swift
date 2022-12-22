//
//  AddTarefaView.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 21/12/22.
//

import SwiftUI

enum Frequencia: String, CaseIterable, Identifiable {
    case umDia = "Uma vez ao dia"
    case dozeHoras = "12 em 12 horas"
    case dezHoras = "10 em 10 horas"
    case oitoHoras = "8 em 8 horas"
    case seisHoras = "6 em 6 horas"
    case tresHoras = "3 em 3 horas"
    case umaHora = "1 em 1 hora"
    var id: Self { self }
}

struct AddTarefaView: View {
    
    @StateObject var viewModel: AddTarefaViewModel
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
                    Picker("Alerta", selection: $viewModel.selectedFrequencia) {
                        ForEach(Frequencia.allCases) { frequencia in
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

struct AddTarefaView_Previews: PreviewProvider {
    static var previews: some View {
        AddTarefaView(viewModel: AddTarefaViewModel())
    }
}
