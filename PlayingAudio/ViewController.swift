//
//  ViewController.swift
//  PlayingAudio
//
//  Created by Oludemilade Raji on 4/11/17.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var soundEffect:AVAudioPlayer = AVAudioPlayer()
    var musicEffect:AVAudioPlayer = AVAudioPlayer()

    @IBOutlet var totalVolume: UISlider!
    @IBOutlet var musicVolume: UISlider!
    @IBOutlet var soundVolume: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let soundFile = Bundle.main.path(forResource: "Sound", ofType: "wav")
        let musicFile = Bundle.main.path(forResource: "Music", ofType: "mp3")
        
        do {
            try soundEffect = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile!))
            try musicEffect = AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicFile!))
        }
        catch {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func soundEffectVolume(_ sender: Any) {
        soundEffect.volume = soundVolume.value
        
        if (soundVolume.value > totalVolume.value)
        {
            soundVolume.value = totalVolume.value
            soundEffect.volume = totalVolume.value
        }
        
    }
    @IBAction func musicEffectVolume(_ sender: Any) {
        musicEffect.volume = musicVolume.value
        
        if (musicVolume.value > totalVolume.value)
        {
            musicVolume.value = totalVolume.value
            musicEffect.volume = totalVolume.value
        }
    }
    @IBAction func ApplicationVolume(_ sender: Any) {
        soundEffect.volume = totalVolume.value
        musicEffect.volume = totalVolume.value
        
        soundVolume.value = totalVolume.value
        musicVolume.value = totalVolume.value
    }
    
    @IBAction func playSoundEffect(_ sender: Any) {
        soundEffect.play()
    }

    @IBAction func playMusic(_ sender: Any) {
        musicEffect.play()
    }
    @IBAction func stopMusic(_ sender: Any) {
        musicEffect.stop()
        musicEffect.currentTime = 0
    }
    
    @IBAction func pauseMusic(_ sender: Any) {
        musicEffect.stop()
    }
    @IBAction func restartMusic(_ sender: Any) {
        musicEffect.currentTime = 0
    }
}

