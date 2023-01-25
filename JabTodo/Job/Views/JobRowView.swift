//
//  JobRowView.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 13/01/23.
//

import SwiftUI

struct JobRowView: View {
    let job: Job
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Label("Título", systemImage: "folder.fill")
                .accessibilityLabel("Título")
                .font(.caption)
                .foregroundColor(.secondary)
                .labelStyle(.titleAndIcon)
            Text(job.title)
                .font(.headline)
            Spacer()
                .frame(height: 3)
            Label("Descrição", systemImage: "list.clipboard.fill")
                .accessibilityLabel("Descrição")
                .font(.caption)
                .foregroundColor(.secondary)
                .labelStyle(.titleAndIcon)
            Text(job.description)
                .font(.headline)
            Spacer()
                .frame(height: 3)
            Label("Data", systemImage: "calendar")
                .accessibilityLabel("Descrição")
                .font(.caption)
                .foregroundColor(.secondary)
                .labelStyle(.titleAndIcon)
            Text(job.date.formatted())
                .font(.headline)
            Spacer()
                .frame(height: 3)
        }
    }
}

struct JobRowView_Previews: PreviewProvider {
    static var previews: some View {
        JobRowView(job: Utils.ValorFake.job)
    }
}
