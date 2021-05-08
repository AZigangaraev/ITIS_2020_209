//
//  AmongUsMiniGame.swift
//  TestSwiftUI
//
//  Created by Teacher on 04.05.2021.
//

import SwiftUI

struct AmongUsMiniGame: View {
    var mainWidth = UIScreen.main.bounds.width - 44

    var firstViewValue: CGFloat = CGFloat.random(in: 0...1)
    var secondViewValue: CGFloat = CGFloat.random(in: 0...1)
    var thirdViewValue: CGFloat = CGFloat.random(in: 0...1)
    var fourthViewValue: CGFloat = CGFloat.random(in: 0...1)

    @State var firstSliderValue: Double = 0.5
    @State var secondSliderValue: Double = 0.5
    @State var thirdSliderValue: Double = 0.5
    @State var fourthSliderValue: Double = 0.5

    @State var alertIsShown: Bool = false
    @State var points = 0

    var body: some View {
        VStack(spacing: 35) {
            ZStack(alignment: .leading) {
                Rectangle().fill(Color.yellow).frame(width: mainWidth, height: 50)
                Rectangle().fill(Color.blue).frame(width: mainWidth * firstViewValue, height: 50)
            }
            ZStack(alignment: .leading) {
                Rectangle().fill(Color.yellow).frame(width: mainWidth, height: 50)
                Rectangle().fill(Color.blue).frame(width: mainWidth * secondViewValue, height: 50)
            }
            ZStack(alignment: .leading) {
                Rectangle().fill(Color.yellow).frame(width: mainWidth, height: 50)
                Rectangle().fill(Color.blue).frame(width: mainWidth * thirdViewValue, height: 50)
            }
            ZStack(alignment: .leading) {
                Rectangle().fill(Color.yellow).frame(width: mainWidth, height: 50)
                Rectangle().fill(Color.blue).frame(width: mainWidth * fourthViewValue, height: 50)
            }
            Slider(value: $firstSliderValue).frame(width: mainWidth)
            Slider(value: $secondSliderValue).frame(width: mainWidth)
            Slider(value: $thirdSliderValue).frame(width: mainWidth)
            Slider(value: $fourthSliderValue).frame(width: mainWidth)
            Button("Check!") {
                points = 100
                points = points - Int((abs(firstSliderValue - Double(firstViewValue))) * 80)
                points = points - Int((abs(secondSliderValue - Double(secondViewValue))) * 80)
                points = points - Int((abs(thirdSliderValue - Double(thirdViewValue))) * 80)
                points = points - Int((abs(fourthSliderValue - Double(fourthViewValue))) * 80)
                points = points < 0 ? 0 : points
                alertIsShown = true
            }.alert(isPresented: $alertIsShown, content: {
                Alert(title: Text("\(points)"), dismissButton: Alert.Button.cancel({
                    alertIsShown = false
                }))
            })
        }
    }
}

struct AmongUsMiniGame_Previews: PreviewProvider {
    static var previews: some View {
        AmongUsMiniGame()
    }
}
