//
//  VerticalBar.swift
//  TestSwiftUI
//
//  Created by Булат Хабибуллин on 07.05.2021.
//

import SwiftUI

struct VerticalBar: View {

        var body: some View {
            VStack {
                GeometryReader { geo in
                    VerticalSlider(
                        sliderHeight: geo.size.height
                    )
                }
//                Text("\(self.channelNumber + 1)")
//                    .font(.headline)
//                    .frame(height: 10.0)
//                    .padding(.bottom)
               
            }
        }
}

//struct VerticalBar_Previews: PreviewProvider {
//    static var previews: some View {
//        VerticalBar()
//    }
//}
