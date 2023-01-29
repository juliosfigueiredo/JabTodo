//
//  JobRowView.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 13/01/23.
//

import SwiftUI

struct JobRowView: View {
    @ObservedObject var viewModel: JobRowViewModel
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(maxWidth: 8, alignment: .leading)
                .foregroundColor(viewModel.isActive ? Color.green : Color.red)
                .cornerRadius(5)
                .padding(.trailing, 3)
                .padding(.bottom, 4)
                .padding(.top, 4)
            VStack(alignment: .leading, spacing: 4) {
                Label("Título", systemImage: "folder.fill")
                    .accessibilityLabel("Título")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .labelStyle(.titleAndIcon)
                Text(viewModel.title)
                    .font(.headline)
                Spacer()
                    .frame(height: 3)
                Label("Descrição", systemImage: "list.clipboard.fill")
                    .accessibilityLabel("Descrição")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .labelStyle(.titleAndIcon)
                Text(viewModel.description)
                    .font(.headline)
                Spacer()
                    .frame(height: 3)
                Label("Data", systemImage: "calendar")
                    .accessibilityLabel("Descrição")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .labelStyle(.titleAndIcon)
                Text(viewModel.data)
                    .font(.headline)
                Spacer()
                    .frame(height: 3)
            }
        }
    }
}

struct JobRowView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            JobRowView(viewModel: JobRowViewModel(job: Utils.ValorFake.job))
        }
    }
}
