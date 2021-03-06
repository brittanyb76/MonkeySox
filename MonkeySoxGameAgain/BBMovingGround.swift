//
//  BBMovingGround.swift
//  MonkeySoxGameAgain
//
//  Created by Brittany Butts on 4/29/15.
//  Copyright (c) 2015 Brittany Butts. All rights reserved.
//

import Foundation
import SpriteKit

class BBMovingGround: SKSpriteNode {
    
    /*
    let NUMBER_OF_SEGMENTS = 20
    let COLOR_ONE = UIColor(red: 88.0/255.0, green: 148.0/255.0, blue: 87.0/255.0, alpha: 1.0)
    let COLOR_TWO = UIColor(red: 120.0/255.0, green: 195.0/255.0, blue: 118.0/255.0, alpha: 1.0)
    */
    
    let NUMBER_OF_SEGMENTS = 20
    let COLOR_ONE = UIColor.clearColor()
    let COLOR_TWO = UIColor.clearColor()
    
    init(size: CGSize){
        super.init(texture: nil, color: UIColor.clearColor(), size: CGSizeMake(size.width*2, size.height))
        anchorPoint = CGPointMake(0, 0.5)
        
        for var i = 0;  i < NUMBER_OF_SEGMENTS; i++ {
            var segmentColor: UIColor!
            if  i % 2 == 0 {
                segmentColor = COLOR_ONE
            }else {
                segmentColor = COLOR_TWO
            }
            let segment = SKSpriteNode(color: segmentColor, size: CGSizeMake(self.size.width/CGFloat(NUMBER_OF_SEGMENTS), self.size.height))
            segment.anchorPoint = CGPointMake((0.0), 0.5)
            segment.position = CGPointMake(CGFloat(i)*segment.size.width, 0)
            addChild(segment)

        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start(){
        let moveLeft = SKAction.moveByX(-frame.size.width/2, y: 0, duration: 1.0)
        let resetPosition = SKAction.moveToX(0, duration: 0)
        let moveSequence = SKAction.sequence([moveLeft, resetPosition])
        
        runAction(SKAction.repeatActionForever(moveSequence))
       
    }
}

