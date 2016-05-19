//
//  ViewController.swift
//  MoreConciseSwift
//
//  Created by Corotata on 16/5/9.
//  Copyright © 2016年 Corotata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fun2()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //快速画内5连形
    func fun1(){
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 100,y: 100,width: 100,height: 100)
        view.addSubview(imageView)
        
        UIGraphicsBeginImageContextWithOptions(imageView.frame.size, false, 0)
        
        
        let path = UIBezierPath.coro_InputerPolygon(divideCount: 4, radius: 50)
        UIColor.blueColor().set()
        path.stroke()
        
        
        let currentImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        imageView.image = currentImage
    }
    
    //快速画内多边形
    func fun2(){
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 100,y: 100,width: 100,height: 100)
        view.addSubview(imageView)
        
        UIGraphicsBeginImageContextWithOptions(imageView.frame.size, false, 0)
        
        let path = UIBezierPath.coro_OuterPolygon(divideCount: 5, radius: 30)
        
        UIColor.blueColor().set()
        path.stroke()
        path.closePath()
        
        let currentImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        imageView.image = currentImage
    }

    
    
}

