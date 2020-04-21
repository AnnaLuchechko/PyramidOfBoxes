//
//  ViewController.swift
//  PyramidOfBoxes
//
//  Created by Anna Luchechko on 20.04.2020.
//  Copyright © 2020 Anna Luchechko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let boxCount = 5    // 5 is for example. Enter your number.
        
        let widthScreenSide: CGFloat = view.frame.width
        let heightScreenSide: CGFloat = view.frame.height
    
        let boxSize: CGSize = getBoxSizeAndInterval(widthScreenSide: widthScreenSide,boxCount: boxCount)

        let origin: CGPoint = getBoxOrigin(widthScreenSide: widthScreenSide,
                                           heightScreenSide: heightScreenSide,
                                           interval: boxSize.height)
        
        drawLineOfBoxes(boxCount: boxCount, boxSize: boxSize, origin: origin)
    }

    func getBoxSizeAndInterval(widthScreenSide:CGFloat, boxCount:Int) -> CGSize {
        let divider = boxCount + 1
        let boxSize = widthScreenSide / CGFloat(divider)
        let interval = boxSize / CGFloat(divider)
        
        return CGSize(width: boxSize, height: interval)
    }
    
    func getBoxOrigin(widthScreenSide:CGFloat, heightScreenSide:CGFloat, interval: CGFloat) -> CGPoint {
        let topSpace = (heightScreenSide - widthScreenSide) / 2
        var yOrigin = topSpace + widthScreenSide
        
        if (yOrigin + (interval * 2) > heightScreenSide) {
            yOrigin -= interval
        }
        let xOrigin = interval
        
        return CGPoint(x: xOrigin, y: yOrigin)
    }
    
    func drawBox(boxSize: CGSize, origin: CGPoint) {
        let box = UIView()
        box.frame.size.width = boxSize.width
        box.frame.size.height = boxSize.width
        box.frame.origin.x = origin.x
        box.frame.origin.y = origin.y
        box.backgroundColor = .magenta
        self.view.addSubview(box)
    }
    
    func drawLineOfBoxes(boxCount: Int, boxSize: CGSize, origin: CGPoint) {
        var boxDrawCount = 0
        var newOrigin: CGPoint = origin
        
        while boxDrawCount < boxCount {
            drawBox(boxSize: boxSize, origin: newOrigin)
            boxDrawCount += 1
            newOrigin.x += boxSize.height + boxSize.width
        }
    }

}

