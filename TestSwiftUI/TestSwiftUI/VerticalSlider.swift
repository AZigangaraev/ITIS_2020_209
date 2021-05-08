//
//  VerticalSlider.swift
//  TestSwiftUI
//
//  Created by Булат Хабибуллин on 07.05.2021.
//

import SwiftUI

struct VerticalSlider: View {

    @State var sliderHeight: CGFloat
    @State var value: Double = 0.5
    
    var body: some View {
            Slider(
                value: $value
            ).rotationEffect(.degrees(-90.0), anchor: .topLeading)
            .frame(width: sliderHeight)
            .offset(y: sliderHeight )
        }
}

//struct VerticalSlider_Previews: PreviewProvider {
//    static var previews: some View {
//        VerticalSlider()
//    }
//}
