//
//  AmongUsMiniGame.swift
//  TestSwiftUI
//
//  Created by Teacher on 04.05.2021.
//

import SwiftUI

struct AmongUsMiniGame: View {
	@State var values: [Double] = [0.5, 0.5]
	@State var results: [Double] = [0.5, 0.5]
	@ObservedObject var alertHider: AlertHider = AlertHider()
	@State private var showingAlert = false
	@State private var result: Int = 0

	var body: some View {
		VStack {
			VStack {
				ForEach(0..<values.count, id: \.self) { idx in
					GeometryReader { geometry in
						HStack(spacing: 0) {
							Rectangle().fill(Color.yellow).frame(width: geometry.size.width * CGFloat(values[idx]))
							Rectangle().fill(Color.gray).frame(width: geometry.size.width * CGFloat(1 - values[idx]))
						}
					}
					//                    .frame(height: 50)
				}
				ForEach(0..<values.count, id: \.self) { idx in
					Slider(value: $results[idx])
				}
			}.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))

			Button("Check!") {
				showingAlert = true
				var sum = 0.0
				for i in 0..<values.count {
					sum += min(values[i], results[i]) / max(values[i], results[i])
				}
				result = Int((sum / Double(values.count)) * 100)
			}
			.alert(isPresented: $showingAlert) {
				Alert(
					title: Text("Your score in \(result)"),
					message: nil,
					dismissButton: .default(Text("OK"))
				)
			}.padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
		}

	}
}

struct AmongUsMiniGame_Previews: PreviewProvider {
	@State var values1: [Double] = [0]
	static var previews: some View {

		AmongUsMiniGame(values: [0, 0.5])
	}

}
