//
//  IsometricLevelGeneretor.swift
//  IsometricTest
//
//  Created by claudio Cavalli on 22/10/2018.
//  Copyright © 2018 claudio Cavalli. All rights reserved.
//

import UIKit
import SpriteKit


class HandleIsometricsLevel{
    
    static let instance = HandleIsometricsLevel()
    
    var viewIso = [SKSpriteNode()]
    var Tiles = [[[String]]()]
    var tilesize = (width: Int(), height: Int())
    var numberlevel = Int()
    
    private init() { }
    
    func setup(view: SKView, numberLevel: Int, tiles:  [[[String]]], tileSize: Int, positionY: Int ,spacing: Double){
        let deviceScale = view.scene!.size.width/400
        var Spacing = spacing
        
        for i in 1...numberLevel{
            let element = SKSpriteNode()
            element.position = CGPoint(x: view.scene!.size.width*0.001 - 65, y: (view.scene!.size.height * CGFloat(Spacing)) - CGFloat(positionY))
            print(viewIso.count)
            Spacing = Spacing + 0.04
            viewIso.append(element)
            
            viewIso[i].xScale = deviceScale
            viewIso[i].yScale = deviceScale
            view.scene!.addChild(viewIso[i])
         
        }
        
        numberlevel = numberLevel
        tilesize = (width: tileSize, height: tileSize)
        Tiles = tiles
    }
    
    func generate(){
        for i in 0..<numberlevel{
            var tempLevel = Tiles[i]
            let numberMatrix = tempLevel.last!.count
            for j in 0..<numberMatrix {
                var tempRow = tempLevel[j]
                for k in 0..<tempRow.count{
                    let row = tempRow.popLast()!
            let point = point2DToIso(p: CGPoint(x: (j*tilesize.width), y: -(k*tilesize.height)))
                    placeTileIso(image: (row), withPosition:point, level: i )
                }
          
            }
        }
    }
    
    
    
    func point2DToIso(p:CGPoint) -> CGPoint {
        
        //invert y pre conversion
        var point = p * CGPoint(x:1, y:-1)
        
        //convert using algorithm
        point = CGPoint(x:(point.x - point.y), y: ((point.x + point.y) / 2))
        
        //invert y post conversion
        point = point * CGPoint(x:1, y:-1)
        
        return point
        
    }
    
   func placeTileIso(image:String, withPosition:CGPoint, level: Int) {
        
        let tileSprite = SKSpriteNode(imageNamed: image)
        
        tileSprite.position = withPosition
        tileSprite.name = image
        tileSprite.anchorPoint = CGPoint(x:0, y:0)
        
        viewIso[level].addChild(tileSprite)
        
    }

}


func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func * (point: CGPoint, scalar: CGPoint) -> CGPoint {
    return CGPoint(x: point.x * scalar.x, y: point.y * scalar.y)
}

func / (point: CGPoint, scalar: CGPoint) -> CGPoint {
    return CGPoint(x: point.x / scalar.x, y: point.y / scalar.y)
}
