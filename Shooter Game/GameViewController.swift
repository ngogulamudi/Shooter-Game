//
//  GameViewController.swift
//  Shooter Game
//
//  Created by Nagarjuna Reddy on 2021-05-25.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
   
    

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
       
                
               if let view = self.view as! SKView? {

                    // Load the SKScene from 'GameScene.sks'

                    let scene = MainMenuScene(size: CGSize(width: 1536, height: 2048))

                        // Set the scale mode to scale to fit the window

                        scene.scaleMode = .aspectFill
                        
                        // Present the scene

                        view.presentScene(scene)
                    
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true

                    view.showsNodeCount = true
                }       /*super.viewDidLoad()
        
        
        let scene = GameScene(size:CGSize(width: 1536, height: 2048))
            
            let sKView = self.view as! SKView
            sKView.showsFPS = true
            sKView.showsNodeCount = true
            
            sKView.ignoresSiblingOrder = true
            
            scene.scaleMode = .aspectFill
            
            sKView.presentScene(scene) */
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
