//
//  ContentView.swift
//  duerme
//
//  Created by Alan Milke on 29/01/24.
//

import SwiftUI
import AVFoundation


struct ContentView: View {
    
    @State private var reproduciendo: Bool = false
    @State private var isEditing = false
    @State private var isShowingSheet: Bool = false
    
    @State var soundList: [SoundElement] = [
        SoundElement(
            player: AVAudioPlayer(),
            volume: 1.0,
            name: "Lluvia Ligera",
            fileName: "lluvia-pojoclan",
            fileExtension: "wav",
            iconName: "cloud.rain"
        ),
        
    ]
            
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    isShowingSheet.toggle()
                } label: {
                    Image(systemName: "info.circle")
                        .resizable()
                        .frame(width:20, height: 20)
                        .foregroundStyle(LinearGradient(colors: [.pink, .purple], startPoint: .top, endPoint: .bottom))
                }
                .sheet(isPresented: $isShowingSheet) {
                    SettigsView()
                        .presentationDragIndicator(.visible)
                        .presentationDetents([.medium, .large])
                }
            }

            
            DuermeLogo()
                .foregroundStyle(LinearGradient(colors: [.pink, .purple], startPoint: .top, endPoint: .bottom))
            
            Spacer()
            Section {
                ForEach($soundList) { $sound in
                     Slider(value: $sound.volume,
                           in: 0...1,
                           step: 0.01
                    )
                    {
                        Text("Volume \(sound.name)")
                    } minimumValueLabel: {
                        Label("", systemImage: sound.iconName)
                    } maximumValueLabel: {
                        Label("", systemImage: "")
                    } onEditingChanged: { editing in
                        isEditing = editing
                        sound.player?.volume = Float(sound.volume)
                    }
                }
            }
            .foregroundStyle(LinearGradient(colors: [.pink, .purple], startPoint: .top, endPoint: .bottom))
            
            Spacer()
            Button {
                self.playSounds()
            } label: {
                Image(systemName: reproduciendo ? "pause.fill" : "play.fill")
                    .resizable()
                    .frame(width:50, height: 50)
                
            }
            .foregroundStyle(LinearGradient(colors: [.pink, .purple], startPoint: .top, endPoint: .bottom))
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
