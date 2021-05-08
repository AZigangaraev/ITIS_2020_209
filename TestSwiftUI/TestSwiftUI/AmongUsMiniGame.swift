//
//  AmongUsMiniGame.swift
//  TestSwiftUI
//
//  Created by Teacher on 04.05.2021.
//

import SwiftUI

struct AmongUsMiniGame: View {
    private let count: Int
    private let requiredValues: [Double]
    @State private var sliderValues: [Double]
    @State private var isAlertShown: Bool = false

    init(count: Int) {
        let count = max(count, 1)
        self.count = count
        requiredValues = (1...count).map { _ in Double.random(in: 0.0...1.0) }
        sliderValues = .init(repeating: 0.5, count: count)
    }

    private var score: Int {
        var sum = 0.0
        for i in 0..<count {
            sum += 1 - abs(requiredValues[i] - sliderValues[i])
        }
        let totalResult = sum / Double(count) * 100
        return Int(totalResult.rounded())
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(requiredValues, id: \.self) { value in
                    GeometryReader { geometry in
                        HStack(spacing: 0) {
                            Rectangle()
                                .frame(width: geometry.size.width * CGFloat(value))
                                .foregroundColor(.blue)
                            Rectangle()
                                .frame(width: geometry.size.width * CGFloat(1 - value))
                                .foregroundColor(.gray)
                        }
                    }.frame(height: 40)
                }

                ForEach(sliderValues.indices, id: \.self) { index in
                    Slider(value: $sliderValues[index])
                }

                Button("Check") {
                    isAlertShown = true
                }.alert(isPresented: $isAlertShown) {
                    Alert(title: Text("Your score is \(score)"))
                }
            }.padding()
        }
    }
}

struct AmongUsMiniGame_Previews: PreviewProvider {
    static var previews: some View {
        AmongUsMiniGame(count: 5)
    }
}
