//
//  ContentView.swift
//  Edutainment
//
//  Created by Khusain on 24.02.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = EdutainmentViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.red, .blue], startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            Form {
                SettingsSubView()
                    .environmentObject(vm)
                
                QuestionSubView()
                    .environmentObject(vm)
                
                CurrentAnswersSubView()
                    .environmentObject(vm)
            }
            .scrollContentBackground(.hidden)
            .alert("Игра завершена", isPresented: $vm.showingGameOver) {
                Button("Начать заново") {
                    vm.restartGame()
                }
            } message: {
                Text("Ваш счет: \(vm.currentAnswers)")
            }
        }
    }
}

#Preview {
    ContentView()
}
