//
//  GameManager.swift
//  Flappy Bird
//
//  Created by Chad Fegley on 6/20/17.
//  Copyright © 2017 Chad Fegley. All rights reserved.
//

import Foundation

class GameManager {
    
    static let instance = GameManager();
    
    private init() {};
    
    var birdIndex = Int(0);
    
    var birds = ["Blue", "Green", "Red"];
    
    func incrementIndex() {
        
        birdIndex += 1;
        
        if birdIndex == birds.count {
            
            birdIndex = 0;
        }
        
    }
    
    func getBird() -> String {
        
        return birds[birdIndex];
        
    }
    
    func setHighScore(highscore: Int) {
        
        UserDefaults.standard.set(highscore, forKey: "Highscore");
        
    }
    
    func getHighscore() -> Int {
        
        return UserDefaults.standard.integer(forKey: "Highscore");
        
    }
    
}
