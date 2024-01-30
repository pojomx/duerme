//
//  ContentView.swift
//  duerme
//
//  Created by Alan Milke on 29/01/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var playerLluvia: AVAudioPlayer?
    @State var playerViento: AVAudioPlayer?
    @State var playerTrueno: AVAudioPlayer?
    @State var reproduciendo: Bool = false
    @State private var isEditing = false
    
    @State var volumeLluvia = 1.0 // or some value binded
    @State var volumeViento = 1.0 // or some value binded
    @State var volumeTrueno = 1.0 // or some value binded
    
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
            


            Slider(value: $volumeViento,
                   in: 0...1,
                   step: 0.01
            )   
            {
                Text("Volume Viento")
            } minimumValueLabel: {
                Text("Viento")
            } maximumValueLabel: {
                Text("")
            } onEditingChanged: { editing in
                isEditing = editing
                playerViento?.volume = Float(volumeViento)
            }
            
            Slider(value: $volumeLluvia,
                   in: 0...1,
                   step: 0.01
            )
            {
                Text("Volume Lluvia")
            } minimumValueLabel: {
                Text("Lluvia")
            } maximumValueLabel: {
                Text("")
            } onEditingChanged: { editing in
                isEditing = editing
                playerLluvia?.volume = Float(volumeLluvia)
            }
               
            
            Slider(value: $volumeTrueno,
                   in: 0...1,
                   step: 0.01
            )
            {
                Text("Volume Trueno")
            } minimumValueLabel: {
                Text("Trueno")
            } maximumValueLabel: {
                Text("")
            } onEditingChanged: { editing in
                isEditing = editing
                playerTrueno?.volume = Float(volumeTrueno)
           }
            Spacer()
            Link("Sound effects obtained from https://www.zapsplat.com", destination: URL(string: "https://www.zapsplat.com")!)
        }
        .padding()
        .onAppear(perform: {
            playSounds()
        })
    }
    
    // Code
    
    func playSounds() {
        
        if(reproduciendo) {
            playerLluvia?.stop()
            playerTrueno?.stop()
            playerViento?.stop()
            reproduciendo = false;
            return
        }
        
        reproduciendo = true;
        
        guard let urlLluvia = Bundle.main.url(forResource: "lluvia", withExtension: "wav") else { return }
        guard let urlViento = Bundle.main.url(forResource: "viento", withExtension: "wav") else { return }
        guard let urlTruenos = Bundle.main.url(forResource: "truenos", withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            playerLluvia = try? AVAudioPlayer(contentsOf: urlLluvia, fileTypeHint: AVFileType.wav.rawValue)
            playerViento = try? AVAudioPlayer(contentsOf: urlViento, fileTypeHint: AVFileType.wav.rawValue)
            playerTrueno = try? AVAudioPlayer(contentsOf: urlTruenos, fileTypeHint: AVFileType.wav.rawValue)
            
            playerLluvia?.numberOfLoops = -1
            playerViento?.numberOfLoops = -1
            playerTrueno?.numberOfLoops = -1
            
            playerTrueno?.volume = Float(volumeTrueno);
            playerLluvia?.volume = Float(volumeLluvia);
            playerViento?.volume = Float(volumeViento);
    
            guard let playerViento = playerViento else { return }
            guard let playerLluvia = playerLluvia else { return }
            guard let playerTrueno = playerTrueno else { return }

            playerTrueno.play()
            playerLluvia.play()
            playerViento.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}
