//
//  MainMenuScene.swift
//  Shooter Game
//
//  Created by Nagarjuna Reddy on 2021-05-25.
//

import Foundation
import SpriteKit
import UIKit

let defaults = UserDefaults()

var playerName = defaults.string(forKey: "playername")

var inputText: UITextField!
var inputPassword: UITextField!

class MainMenuScene: SKScene, UITextFieldDelegate{

    
    override func didMove(to view: SKView) {
        
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
       
        
        let gameBy = SKLabelNode(fontNamed: "roboto")
        gameBy.text = "Spacex"
        gameBy.fontSize = 70
        gameBy.fontColor = SKColor.white
        gameBy.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.78)
        gameBy.zPosition = 1
        self.addChild(gameBy)
        
        let gameName1 = SKLabelNode(fontNamed: "roboto")
        gameName1.text = "Shooter"
        gameName1.fontSize = 200
        gameName1.fontColor = SKColor.white
        gameName1.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.7)
        gameName1.zPosition = 1
        self.addChild(gameName1)
        
        let gameName2 = SKLabelNode(fontNamed: "roboto")
        gameName2.text = "Game"
        gameName2.fontSize = 200
        gameName2.fontColor = SKColor.white
        gameName2.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.625)
        gameName2.zPosition = 1
        self.addChild(gameName2)
        
        let startGame = SKLabelNode(fontNamed: "roboto")
        startGame.text = "Login"
        startGame.fontSize = 150
        startGame.fontColor = SKColor.white
        startGame.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.3)
        startGame.zPosition = 1
        startGame.name = "startButton"
        self.addChild(startGame)
        
        inputText = UITextField(frame: CGRect(x: view.bounds.width / 2 - 160, y: view.bounds.height / 2 - 20, width: 320, height: 40))

                // add the UITextField to the GameScene's view
                view.addSubview(inputText)
             
                // add the gamescene as the UITextField delegate.
                // delegate funtion called is textFieldShouldReturn:
                inputText.delegate = self
            
        inputText.borderStyle = UITextField.BorderStyle.roundedRect
        inputText.textColor = SKColor.black
                inputText.placeholder = "Enter Player Name"
        inputText.backgroundColor = SKColor.white
        inputText.autocorrectionType = UITextAutocorrectionType.yes
               
        inputText.clearButtonMode = UITextField.ViewMode.whileEditing
        inputText.autocapitalizationType = UITextAutocapitalizationType.allCharacters
                self.view!.addSubview(inputText)
        
      
        
      
        
        
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            
            let pointOfTouch = touch.location(in: self)
            let nodeITapped = atPoint(pointOfTouch)
            
            if nodeITapped.name == "startButton" && inputText.text != "" {
                
                
                playerName = ""
                defaults.set(playerName, forKey: "playername")
                playerName = inputText.text!
                print("Player Name Saved")
                
                
                inputText.removeFromSuperview()
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
                
            } else if inputText.text == "" {
                let errorMsg = SKLabelNode(fontNamed: "roboto")
                
                errorMsg.text = "Please Enter Name First"
                errorMsg.fontSize = 80
                errorMsg.fontColor = SKColor.red
                errorMsg.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.2)
                errorMsg.zPosition = 1
                self.addChild(errorMsg)
                
            }
            
            
            
        }
    }
}
