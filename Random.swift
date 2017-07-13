//
//  Random.swift
//  Flappy Bird
//
//  Created by Chad Fegley on 6/20/17.
//  Copyright © 2017 Chad Fegley. All rights reserved.
//

import Foundation

import CoreGraphics


public extension CGFloat {
    
    public static func randomBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
    
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + firstNum;
    
    }
    
}
