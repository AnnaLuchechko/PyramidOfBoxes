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
        
        drawPyramid(size: view.frame.size)
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        for view in self.view.subviews {    // Remove subviews while changing screen orientation
            view.removeFromSuperview()
        }
        
        drawPyramid(size: size)
    }
    
    func drawPyramid(size: CGSize) {
        let boxCount = 5    // 5 is for example. Enter your number
            
        let widthScreenSide: CGFloat = size.width
        let heightScreenSide: CGFloat = size.height
        
        let boxSize: CGSize = getBoxSizeAndInterval(widthScreenSide: widthScreenSide, heightScreenSide: heightScreenSide, boxCount: boxCount)
        let boxOrigin: CGPoint = getBoxOrigin(widthScreenSide: widthScreenSide,heightScreenSide: heightScreenSide,boxSize: boxSize)
        
        drawPyramidOfBoxes(boxCount: boxCount, boxSize: boxSize, origin: boxOrigin)
    }

    func getBoxSizeAndInterval(widthScreenSide:CGFloat, heightScreenSide:CGFloat, boxCount:Int) -> CGSize {
        let divider = boxCount + 1
        var boxSize = widthScreenSide / CGFloat(divider)
        
        if (widthScreenSide > heightScreenSide) {   // Landscape screen orientation
            boxSize = heightScreenSide / CGFloat(divider)
        }
        
        let interval = boxSize / CGFloat(divider)
        
        return CGSize(width: boxSize, height: interval)
    }
    
    func getBoxOrigin(widthScreenSide:CGFloat, heightScreenSide:CGFloat, boxSize: CGSize) -> CGPoint {
        let topSpace = (heightScreenSide - widthScreenSide) / 2
        var yOrigin = topSpace + widthScreenSide
        var xOrigin = boxSize.height
        
        if (widthScreenSide > heightScreenSide) {   // Landscape screen orientation
            yOrigin = heightScreenSide - boxSize.height
            xOrigin = (widthScreenSide - heightScreenSide) / 2 + boxSize.height
        }
        
        if (yOrigin + boxSize.width > heightScreenSide) {
            yOrigin -= boxSize.width
        }

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
        var newOrigin: CGPoint = origin

        for _ in 0..<boxCount {
            drawBox(boxSize: boxSize, origin: newOrigin)
            newOrigin.x += boxSize.height + boxSize.width
        }
    }

    func drawStairsOfBoxes(boxCount: Int, boxSize: CGSize, origin: CGPoint) {
        var boxVerticalCount = boxCount
        var newOrigin = origin

        for _ in boxCount..<0 {
            drawLineOfBoxes(boxCount: boxVerticalCount, boxSize: boxSize, origin: newOrigin)
            boxVerticalCount -= 1
            newOrigin.y -= boxSize.height + boxSize.width
        }
    }
    
    func drawPyramidOfBoxes(boxCount: Int, boxSize: CGSize, origin: CGPoint) {
        var boxVerticalCount = boxCount
        var newOrigin = origin

        for _ in 0..<boxVerticalCount {
            drawLineOfBoxes(boxCount: boxVerticalCount, boxSize: boxSize, origin: newOrigin)
            boxVerticalCount -= 1
            newOrigin.y -= boxSize.height + boxSize.width
            newOrigin.x = origin.x + (CGFloat(boxCount - boxVerticalCount) / 2.0) * (boxSize.width + boxSize.height)
        }
    }
}
