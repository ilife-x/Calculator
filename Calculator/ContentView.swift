//
//  ContentView.swift
//  Calculator
//
//  Created by xiao on 2020/11/27.
//

import SwiftUI

struct ContentView: View {
    let scale: CGFloat = UIScreen.main.bounds.width / 414
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 12){
            Spacer()
            Text("0")
                .font(.system(size: 76))
                .frame(minWidth: 0, maxWidth: .infinity,  alignment: .trailing)
                .lineLimit(1)
                .padding(.trailing,24)
                .minimumScaleFactor(0.5)
            CalculatorButtonPad()
                .padding(.bottom)
                .padding(.trailing)
        }.scaleEffect(scale)

    }
    
    
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
//            ContentView().previewDevice("iPhone SE")
            

        }
    }
}

struct CalculatorButtonPad :View {
    var body: some View {
        
        let pad: [[CalculatorButtonItem]] = [
            [.command(.clear), .command(.flip),
            .command(.persent), .op(.divide)],
            [.digit(7), .digit(8), .digit(9), .op(.multiply)],
            [.digit(4), .digit(5), .digit(6), .op(.minum)],
            [.digit(1), .digit(2), .digit(3), .op(.plus)],
            [.digit(0), .dot, .op(.equal)]
            
        ]
        
        VStack(spacing: 8){
            ForEach(pad, id: \.self) { row in
                CalculatorButtonRow(row: row)
            }
        }
    }
}


struct CalculatorButtonRow :View {
    let row :[CalculatorButtonItem]
    var body: some View {
        HStack{
            //“ForEach 是 SwiftUI 中一个用来列举元素，并生成对应 View collection 的类型。它接受一个数组，且数组中的元素需要满足 Identifiable 协议。如果数组元素不满足 Identifiable，”
            
            ForEach(row, id: \.self) { item in
                CalculatorButton(
                    title: item.title,
                    size: item.size,
                    backGroundColorName: item.backGroundColorName) {
                    print("----")
                }
            }

        }
        
    }
}





struct CalculatorButton: View {
    let fontSize :CGFloat = 38
    let title:String
    let size :CGSize
    let backGroundColorName :String
    let action :()->Void

    var body: some View {
        Button.init(action: action, label: {
            //lable 接受一个闭包,是一个viewBuilder
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(.white)
                .frame(width: size.width, height: size.height)
                .background(Color(backGroundColorName))
                .cornerRadius(size.width/2)
                
        })
    }
}
