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
        
        let boxSize: CGSize = getBoxSizeAndInterval(widthScreenSide: widthScreenSide, boxCount: boxCount)
        print(boxSize)
    }

    func getBoxSizeAndInterval(widthScreenSide:CGFloat, boxCount:Int) -> CGSize {
        let divider = boxCount + 1
        let boxSize = widthScreenSide / CGFloat(divider)
        let interval = boxSize / CGFloat(divider)
        
        return CGSize(width: boxSize, height: interval)
    }
    
}

