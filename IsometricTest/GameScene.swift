//
//  GameScene.swift
//  IsometricTest
//
//  Created by claudio Cavalli on 22/10/2018.
//  Copyright © 2018 claudio Cavalli. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let tiles = [[
        ["grass", "grass", "grass", "grass", "grass"],
        ["grass", "grass", "grass", "grass", "grass"],
        ["grass", "grass", "grass", "grass", "grass"],
        ["grass", "grass", "grass", "grass", "grass"],
        ["grass", "grass", "grass", "grass", "grass"]
        ],[
            ["grass", "grass", "grass", "grass", "grass"],
            ["grass", "grass", "grass", "grass", "grass"],
            ["grass", "grass", "grass", "grass", "grass"],
            ["grass", "grass", "grass", "grass", "grass"],
            ["grass", "grass", "grass", "grass", "grass"]
        ],[
            ["grass", "grass", "grass", "grass", "grass"],
            ["grass", "grass", "grass", "grass", "grass"],
            ["grass", "grass", "grass", "grass", "grass"],
            ["grass", "grass", "grass", "grass", "grass"],
            ["grass", "grass", "grass", "grass", "grass"]
        ],[
            ["grass", "grass", "grass", "grass", "grass"],
            ["grass", "grass", "grass", "grass", "grass"],
            ["grass", "grass", "grass", "grass", "grass"],
            ["grass", "grass", "grass", "grass", "grass"],
            ["grass", "grass", "grass", "grass", "grass"]
        ]]
    
    override func didMove(to view: SKView) {
         self.anchorPoint = CGPoint(x:0.5, y:0.5)
        
        HandleIsometricsLevel.instance.setup(view: self.view!, numberLevel: 4, tiles: tiles, tileSize: 32, positionY: 440, spacing: 0.06)
     HandleIsometricsLevel.instance.generate()
    }
    
}
