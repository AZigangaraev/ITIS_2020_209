//
//  AmongUsMiniGame.swift
//  TestSwiftUI
//
//  Created by Teacher on 04.05.2021.
//

import SwiftUI

struct AmongUsMiniGame: View {
    @State var value1: CGFloat = 0.5
	@State var value2: CGFloat = 0.5
	@State var value3: CGFloat = 0.5
	@State var value4: CGFloat = 0.5
	@State var value5: CGFloat = 0.5

	private let const1: CGFloat = CGFloat.random(in: 0...1)
	private let const2: CGFloat = CGFloat.random(in: 0...1)
	private let const3: CGFloat = CGFloat.random(in: 0...1)
	private let const4: CGFloat = CGFloat.random(in: 0...1)
	private let const5: CGFloat = CGFloat.random(in: 0...1)

	@State private var isAlert = false

    var body: some View {
        VStack {
			let first = abs(value1 - const1) / 5
			let second = abs(value2 - const2) / 5
			let third = abs(value3 - const3) / 5
			let fourth = abs(value4 - const4) / 5
			let fifth = abs(value5 - const5) / 5

			let sum = first + second + third + fourth + fifth
			let current = (1 - sum)
			VStack{
				Text("Value must be: 100.000")
				Text("Value is \(100 * current)")
			}
			VStack {
				ZStack(alignment: .leading) {
					Rectangle().frame(width: UIScreen.main.bounds.width * 0.95,
									  height: 30,
									  alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
					Rectangle().fill(Color.yellow)
						.frame(width: UIScreen.main.bounds.width * 0.95 * const1,
									  height: 30,
									  alignment: .center)

				}
				ZStack(alignment: .leading) {
					Rectangle().frame(width: UIScreen.main.bounds.width * 0.95,
									  height: 30,
									  alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
					Rectangle().fill(Color.yellow)
						.frame(width: UIScreen.main.bounds.width * 0.95 * const2,
									  height: 30,
									  alignment: .center)

				}
				ZStack(alignment: .leading) {
					Rectangle().frame(width: UIScreen.main.bounds.width * 0.95,
									  height: 30,
									  alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
					Rectangle().fill(Color.yellow)
						.frame(width: UIScreen.main.bounds.width * 0.95 * const3,
									  height: 30,
									  alignment: .center)

				}
				ZStack(alignment: .leading) {
					Rectangle().frame(width: UIScreen.main.bounds.width * 0.95,
									  height: 30,
									  alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
					Rectangle().fill(Color.yellow)
						.frame(width: UIScreen.main.bounds.width * 0.95 * const4,
									  height: 30,
									  alignment: .center)

				}
				ZStack(alignment: .leading) {
					Rectangle().frame(width: UIScreen.main.bounds.width * 0.95,
									  height: 30,
									  alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
					Rectangle().fill(Color.yellow)
						.frame(width: UIScreen.main.bounds.width * 0.95 * const5,
									  height: 30,
									  alignment: .center)

				}
			}

			VStack {
				HStack {
					Text("0")
					Slider(value: $value1)
					Text("1")
				}
				HStack {
					Text("0")
					Slider(value: $value2)
					Text("1")
				}
				HStack {
					Text("0")
					Slider(value: $value3)
					Text("1")
				}
				HStack {
					Text("0")
					Slider(value: $value4)
					Text("1")
				}
				HStack {
					Text("0")
					Slider(value: $value5)
					Text("1")
				}
			}

			Button("Ok") {
				isAlert = true
			}
			.alert(isPresented: $isAlert) {
				let result = Int (100 * current)
				return Alert(
					title: Text("Value is \(result)"),
					message: nil,
					dismissButton: .cancel(Text("OK"), action: { isAlert = false })
				)
			}
        }
    }
}

struct AmongUsMiniGame_Previews: PreviewProvider {
    static var previews: some View {
        AmongUsMiniGame()
    }
}
