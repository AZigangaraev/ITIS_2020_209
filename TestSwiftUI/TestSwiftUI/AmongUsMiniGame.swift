//
//  AmongUsMiniGame.swift
//  TestSwiftUI
//
//  Created by Teacher on 04.05.2021.
//

import SwiftUI

struct AmongUsMiniGame: View {
    @State var sliderValues = [0.5,
                               0.5,
                               0.5]

    @State var state = false
    @State var result = 0.0

    let width = UIScreen.main.bounds.width - 20
    let height = UIScreen.main.bounds.height
    let widthConstants = [Double.random(in: 0...1),
                          Double.random(in: 0...1),
                          Double.random(in: 0...1)]

    var body: some View {
        VStack(alignment: .center,
               spacing: width / 25) {

            VStack {
                Text("Among uss")
                    .font(.title)
                Text("by Nikita Sosyuk")
                    .font(.footnote)
            }

            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: width,
                           height: height / 10)
                Rectangle()
                    .fill(Color.black)
                    .frame(width: width * CGFloat(widthConstants[0]),
                           height: height / 10)
            }

            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: width,
                           height: height / 10)
                Rectangle()
                    .fill(Color.black)
                    .frame(width: width * CGFloat(widthConstants[1]),
                           height: height / 10)
            }

            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: width,
                           height: height / 10)
                Rectangle()
                    .fill(Color.black)
                    .frame(width: width * CGFloat(widthConstants[2]),
                           height: height / 10)
            }

            Text("Try to copy!")
                .font(.title2)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                .background(Rectangle().fill(Color.orange))
                .clipShape(Capsule())

            VStack(alignment: .center, spacing: 10) {
                Slider(value: $sliderValues[0])
                Slider(value: $sliderValues[1])
                Slider(value: $sliderValues[2])
            }

            Button(action: {
                var result = 0.0
                for value in sliderValues.enumerated() {
                    result += abs(value.element - widthConstants[value.offset])
                }
                result = (1 - (result / Double(sliderValues.count))) * 100

                self.result = result
                self.state = true
            }, label: {
                Text("Submit")
            })
            .font(.title3)
            .alert(isPresented: $state) {
                Alert(title: Text("Your score in \(result)"))
            }


        }
    }
}

struct AmongUsMiniGame_Previews: PreviewProvider {
    static var previews: some View {
        AmongUsMiniGame()
    }
}
