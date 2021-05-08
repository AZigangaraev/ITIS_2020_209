//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by Teacher on 04.05.2021.
//

import SwiftUI

struct ContentView: View {
    static let sliderCount = 6

    @State var sliderValues = (0..<sliderCount).map { _ in CGFloat(0.5) }
    var targets = (0..<sliderCount).map { _ in CGFloat.random(in: 0...1) }

    @State var showingAlert = false
    @State var score = 0.0

    var body: some View {
        VStack {
            Spacer()

            ForEach((0..<ContentView.sliderCount).reversed(), id: \.self) { idx in
                TargetSlider(targetValue: targets[idx])
                    .frame(height: 40)
            }

            ForEach((0..<ContentView.sliderCount).reversed(), id: \.self) { idx in
                HStack {
                    Text("0")
                    Slider(value: $sliderValues[idx])
                    Text("1")
                }
            }

            Button(action: proceed) {
                Text("Proceed")
            }

            Spacer()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Alert"), message: Text("Score \(score)"), dismissButton: .default(Text("Got it!")))
        }
    }

    func proceed() {
        var difference = 0.0

        for idx in 0..<ContentView.sliderCount {
            difference += Double(abs(targets[idx] - sliderValues[idx]))
        }

        self.score = round(100 - 100 * (difference / Double(ContentView.sliderCount)))
        self.showingAlert.toggle()
    }
}

struct TargetSlider: View {
    let targetValue: CGFloat

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Rectangle()
                    .fill(Color.gray)
                    .frame(
                        width: geometry.size.width * targetValue
                    )
                Rectangle()
                    .fill(Color.yellow)
                    .frame(
                        width: geometry.size.width * (1.0 - targetValue)
                    )
            }
        }
    }
}

struct ContenView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
