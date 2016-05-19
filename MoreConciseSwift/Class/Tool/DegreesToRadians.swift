//
//  DegreesToRadians.swift
//  MoreConciseSwift
//
//  Created by Corotata on 16/5/19.
//  Copyright © 2016年 Corotata. All rights reserved.
//

import UIKit

let π = CGFloat(M_PI)

///将角度转弧度
func DegreesToRadians (value:CGFloat) -> CGFloat {
    return value * π / 180.0
}

//将弧度转角度
func RadiansToDegrees (value:CGFloat) -> CGFloat {
    return value * 180.0 / π
}