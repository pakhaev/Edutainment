//
//  EdutainmentViewModel.swift
//  Edutainment
//
//  Created by Khusain on 24.02.2024.
//

import SwiftUI

class EdutainmentViewModel: ObservableObject {
    @Published var questions: [Question] = []
    @Published var range: Int
    @Published var numberOfQuestions = 3
    
    @Published var userAnswer = 0
    
    @Published var currentIndex = 0
    @Published var currentAnswers = 0
    
    @Published var showingGameOver = false
    
    let rangeNumbers = 6..<21
    let lowerRangedBound = 2
    
    init() {
        range = rangeNumbers.lowerBound
        
        generateQuestions()
    }
    
    func generateQuestions() {
        questions.removeAll()
        
        for _ in 0..<numberOfQuestions {
            let num1 = Int.random(in: lowerRangedBound...range)
            let num2 = Int.random(in: lowerRangedBound...range)
            let questionText = "Что получится при \(num1) x \(num2)?"
            let answer = num1 * num2
            
            let question = Question(text: questionText, correctAnswer: answer)
            questions.append(question)
        }
    }
    
    func checkUserAnswer() {
        if userAnswer == questions[currentIndex].correctAnswer {
            currentAnswers += 1
        }
        
        if currentIndex + 1 < questions.count {
            currentIndex += 1
            print(questions.count)
            print(currentIndex)
            userAnswer = 0
        } else {
            showingGameOver.toggle()
        }
        
    }
    
    func restartGame() {
        withAnimation {
            currentIndex = 0
            currentAnswers = 0
            userAnswer = 0
            generateQuestions()
        }
    }
    
}
