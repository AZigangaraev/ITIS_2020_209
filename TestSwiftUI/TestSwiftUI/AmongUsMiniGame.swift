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
    @State var thirdValue: Double = 0.5

    @State var viewWidth = UIScreen.main.bounds.width - 20
    @State var firstRectangleWidth: CGFloat = CGFloat.random(in: 0...1)
    @State var secondRectangleWidth: CGFloat = CGFloat.random(in: 0...1)
    @State var thirdRectangleWidth: CGFloat = CGFloat.random(in: 0...1)

    @State var showAlert = false

    var body: some View {
        VStack(alignment: .center, spacing: 30, content: {
            VStack(alignment: .leading, spacing: 30, content: {
                ZStack(alignment: .leading, content: {
                    Rectangle().foregroundColor(.yellow).frame(width: viewWidth, height: 50, alignment: .leading)
                    Rectangle().foregroundColor(.black).frame(width: firstRectangleWidth * viewWidth, height: 50, alignment: .leading)
                })

                ZStack(alignment: .leading, content: {
                    Rectangle().foregroundColor(.yellow).frame(width: viewWidth, height: 50, alignment: .leading)
                    Rectangle().foregroundColor(.black).frame(width: secondRectangleWidth * viewWidth, height: 50, alignment: .leading)
                })

                ZStack(alignment: .leading, content: {
                    Rectangle().foregroundColor(.yellow).frame(width: viewWidth, height: 50, alignment: .leading)
                    Rectangle().foregroundColor(.black).frame(width: thirdRectangleWidth * viewWidth, height: 50, alignment: .leading)
                })
                HStack {
                    Text("0")
                    Slider(value: $firstValue)
                    Text("1")
                }

                HStack {
                    Text("0")
                    Slider(value: $secondValue)
                    Text("1")
                }

                HStack {
                    Text("0")
                    Slider(value: $thirdValue)
                    Text("1")
                }
            })

            HStack(alignment: .center, spacing: nil, content: {
                Button(action: {
                    self.showAlert = true
                }, label: {
                    Text("OK")
                }).alert(isPresented: $showAlert) {
                    Alert(title: Text("Total Score :"), message: Text("\(countPoints())"))
                }
            })
        })
    }

    private func countPoints() -> Double {
        let value = abs(Double(firstRectangleWidth) - firstValue) + abs(Double(secondRectangleWidth) - secondValue) + abs(Double(thirdRectangleWidth) - thirdValue)
        return (1 - (value / 3)) * 100
    }
}

struct AmongUsMiniGame_Previews: PreviewProvider {
    static var previews: some View {
        AmongUsMiniGame()
    }
}
