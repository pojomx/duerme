//
//  SoundElement.swift
//  duerme
//
//  Created by Alan Milke on 23/07/24.
//

import Foundation
import AVFAudio
import AVFoundation

class SoundElement: Identifiable {
    var id: String
    var player: AVAudioPlayer?
    var volume: Float = 1.0
    var name: String
    var fileName: String
    var fileExtension: String
    var iconName: String
    
    init(player: AVAudioPlayer? = nil, volume: Float, name: String, fileName: String, fileExtension: String, iconName: String) {
        self.id = "\(fileName)\(fileExtension)"
        self.player = player
        self.volume = volume
        self.name = name
        self.fileName = fileName
        self.fileExtension = fileExtension
        self.iconName = iconName
    }
    
    func setSound() {
        guard let url = Bundle.main.url(forResource: self.fileName, withExtension: self.fileExtension) else { return }
        
        print("URL Establecida: \(url)")
        
        if let player = try? AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue) {
            player.numberOfLoops = -1 //Infinite
            player.volume = self.volume
        
            player.play()
            
            self.player = player
        } else {
            print("Error: Error starting player.")
            return
        }
    }
}
