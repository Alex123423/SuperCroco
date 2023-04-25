//
//  Audio.swift
//  SuperCroco
//
//  Created by Александр Вихарев on 25.04.2023.
//

import Foundation
import AVFoundation


struct AudioPlayer {
    
    var player: AVAudioPlayer?
    
    
    
    mutating func playSound(sound: String) {
        let url = Bundle.main.url(forResource: sound,
                                  withExtension:
                                    "mp3" )
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play ()
    }
    
}

