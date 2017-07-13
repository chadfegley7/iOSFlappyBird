//
//  MainMenuScene.swift
//  Flappy Bird
//
//  Created by Chad Fegley on 6/20/17.
//  Copyright © 2017 Chad Fegley. All rights reserved.
//

import SpriteKit

class MainMenuScene: SKScene {
    
    
    
    //This is where I want to bring in the birdBtn, which will be able to change the color of the bird.
    //Also the scoreLabel button will be able to display the highscore when pressed.
    
    var birdBtn = SKSpriteNode();
    
    var scoreLabel = SKLabelNode();
    
    
    
    //I created my own function called initialze() which will be called when we get the MainMenuScreen View
    
    override func didMove(to view: SKView) {
        
        initialize();
        
    }
    
    
    
    //Here in the touches began function I want to have a for/in loop to register the node that was pressed depending on its locations.
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self);
            
            if atPoint(location).name == "Play" {
                
                let gameplay = GameplayScene(fileNamed: "GameplayScene");
                
                gameplay?.scaleMode = .aspectFill
                
                self.view?.presentScene(gameplay!, transition: SKTransition.flipVertical(withDuration: 1));
                
            }
            
            if atPoint(location).name == "Highscore" {
                
                scoreLabel.removeFromParent();
                
                createLabel();
                
            }
            
            if atPoint(location).name == "Bird" {
                
                GameManager.instance.incrementIndex();
                
                birdBtn.removeFromParent();
                
                createBirdButton();
                
            }
            
        }
        
    }
    
    
    
    //This is my initialize function that get called in the didMoveToView function above. Here is a function that creates all the buttons and the background of the game when the user is on the Main Menu Screen.
    
    func initialize() {
        
        createBG();
        
        createButtons();
        
        createBirdButton();
        
    }
    
    
    
    //Here I am creating the background of the game, letting bg = SKSpriteNode and setting the position and anchor points of where I want it to be. At the end of the function we are adding it to its parent.
    
    func createBG() {
        
        let bg = SKSpriteNode(imageNamed: "BG Day");
        
        bg.anchorPoint = CGPoint(x: 0.5, y: 0.5);
        
        bg.position = CGPoint(x: 0, y: 0);
        
        bg.zPosition = 0;
        
        self.addChild(bg);
        
    }
    
    func createButtons() {
        
        let play = SKSpriteNode(imageNamed: "Play");
        
        let highscore = SKSpriteNode(imageNamed: "Highscore");
        
        
        
        
        
        play.name = "Play";
        
        play.anchorPoint = CGPoint(x: 0.5, y: 0.5);
        
        play.position = CGPoint(x: -180, y: -50);
        
        play.zPosition = 1;
        
        play.setScale(0.7);
        
        
        
        
        highscore.name = "Highscore";
        
        highscore.anchorPoint = CGPoint(x: 0.5, y: 0.5);
        
        highscore.position = CGPoint(x: 180, y: -50);
        
        highscore.zPosition = 1;
        
        highscore.setScale(0.7);
        
        
        
        
        self.addChild(play);
        
        self.addChild(highscore);
        
    }
    
    func createBirdButton() {
        
        birdBtn = SKSpriteNode();
        
        birdBtn.name = "Bird";
        
        birdBtn.anchorPoint = CGPoint(x: 0.5, y: 0.5);
        
        birdBtn.position = CGPoint(x: 0, y: 200);
        
        birdBtn.setScale(1.3);
        
        birdBtn.zPosition = 3;
        
        var birdAnim = [SKTexture]();
        
        for i in 1..<4 {
            
            let name = "\(GameManager.instance.getBird()) \(i)";
            
            birdAnim.append(SKTexture(imageNamed: name));
            
        }
        
        let animateBird = SKAction.animate(with: birdAnim, timePerFrame: 0.1, resize: true, restore: true);
        
        birdBtn.run(SKAction.repeatForever(animateBird));
        
        self.addChild(birdBtn);
        
    }
    
    func createLabel() {
        
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster");
        
        scoreLabel.fontSize = 120;
        
        scoreLabel.position = CGPoint(x: 0, y: -400);
        
        scoreLabel.text = "\(GameManager.instance.getHighscore())";
        
        self.addChild(scoreLabel);
        
    }
}























