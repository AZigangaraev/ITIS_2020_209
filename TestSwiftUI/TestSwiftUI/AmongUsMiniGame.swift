//
//  AmongUsMiniGame.swift
//  TestSwiftUI
//
//  Created by Teacher on 04.05.2021.
//

import SwiftUI

struct AmongUsMiniGame: View {
    
    
    //    var body: some View {
    //        VStack {
    //            Text("Value is \(value)")
    //
    //            ForEach((0...9), id: \.self) { _ in
    //            HStack {
    //                Text("0")
    //                Slider(value: $value)
    //                Text("1")
    //            }
    //            }
    //        }
    //    }
    
    //  MARK: Пытался сделать вертикально
    
    //    @State var showAlert = false
    //    var body: some View{
    //        VStack {
    //            HStack {
    //                Spacer(minLength: 15.0)
    //                ZStack{
    //                    Rectangle()
    //                    Rectangle().foregroundColor(.gray)
    //                }
    //                ZStack{
    //                Rectangle()
    //                }
    //                ZStack{
    //                Rectangle()
    //                }
    //                ZStack{
    //                Rectangle()
    //                }
    //                Spacer(minLength: 15.0)
    //            }
    //    HStack {
    //       Spacer(minLength: 45.0)
    //        VerticalBar()
    //        VerticalBar()
    //        VerticalBar()
    //        VerticalBar()
    //        Spacer(minLength: 5.0)
    //
    //        Button(action: {
    //                             self.showAlert = true
    //                         }, label: {
    //                             Text("OK")
    //                         }).padding(20)
    //                         .alert(isPresented: $showAlert) {
    //                           Alert(title: Text("Your Score"), message: Text(""))
    //                         }
    //
    //                     }
    //    }
    //    }
    //    }
    
    //  MARK: Горизонтально
    
    @State var value1: Double = 0.5
    @State var value2: Double = 0.5
    @State var value3: Double = 0.5
    @State var value4: Double = 0.5
    
    @State var showAlert = false
    
    @State var randomWidth1: CGFloat = CGFloat.random(in: 0...UIScreen.main.bounds.width - 20)
    @State var randomWidth2: CGFloat = CGFloat.random(in: 0...UIScreen.main.bounds.width - 20)
    @State var randomWidth3: CGFloat = CGFloat.random(in: 0...UIScreen.main.bounds.width - 20)
    @State var randomWidth4: CGFloat = CGFloat.random(in: 0...UIScreen.main.bounds.width - 20)
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            ZStack(alignment: .leading) {
                Rectangle().foregroundColor(.black).frame(width: UIScreen.main.bounds.width, height: 50)
                Rectangle().foregroundColor(.green).frame(width: randomWidth1, height: 50)
            }
            ZStack(alignment: .leading) {
                Rectangle().foregroundColor(.black).frame(width: UIScreen.main.bounds.width, height: 50)
                Rectangle().foregroundColor(.green).frame(width: randomWidth2, height: 50)
            }
            ZStack(alignment: .leading) {
                Rectangle().foregroundColor(.black).frame(width: UIScreen.main.bounds.width, height: 50)
                Rectangle().foregroundColor(.green).frame(width: randomWidth3, height: 50)
            }
            ZStack(alignment: .leading) {
                Rectangle().foregroundColor(.black).frame(width: UIScreen.main.bounds.width, height: 50)
                Rectangle().foregroundColor(.green).frame(width: randomWidth4, height: 50)
            }
            
            Slider(value: $value1)
            Slider(value: $value2)
            Slider(value: $value3)
            Slider(value: $value4)
            Button(action: {
                self.showAlert = true
            }, label: {
                Text("OK")
            }).padding(20)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Your Score"), message: Text("\(checkValues())"))
            }
            
        }
    }
    
    private func checkValues() -> Int {
        let points: Int = 100
        let screenWidth = Double(UIScreen.main.bounds.width)
        let value = abs(Double(randomWidth1) - value1 * screenWidth) + abs(Double(randomWidth2) - value2 * screenWidth) + abs(Double(randomWidth3) - value3 * screenWidth) + abs(Double(randomWidth4) - value4 * screenWidth)
        return points - Int(value)
    }
}

struct AmongUsMiniGame_Previews: PreviewProvider {
    static var previews: some View {
        AmongUsMiniGame()
        
    }
}
