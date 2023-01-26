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
    var player: AVAudioPlayer?
    
    func playSound(key: String) {
        let keys: [String] = ["C", "D", "E", "F", "G", "A", "B"]
        
        if keys.contains(key) {
            guard let soundFileUrl = Bundle.main.url(forResource: key, withExtension: "wav") else { return }
            
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                
                
                player = try AVAudioPlayer(contentsOf: soundFileUrl, fileTypeHint: AVFileType.wav.rawValue)
                player?.numberOfLoops = 0
                player?.volume = 1
                player?.prepareToPlay()
                
                
                guard let player = player else { return }
                player.play()
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }

    @IBAction func cKeyPressed(_ sender: UIButton) {
        playSound(key: "C")
    }
    
    @IBAction func dKeyPressed(_ sender: UIButton) {
        playSound(key: "D")
    }
    
    @IBAction func eKeyPressed(_ sender: UIButton) {
        playSound(key: "E")
    }
    
    @IBAction func fKeyPressed(_ sender: UIButton) {
        playSound(key: "F")
    }
    
    @IBAction func gKeyPressed(_ sender: UIButton) {
        playSound(key: "G")
    }
    
    @IBAction func aKeyPressed(_ sender: UIButton) {
        playSound(key: "A")
    }
    
    @IBAction func bKeyPressed(_ sender: UIButton) {
        playSound(key: "B")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

