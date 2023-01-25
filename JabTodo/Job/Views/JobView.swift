//
//  JobView.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 21/12/22.
//

import SwiftUI

struct JobView: View {
    @State var isShowView: Bool = false
    @StateObject var viewModel: JobViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Utils.ValorFake.listaJobFake) { job in
                    JobRowView(job: job)
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
                        AddJobView(viewModel: AddJobViewModel())
                    }
                }
            }
        }
    }
}

struct JobView_Previews: PreviewProvider {
    static var previews: some View {
        JobView(viewModel: JobViewModel())
    }
}
