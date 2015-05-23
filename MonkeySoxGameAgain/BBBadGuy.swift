//
//  BBBadguy.swift
//  MonkeySoxGameAgain
//
//  Created by Brittany Butts on 5/22/15.
//  Copyright (c) 2015 Brittany Butts. All rights reserved.
//

import Foundation
import SpriteKit

class BBBadGuy: SKSpriteNode, SKPhysicsContactDelegate{

var body: SKSpriteNode!
var arm: SKSpriteNode!
var leftFoot: SKSpriteNode!
var rightFoot:SKSpriteNode!
    
    
    init() {
        super.init(texture: nil, color: UIColor.clearColor(), size: CGSizeMake(30, 20))
        
        body = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(self.frame.size.width, 26))
        body.position = CGPointMake(0, 2)
        addChild(body)
        
        let eyeColor = UIColor.whiteColor()
        let leftEye = SKShapeNode (circleOfRadius: 6)
        leftEye.self.fillColor = eyeColor
        let rightEye = leftEye.copy() as! SKShapeNode
        let pupil = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(3,3))
        
        pupil.position = CGPointMake(2,0)
        leftEye.addChild(pupil)
        rightEye.addChild(pupil.copy() as! SKSpriteNode)
        
        leftEye.position = CGPointMake(-6, 0)
        body.addChild(leftEye)
        
        rightEye.position = CGPointMake(12, 0)
        body.addChild(rightEye)
        
        let eyebrow = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(1,14))
        eyebrow.position = CGPointMake(-1, leftEye.position.y + 4)
        leftEye.addChild(eyebrow)
        rightEye.addChild(eyebrow.copy() as!  SKSpriteNode)
        
        let armColor = UIColor(red: 48.0/255.0, green: 48.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        arm = SKSpriteNode(color: armColor, size: CGSizeMake(4, 10))
        arm.anchorPoint = CGPointMake(0.5, 1.2)
        arm.position = CGPointMake(-10, -7)
        body.addChild(arm)
        
        let leftFootColor = UIColor(red: 48.0/255.0, green: 48.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        leftFoot = SKSpriteNode(color: armColor, size: CGSizeMake(4, 10))
        leftFoot.anchorPoint = CGPointMake(-2.5, 1.2)
        leftFoot.position = CGPointMake(-10, -7)
        body.addChild(leftFoot)
        
        let rightFootColor = UIColor(red: 48.0/255.0, green: 48.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        rightFoot = SKSpriteNode(color: armColor, size: CGSizeMake(4, 10))
        rightFoot.anchorPoint = CGPointMake(-5, 1.2)
        rightFoot.position = CGPointMake(-10, -7)
        body.addChild(rightFoot)
        
    
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startRunning(){
       
        performOneRunCycle()
    }
    
    func performOneRunCycle(){
        let up = SKAction.moveByX(0, y: 2, duration: 0.05)
        let down = SKAction.moveByX(0, y: -2, duration: 0.05)
        
        
        

        leftFoot.runAction(up, completion: { () -> Void in
            self.leftFoot.runAction(down)
            self.rightFoot.runAction(up, completion: { () -> Void in
                self.rightFoot.runAction(down, completion: { () -> Void in
                    self.rightFoot.runAction(up)
                    self.arm.runAction(up, completion: { () -> Void in
                        self.performOneRunCycle()
                    })
                })
            })
        })
        
}

}


