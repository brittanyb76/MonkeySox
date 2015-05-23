//
//  BBHero.swift
//  MonkeySoxGameAgain
//
//  Created by Brittany Butts on 4/29/15.
//  Copyright (c) 2015 Brittany Butts. All rights reserved.
//

import Foundation
import SpriteKit

class BBHero: SKSpriteNode, SKPhysicsContactDelegate{

    var body: SKSpriteNode!
    var arm: SKSpriteNode!
    var leftFoot: SKSpriteNode!
    var rightFoot:SKSpriteNode!
    
    init() {
        super.init(texture: nil, color: UIColor.clearColor(), size: CGSizeMake(32, 44))
        
        body = SKSpriteNode(color: UIColor.brownColor(), size: CGSizeMake(self.frame.size.width, 40))
        body.position = CGPointMake(0, 2)
        addChild(body)
        
        let skinColor = UIColor(red: 207.0/255.0, green: 193.0/255.0, blue: 168.0/255.0, alpha: 1.0)
        let face = SKSpriteNode(color: skinColor, size: CGSizeMake(self.frame.size.width, 12))
        face.position = CGPointMake(0,6)
        body.addChild(face)
        
        let eyeColor = UIColor.whiteColor()
        let leftEye = SKSpriteNode(color: eyeColor, size: CGSizeMake(6,6))
        let rightEye = leftEye.copy() as! SKSpriteNode
        let pupil = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(3, 3))                                                                                                                                                                                                                                                                                                                               
        
        pupil.position = CGPointMake(2,0)
        leftEye.addChild(pupil)
        rightEye.addChild(pupil.copy() as! SKSpriteNode)
        
        leftEye.position = CGPointMake(-4, 0)
        face.addChild(leftEye)
        
        rightEye.position = CGPointMake(14, 0)
        face.addChild(rightEye)
        
        let eyebrow = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(11,1))
        eyebrow.position = CGPointMake(-1, leftEye.size.height/2)
        leftEye.addChild(eyebrow)
        rightEye.addChild(eyebrow.copy() as!  SKSpriteNode)
        
        let mouth = SKShapeNode(ellipseOfSize: CGSizeMake(14, 10))
        mouth.self.fillColor = skinColor
        mouth.self.strokeColor = skinColor
        mouth.position = CGPointMake(8, -10)
        face.addChild(mouth)
        
        let hole = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(6, 2))
        hole.position = CGPointMake(0, 0)
        mouth.addChild(hole)
        
        let ear = SKShapeNode(circleOfRadius: 8)
        ear.self.fillColor = skinColor
        ear.self.strokeColor = skinColor
        ear.position = CGPointMake(-18, 2)
        face.addChild(ear)
    
        let armColor = UIColor(red: 139.0/255.0, green: 69.0/255.0, blue: 19.0/255.0, alpha: 1.0)
        arm = SKSpriteNode(color: armColor, size: CGSizeMake(8, 14))
        arm.anchorPoint = CGPointMake(0.5, 0.9)
        arm.position = CGPointMake(-10, -7)
        body.addChild(arm)
        
        let hand = SKSpriteNode(color: skinColor, size: CGSizeMake(arm.size.width, 5))
        hand.position = CGPointMake(0, -arm.size.height * 0.9 + hand.size.height/2)
        arm.addChild(hand)
        
        leftFoot = SKSpriteNode(color: UIColor.brownColor(), size: CGSizeMake(9, 4))
        leftFoot.position = CGPointMake(-6, -size.height/2 + leftFoot.size.height/2)
        addChild(leftFoot)
        
        rightFoot = leftFoot.copy() as! SKSpriteNode
        rightFoot.position.x = 8
        addChild(rightFoot)
        
    }
    
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }

    func startRunning(){
        let rotateBack = SKAction.rotateByAngle(-CGFloat(M_PI)/2.0, duration: 0.1)
        arm.runAction(rotateBack)
        
        performOneRunCycle()
    }
    
    func performOneRunCycle(){
        let up = SKAction.moveByX(0, y: 2, duration: 0.05)
        let down = SKAction.moveByX(0, y: -2, duration: 0.05)
        
        leftFoot.runAction(up, completion: { () -> Void in
            self.leftFoot.runAction(down)
            self.rightFoot.runAction(up, completion: { () -> Void in
            self.rightFoot.runAction(down, completion: { () -> Void in
            self.performOneRunCycle()
                        
                    })
                })
            })
    }
    func breathe(){
        let breatheOut  = SKAction.moveByX(0, y: -2, duration: 1)
        let breatheIn = SKAction.moveByX(0, y: 2, duration: 1)
        let breathe = SKAction.sequence([breatheOut, breatheIn])
        body.runAction(SKAction.repeatActionForever(breathe))
    }
    func stop() {
        body.removeAllActions()
    }


}