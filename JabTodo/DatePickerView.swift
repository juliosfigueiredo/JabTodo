//
//  DatePickerView.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 21/12/22.
//

import SwiftUI

struct DatePickerView: View {
    @EnvironmentObject var viewModel: AddTarefaViewModel
    
    var body: some View {
        VStack {
            DatePicker(selection: $viewModel.date, in: viewModel.dateClosedRange) {
                Text("Data")
            }
            .datePickerStyle(CompactDatePickerStyle())
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
