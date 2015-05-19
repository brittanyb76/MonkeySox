//
//  GameScene.swift
//  MonkeySoxGameAgain
//
//  Created by Brittany Butts on 4/28/15.
//  Copyright (c) 2015 Brittany Butts. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
   
    var movingGround: BBMovingGround!
    var hero: BBHero!
    
    
    var isStarted = false
    
    
    override func didMoveToView(view: SKView) {
        backgroundColor = UIColor(red: 159.0/255.0, green: 201.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        
        let backgroundTexture = SKTexture(imageNamed: "MSBackground.png")
        let backgroundImage = SKSpriteNode(texture: backgroundTexture, size: view.frame.size)
        backgroundImage.position = view.center
        addChild(backgroundImage)
        
        
        //add ground
        movingGround = BBMovingGround(size: CGSizeMake(view.frame.width, 20))
        movingGround.position = CGPointMake(0, view.frame.size.height/2)
        addChild(movingGround)

        
        //add hero
        hero = BBHero()
        hero.position = CGPointMake(70, movingGround.position.y + movingGround.frame.size.height/2 + hero.frame.size.height/2)
        addChild(hero)
        hero.breathe()
    
           }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        hero.stop()
        hero.startRunning()
          }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
