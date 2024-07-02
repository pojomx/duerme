//
//  ContentView.swift
//  duerme
//
//  Created by Alan Milke on 29/01/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var reproduciendo: Bool = false
    @State private var isEditing = false
    
    class SoundElement: Identifiable {
        var id: String
        var player: AVAudioPlayer?
        var volume: Float = 1.0
        var name: String
        var fileName: String
        var fileExtension: String
        
        init(player: AVAudioPlayer? = nil, volume: Float, name: String, fileName: String, fileExtension: String) {
            self.id = "\(fileName)\(fileExtension)"
            self.player = player
            self.volume = volume
            self.name = name
            self.fileName = fileName
            self.fileExtension = fileExtension
        }
        
        func setSound() {
            guard let url = Bundle.main.url(forResource: self.fileName, withExtension: self.fileExtension) else { return }
            
            print("URL Establecida: \(url)")
            
            if let player = try? AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue) {
                print("player inicializado")
                player.numberOfLoops = -1 //Infinite
                print("player en loop infinito")
                player.volume = self.volume
                print("player volumen en \(volume)")
                player.play()
                print("player reproduciendo")
                self.player = player
                print("player guardado")
            } else {
                print("Error: Error starting player.")
                return
            }
        }
    }
    
    @State var soundList: [SoundElement] = [
        SoundElement(player: AVAudioPlayer(), volume: 1.0, name: "Lluvia", fileName: "lluvia-pojoclan", fileExtension: "wav"),
        //SoundElement(player: AVAudioPlayer(), volume: 1.0, name: "Truenos", fileName: "truenos", fileExtension: "wav"),
        //SoundElement(player: AVAudioPlayer(), volume: 1.0, name: "Viento", fileName: "viento", fileExtension: "wav")
    ]
            
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "moon")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("¡buenas noches!")
            Spacer()
            Button {
                self.playSounds()
            } label: {
                Text(reproduciendo ? "Detener" : "Reproducir")
            }
            Spacer()
            
            ForEach($soundList){ $sound in
                Slider(value: $sound.volume,
                       in: 0...1,
                       step: 0.01
                )
                {
                    Text("Volume \(sound.name)")
                } minimumValueLabel: {
                    Text("\(sound.name)")
                } maximumValueLabel: {
                    Text("")
                } onEditingChanged: { editing in
                    isEditing = editing
                    sound.player?.volume = Float(sound.volume)
                }
            }
            
            Spacer()
            Link("Sígueme en mis redes sociales @pojomx", destination: URL(string: "https://www.x.com/pojomx")!)
        }
        .padding()
        .onAppear(perform: {
            playSounds()
        })
    }
    
    // Code
    
    func playSounds() {
        
        if(reproduciendo) {
            soundList.forEach { sonido in
                sonido.player?.stop()
            }
            reproduciendo = false;
            return
        }
        
        reproduciendo = true;
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            soundList.forEach { sonido in
                sonido.setSound()
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}
