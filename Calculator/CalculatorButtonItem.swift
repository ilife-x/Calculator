//
//  CalculatorButtonItem.swift
//  Calculator
//
//  Created by xiao on 2020/11/27.
//

import Foundation
import SwiftUI

enum CalculatorButtonItem {
    
    enum Op:String {
        case plus = "+"
        case minum = "-"
        case multiply = "×"
        case divide = "÷"
        case equal = "="
    }
    
    enum Command:String {
        case clear = "AC"
        case persent = "%"
        case flip = "+/-"
    }
    
    //将键盘元素分为四大类,每一个类又有多中情况,用enum
    case digit(Int)//关联值,Int类型0_9
    case dot//小数点
    case op(Op)//操作符
    case command(Command)//命令操作
}

extension CalculatorButtonItem{
    var title :String {
        switch self {
        case .digit(let value):return String(value)
        case .dot : return "."
        case .op(let op) :return op.rawValue
        case .command(let command) :return command.rawValue
        
        }

    }
    var size: CGSize {
        if case .digit(let value) = self,value == 0 {
            return CGSize(width: 88 * 2.2, height: 88)
        }
        return CGSize(width: 88, height: 88)

    }
    


    var backGroundColorName:String{
        switch self {
        case .digit,.dot:return "digitBackground"
        case .op:return "operatorBackground"
        case .command:return "commandBackground"

        }
    }
  
}


//“CalculatorButtonItem 是不遵守 Identifiable 的。为了解决这个问题，我们可以为 CalculatorButtonItem 加上 Hashable”
extension CalculatorButtonItem :Hashable{}
