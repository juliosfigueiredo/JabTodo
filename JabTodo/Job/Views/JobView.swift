//
//  JobView.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 21/12/22.
//

import SwiftUI

struct JobView: View {
    @State var isShowView: Bool = false
    @ObservedObject var viewModel: JobViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.lista.count == 0 {
                    Text("Você ainda não adicionou nenhuma tarefa!")
                } else {
                    List {
                        ForEach(viewModel.lista) { job in
                            JobRowView(viewModel: JobRowViewModel(job: job))
                                .swipeActions(allowsFullSwipe: false) {
                                    Button {
                                        viewModel.checkJob(job: job)
                                    } label: {
                                        Label("Finalizar", systemImage: "text.badge.checkmark")
                                    }
                                    .tint(.indigo)

                                    Button(role: .destructive) {
                                        // MARK: - Passa o item para o método de deletar
                                        viewModel.deleteItem(id: job.id)
                                    } label: {
                                        Label("Apagar", systemImage: "trash.fill")
                                    }
                                }
                        }
                    }
                }
            }
            .navigationBarTitle("Tarefas")
            .toolbar {
                ToolbarItem(id: "add", placement: ToolbarItemPlacement.navigationBarTrailing, showsByDefault: true) {
                    Button {
                        isShowView.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .padding(6)
                            .frame(width: 30, height: 30)
                            .background(Color.black)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                    }
                    .sheet(isPresented: $isShowView) {
                        viewModel.addJobView()
                    }
                }
            }
        }
        .onAppear {
            viewModel.getList()
        }
        .sheet(isPresented: $viewModel.appInit) {
            viewModel.launchView()
        }
    }
}

struct JobView_Previews: PreviewProvider {
    static var previews: some View {
        JobView(viewModel: JobViewModel())
    }
}
