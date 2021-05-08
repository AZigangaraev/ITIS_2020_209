//
//  AmongUsMiniGame.swift
//  TestSwiftUI
//
//  Created by Teacher on 04.05.2021.
//

import SwiftUI

struct AmongUsMiniGame: View {
    @State var firstValue: Double = 0.5
    @State var secondValue: Double = 0.5
    @State var thirthValue: Double = 0.5
    @State var fourthValue: Double = 0.5

    @State var showAlert = false

    @State var firstRectangleWidth: CGFloat = CGFloat.random(in: 0...UIScreen.main.bounds.width - 20)
    @State var secondRectangleWidth: CGFloat = CGFloat.random(in: 0...UIScreen.main.bounds.width - 20)
    @State var thirthRectangleWidth: CGFloat = CGFloat.random(in: 0...UIScreen.main.bounds.width - 20)
    @State var fourthRectangleWidth: CGFloat = CGFloat.random(in: 0...UIScreen.main.bounds.width - 20)

    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading) {
                ZStack(alignment: .leading) {
                    Rectangle().foregroundColor(.gray)
                    Rectangle().foregroundColor(.orange).frame(width: firstRectangleWidth)
                }
                ZStack(alignment: .leading) {
                    Rectangle().foregroundColor(.gray)
                    Rectangle().foregroundColor(.orange).frame(width: secondRectangleWidth)
                }
                ZStack(alignment: .leading) {
                    Rectangle().foregroundColor(.gray)
                    Rectangle().foregroundColor(.orange).frame(width: thirthRectangleWidth)
                }
                ZStack(alignment: .leading) {
                    Rectangle().foregroundColor(.gray)
                    Rectangle().foregroundColor(.orange).frame(width: fourthRectangleWidth)
                }
            }

            Slider(value: $firstValue)
            Slider(value: $secondValue)
            Slider(value: $thirthValue)
            Slider(value: $fourthValue)
            Button(action: {
                self.showAlert = true
            }, label: {
                Text("OK")
            }).padding(20)
            .alert(isPresented: $showAlert) {
              Alert(title: Text("Your Score"), message: Text("\(checkValues())"))
            }
        }.padding(.horizontal, 10)
    }

    private func checkValues() -> Int {
        let score: Int = 100
        let screenWidth = Double(UIScreen.main.bounds.width - 20)
        let value = abs(Double(firstRectangleWidth) - firstValue * screenWidth) + abs(Double(secondRectangleWidth) - secondValue * screenWidth) + abs(Double(thirthRectangleWidth) - thirthValue * screenWidth) + abs(Double(fourthRectangleWidth) - fourthValue * screenWidth)
        return score - Int(value)
    }
}

struct AmongUsMiniGame_Previews: PreviewProvider {
    static var previews: some View {
        AmongUsMiniGame()
    }
}
