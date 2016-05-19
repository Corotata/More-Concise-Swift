//
//  UIImage+CoreExtension.swift
//  MoreConciseSwift
//
//  Created by Corotata on 16/5/19.
//  Copyright © 2016年 Corotata. All rights reserved.
//

import UIKit
import ImageIO
extension UIImage{

    //提供将GIF图分解出来成多张PNG的方法
    func saveImagesFromGif(data:NSData,fileName:String,saveDocumentPath:NSString){
        let source = CGImageSourceCreateWithData(data, nil)
        let count = CGImageSourceGetCount(source!)
        if count>=1 {
            for i in 0..<count{
                let image = CGImageSourceCreateImageAtIndex(source!, i, nil)
                let saveFilePath = "\(saveDocumentPath)/fileName\(i).png"
                let data = UIImagePNGRepresentation(UIImage(CGImage: image!))
                data!.writeToFile(saveFilePath, atomically: true)
            }
        }
    }
    
    
    //提供显示GIF图的方法
    func animatedGif(data:NSData)->UIImage{
        let source = CGImageSourceCreateWithData(data, nil)
        let count = CGImageSourceGetCount(source!)
        var animatedImage :UIImage
        if count<=1 {
            animatedImage = UIImage(data: data)!
        }else{
            var images = [UIImage]()
            var duration = 0.0
            for i in 0..<count{
                let image = CGImageSourceCreateImageAtIndex(source!, i, nil)
                images .append(UIImage(CGImage: image!, scale:UIScreen.mainScreen().scale , orientation: UIImageOrientation.Up))
            }
            duration = (1.0 / 10.0) * Double(count);
            animatedImage = UIImage.animatedImageWithImages(images, duration: duration)!
        }
        return animatedImage;
        
    }


}