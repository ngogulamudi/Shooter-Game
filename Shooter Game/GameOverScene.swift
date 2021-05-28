//
//  GameOverScene.swift
//  Shooter Game
//
//  Created by Nagarjuna Reddy on 2021-05-25.
//

import Foundation
import SpriteKit




class GameOverScene: SKScene{
    
    
    
    let restartLabel = SKLabelNode(fontNamed: "san")
    
    
    
    override func didMove(to view: SKView) {
        
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let gameOverLabel = SKLabelNode(fontNamed: "san")
        gameOverLabel.text = "GameOver"
        gameOverLabel.fontSize = 200
        gameOverLabel.fontColor = SKColor.white
        gameOverLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.9)
        gameOverLabel.zPosition = 1
        self.addChild(gameOverLabel)
        
        let scoreLabel = SKLabelNode(fontNamed: "san")
        scoreLabel.text = "Score:\(gameScore)"
        scoreLabel.fontSize = 125
            scoreLabel.fontColor = SKColor.white
            scoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.80)
        scoreLabel.zPosition = 1
        self.addChild(scoreLabel)
        
        let defaults = UserDefaults()
        var highScoreNumber = defaults.integer(forKey: "highScoreSaved")
        var highScoreNumber1 = defaults.integer(forKey: "highScoreSaved1")
        var highScoreNumber2 = defaults.integer(forKey: "highScoreSaved2")
        
        var name = defaults.string(forKey: "name1")
        var second = defaults.string(forKey: "name2")
        var third = defaults.string(forKey: "name3")

        
        print(highScoreNumber,highScoreNumber1,highScoreNumber2)
        
       
        
        
        if gameScore >= highScoreNumber2 {
            
            if gameScore >= highScoreNumber1 {
                
                if gameScore >= highScoreNumber {
                    
                    highScoreNumber2 = highScoreNumber1
                    defaults.set(highScoreNumber2, forKey: "highScoreSaved2")
                    
                    highScoreNumber1 = highScoreNumber
                    defaults.set(highScoreNumber1, forKey: "highScoreSaved1")
                    
                    highScoreNumber = gameScore
                    defaults.set(highScoreNumber, forKey: "highScoreSaved")
                    
                    if second != nil{
                    third = second
                        defaults.setValue(third, forKey: "name3")}
                
                    if name != nil {
                    second = name
                        defaults.setValue(second, forKey: "name2")}
                    
                    name = playerName
                    defaults.setValue(name, forKey: "name1")
                    
                    
                    
                    
                    
                }
                else
                {
                    highScoreNumber2 = highScoreNumber1
                    defaults.set(highScoreNumber2, forKey: "highScoreSaved2")
                    
                    highScoreNumber1 = gameScore
                    defaults.set(highScoreNumber1, forKey: "highScoreSaved1")
                    
                    if second != nil {
                    third = second
                        defaults.setValue(third, forKey: "name3")}
                    
                    
                    second = playerName
                    defaults.set(second, forKey: "name2")
                }
                
            }
            else{
                highScoreNumber2 = gameScore
                defaults.set(highScoreNumber2, forKey: "highScoreSaved2")
                
                third = playerName
                defaults.setValue(third, forKeyPath: "name3")
            }
            
           
        }
        
        let topScoreLabel = SKLabelNode(fontNamed: "roboto")
        topScoreLabel.text = "Top Scores"
        topScoreLabel.fontSize = 150
        topScoreLabel.fontColor = SKColor.white
        topScoreLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.6)
        topScoreLabel.zPosition = 1
        self.addChild(topScoreLabel)
        
        if second != nil {
        let highScoreLabel1 = SKLabelNode(fontNamed: "roboto")
        highScoreLabel1.text = "2nd:\(second!+" -"+String(highScoreNumber1))"
        highScoreLabel1.fontColor = SKColor.white
        highScoreLabel1.fontSize = 125
        highScoreLabel1.zPosition = 1
        highScoreLabel1.position = CGPoint(x: self.size.width/2, y: self.size.height*0.35)
            self.addChild(highScoreLabel1) }
        
        if third != nil{
        let highScoreLabel2 = SKLabelNode(fontNamed: "roboto")
        highScoreLabel2.text = "3rd:\(third!+"- "+String(highScoreNumber2))"
        highScoreLabel2.fontColor = SKColor.white
        highScoreLabel2.fontSize = 125
        highScoreLabel2.zPosition = 1
        highScoreLabel2.position = CGPoint(x: self.size.width/2, y: self.size.height*0.2)
            self.addChild(highScoreLabel2) }
        
        if name != nil{
        let highScoreLabel = SKLabelNode(fontNamed: "roboto")
        highScoreLabel.text = "1st:\(name!+" -"+String(highScoreNumber))"
        highScoreLabel.fontColor = SKColor.white
        highScoreLabel.fontSize = 125
        highScoreLabel.zPosition = 1
        highScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.5)
            self.addChild(highScoreLabel) }
        
        
        restartLabel.text = "Restart"
        restartLabel.fontColor = SKColor.blue
        restartLabel.fontSize = 90
        restartLabel.zPosition = 1
        restartLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.1)

        self.addChild(restartLabel)
        
        print(highScoreNumber,highScoreNumber1,highScoreNumber2)
        
        //print(name!,second!,third!)
        
        
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch : AnyObject in touches{
            
            let pointOfTouch = touch.location(in: self)
            if restartLabel.contains(pointOfTouch){
                
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
                
                
            }
            
            
        }
    }
    
    
    
    
}
