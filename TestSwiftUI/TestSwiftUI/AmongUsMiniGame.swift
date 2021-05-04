//
//  AmongUsMiniGame.swift
//  TestSwiftUI
//
//  Created by Teacher on 04.05.2021.
//

import SwiftUI

struct AmongUsMiniGame: View {
    @State var value: Double = 0.5

    var body: some View {
        VStack {
            Text("Value is \(value)")

            HStack {
                Text("0")
                Slider(value: $value)
                Text("1")
            }
        }
    }
}

struct AmongUsMiniGame_Previews: PreviewProvider {
    static var previews: some View {
        AmongUsMiniGame()
    }
}
