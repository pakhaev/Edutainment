//
//  SettingsSubView.swift
//  Edutainment
//
//  Created by Khusain on 25.02.2024.
//

import SwiftUI

struct SettingsSubView: View {
    @EnvironmentObject var vm: EdutainmentViewModel
    
    var body: some View {
        Section() {
            HStack {
                Text("Потренироваться в таблице от \(vm.lowerRangedBound) до \(vm.range)")
                    .animation(.bouncy, value: vm.range)
                Picker("Range", selection: $vm.range) {
                    ForEach(vm.rangeNumbers, id: \.self) { number in
                        Text("\(number)")
                            .tag(number)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 50, height: 100)
                .clipped()
            }
            .onChange(of: vm.range) {
                vm.restartGame()
            }
            
            HStack {
                Text("Кол-во вопросов")
                
                Stepper("\(vm.numberOfQuestions)", value: $vm.numberOfQuestions, in: 3...20)
                    .animation(.bouncy, value: vm.numberOfQuestions)
            }
            .onChange(of: vm.numberOfQuestions) {
                vm.restartGame()
            }
        } header: {
            Text("Настройки")
                .foregroundStyle(.white)
                .font(.headline)
        }
        
    }
}

#Preview {
    SettingsSubView()
        .environmentObject(EdutainmentViewModel())
}
