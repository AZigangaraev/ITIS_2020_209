//
//  TestSwiftUIApp.swift
//  TestSwiftUI
//
//  Created by Teacher on 04.05.2021.
//

import SwiftUI

@main
struct TestSwiftUIApp: App {
	var body: some Scene {
		WindowGroup {
			//            ContentView()
			let n = 10
			let data = getRandom(n: n)
			AmongUsMiniGame(values: data.0, results: data.1)
		}
	}

	func getRandom(n: Int) -> ([Double], [Double]) {
		var values: [Double] = []
		var results: [Double] = []
		for _ in 1...5 {
			values.append(Double.random(in: 0...1))
			results.append(0.5)
		}
		return (values, results)
	}
}
