//
//  QuestionSubView.swift
//  Edutainment
//
//  Created by Khusain on 25.02.2024.
//

import SwiftUI

struct QuestionSubView: View {
    @EnvironmentObject var vm: EdutainmentViewModel
    
    var body: some View {
        Section() {
            HStack {
                Text(vm.questions[vm.currentIndex].text)
                    .animation(.spring, value: vm.range)
                    .animation(.spring, value: vm.numberOfQuestions)
                
                Spacer()
                
                TextField("", value: $vm.userAnswer, format: .number)
                    .frame(width: 38)
                    .keyboardType(.numberPad)
                    .onSubmit {
                        vm.checkUserAnswer()
                    }
                    .textFieldStyle(.roundedBorder)
            }
        } header: {
            Text("Вопрос № \(vm.currentIndex + 1)")
                .foregroundStyle(.white)
                .font(.headline)
        }
        .animation(.bouncy, value: vm.currentIndex)
    }
}

#Preview {
    QuestionSubView()
        .environmentObject(EdutainmentViewModel())
}
