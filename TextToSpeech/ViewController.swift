//
//  ViewController.swift
//  TextToSpeech
//
//  Created by Yeontae Kim on 3/6/18.
//  Copyright © 2018 YTK. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var synth: AVSpeechSynthesizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pauseButton.isEnabled = false
        stopButton.isEnabled = false
        
        synth = AVSpeechSynthesizer()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textToSpeech(_ sender: Any) {
        
        let string = "Below the ground, the roots branch and spread out widely; they serve to anchor the tree and extract moisture and nutrients from the soil. Above ground, the branches divide into smaller branches and shoots. The shoots typically bear leaves, which capture light energy and convert it into sugars by photosynthesis, providing the food for the tree's growth and development."
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        synth?.speak(utterance)
        
        playButton.isEnabled = false
        pauseButton.isEnabled = true
        stopButton.isEnabled = true
        
    }
    
    @IBAction func pause(_ sender: Any) {
        if pauseButton.currentTitle == "Pause" {
            synth?.pauseSpeaking(at: .immediate)
            pauseButton.setTitle("Resume", for: .normal)
            playButton.isEnabled = false
        } else { // isPaused
            synth?.continueSpeaking()
            pauseButton.setTitle("Pause", for: .normal)
            playButton.isEnabled = false
        }
        
    }
    
    @IBAction func stop(_ sender: Any) {
        synth?.stopSpeaking(at: .immediate)
        stopButton.isEnabled = false
        pauseButton.isEnabled = false
        pauseButton.setTitle("Pause", for: .normal)
        playButton.isEnabled = true
    }
    
}

