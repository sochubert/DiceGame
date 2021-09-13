//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Minjae Lee on 2021/09/13.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber = 1 // State를 적어주어 변수를 업데이트하고 ContentView를 recreate함.
    @State var rightDiceNumber = 1
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea(.all)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                    if leftDiceNumber == rightDiceNumber {
                        self.showingAlert = true
                    }
                })
                {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Congratulation!"),
                          message: Text("You got a same number."),
                          dismissButton: .default(Text("Got it!"))
                    )
                }

            }
        }
    }
}

struct DiceView: View {
    
    let n: Int
    
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
