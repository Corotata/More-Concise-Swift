//
//  UIBezierPath+CoreExtension.swift
//  MoreConciseSwift
//
//  Created by Corotata on 16/5/19.
//  Copyright © 2016年 Corotata. All rights reserved.
//

import UIKit

extension UIBezierPath{
    //用于创建内多边形，参数divideCount必须大于4，只能绘制五边形以上的内多边形
    class func coro_OuterPolygon(startPointAngle:CGFloat = -90,divideCount:Int,radius:CGFloat) -> UIBezierPath{
        if divideCount < 5{
            let exception = NSException(name: "Error Parameters", reason: "the divideCount must > 4", userInfo: nil)
            exception.raise()
        }
        let path = UIBezierPath()
        
        let points = calcDivideCircleCoordinates(divideCount, center: CGPoint(x: radius,y: radius), radius: radius)
        
        for i in 0..<points.count{
            let point = points[i]
            path.moveToPoint(point)
            for j in 0..<points.count{
                let point2 = points[j]
                if(abs(j-i)==1 || abs(j-i) == points.count-1 || abs(j-i)==0 ){
                    
                }else{
                    path.addLineToPoint(point2)
                    path.moveToPoint(point)
                }
            }
            
            
        }
        return path
    }

    
    
    //用于创建外边形，参数divideCount必须大于3，只能绘制五边形以上的内多边形
    class func coro_InputerPolygon(startPointAngle:CGFloat = -90,divideCount:Int,radius:CGFloat) -> UIBezierPath{
        if divideCount < 3{
            let exception = NSException(name: "Error Parameters", reason: "the divideCount must > 3", userInfo: nil)
            exception.raise()
        }
        
        var startPoint :CGPoint?
        let meanAngle:CGFloat = 360.0/CGFloat(divideCount)
        let path = UIBezierPath()
        for i in 0..<divideCount{
            let pointAngle = meanAngle * CGFloat(i)-startPointAngle
            let point = calcCircleCoordinate(CGPoint(x:radius, y: radius), angle: pointAngle, radius: radius)
            if i == 0 {
                path.moveToPoint(point)
                startPoint = point
            }else{
                path.addLineToPoint(point)
                if(i == divideCount-1){
                    path.addLineToPoint(startPoint!)
                }
            }
        }
        return path
    }

}