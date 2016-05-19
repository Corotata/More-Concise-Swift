//
//  UIGraphicsCalculators.swift
//  MoreConciseSwift
//
//  Created by Corotata on 16/5/19.
//  Copyright © 2016年 Corotata. All rights reserved.
//

import UIKit


//计算一个圆上某个点的坐标位置
func calcCircleCoordinate(center:CGPoint,angle:CGFloat,radius:CGFloat) -> CGPoint{
    let x2 = radius * CGFloat(cosf(Float(angle)*Float(M_PI)/Float(180.0)))
    let y2 = radius * CGFloat(sinf(Float(angle)*Float(M_PI)/Float(180.0)))
    return CGPoint(x: center.x+x2, y: center.y-y2);
}


func calcDivideCircleCoordinates(divideCount:Int,center:CGPoint, radius:CGFloat,startPointAngle:CGFloat = -90) -> [CGPoint]{
    let meanAngle:CGFloat = 360.0/CGFloat(divideCount)
    var points = [CGPoint]()
    for i in 0..<divideCount{
        let pointAngle = meanAngle * CGFloat(i)-startPointAngle
        let point = calcCircleCoordinate(CGPoint(x:radius, y: radius), angle: pointAngle, radius: radius)
        points.append(point)
    }
    return points
}

