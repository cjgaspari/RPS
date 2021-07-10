//
//  ContentView.swift
//  RPS
//
//  Created by Trevor Maltbie on 7/4/21.
//

import SwiftUI

struct ContentView: View {
    
    enum GameMove: String, CaseIterable {
        case rock = "rock"
        case paper = "paper"
        case scissors = "scissors"
    }
    
    var gameMoves: [GameMove] = [.rock, .paper, .scissors]
    var userMove: GameMove = .rock
    
    @State private var appChooses = Int.random(in: 0 ..< 3)
    @State private var shouldWin = Bool.random()
    @State private var score: Int = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30 ) {
                
                Text("\(score)")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.yellow)
                
                Text("\(gameMoves[appChooses].rawValue.capitalized)")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(.yellow)

                shouldWin ? Text("Try to Win").font(.title).foregroundColor(.yellow) : Text("Try to Lose").font(.title).foregroundColor(.yellow)
                    
                
                    VStack {
                    ForEach(0 ..< 3) { number in
                        Button(action: {
                            self.answerTapped(computerMove: gameMoves[appChooses], userMove: gameMoves[number])
                            self.newGame()
                        }) {
                            Text("\(gameMoves[number].rawValue.capitalized)")
                                .padding()
                                .background(Color.yellow)
                                .foregroundColor(.black)
                                .font(.title)
                                .clipShape(Capsule())
                        }
                    }
                }
            }
        }
    }
    func answerTapped(computerMove: GameMove, userMove: GameMove) {

        print("should win? \(shouldWin)")

        if (shouldWin) {
            if (computerMove == .rock) && (userMove == .paper) {
                self.score += 1
            } else if (computerMove == .paper) && (userMove == .scissors) {
                self.score += 1
            } else if (computerMove == .scissors) && (userMove == .rock) {
                self.score += 1
            } else {
                self.score -= 1
            }
        } else if (!shouldWin) {
            if (computerMove == .rock) && (userMove == .scissors) {
                self.score += 1
            } else if (computerMove == .paper) && (userMove == .rock) {
                self.score += 1
            } else if (computerMove == .scissors) && (userMove == .paper) {
                self.score += 1
            } else {
                self.score -= 1
            }
        }
    }
    
    func newGame() {
        self.shouldWin = Bool.random()
        self.appChooses = Int.random(in: 0 ..< 3)
    }
        //        switch userMove, computerMove {
        //        }
}
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
