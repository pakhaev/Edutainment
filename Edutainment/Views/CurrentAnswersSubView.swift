//
//  CurrentAnswersSubView.swift
//  Edutainment
//
//  Created by Khusain on 25.02.2024.
//

import SwiftUI

struct CurrentAnswersSubView: View {
    @EnvironmentObject var vm: EdutainmentViewModel
    
    var body: some View {
        Section() {
            Text("\(vm.currentAnswers)")
                .animation(.easeIn, value: vm.currentAnswers)
        } header: {
            Text("Правильные ответы")
                .foregroundStyle(.white)
                .font(.headline)
        }
        
    }
}

#Preview {
    CurrentAnswersSubView()
        .environmentObject(EdutainmentViewModel())
}
