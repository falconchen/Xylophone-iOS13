//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        //print(sender.titleLabel?.text!)
        //print(sender.currentTitle)
        
        print("Start")
        playSound(soundName: String(sender.currentTitle!))
        
        self.button = sender
        UIView.animate(withDuration: 0.2,
        animations: {
            self.button.alpha = 0.2
            
        },
        completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.button.alpha = 1
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            print("End")
        }

    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
    
}
