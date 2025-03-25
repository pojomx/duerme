//
//  SettingsView.swift
//  duerme
//
//  Created by Alan Milke on 25/03/25.
//

import SwiftUI

struct SettigsView: View {
    var body: some View {
        List {
            // MARK: - Section Header
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 60, weight: .black))
                    VStack (spacing: -6) {
                        Text("Sleep")
                            .font(.system(size: 50, weight: .black))
                        Text("Nature Sounds")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 60, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(colors: [.pink, .purple], startPoint: .top, endPoint: .bottom)
                )
                .padding(.top, 8)
                
                VStack (spacing: 8) {
                    Text("Where can you find more sounds?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    Text("The hike which looks gorgeous in photos bit is even better once")
                        .font(.footnote)
                        .italic()
                    Text("Is now time to sleep!")
                        .fontWeight(.heavy)
                        .foregroundColor(.pink)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity)
                
            } //: Section header
            .listRowSeparator(.hidden)
            
            // MARK: - Section Icons
            // MARK: - Section About
            Section {
                Link("twitter.com/pojomx", destination: URL(string: "https://www.x.com/pojomx")!)
                    .padding()
                    .tint(.red)
            }
        }
            
            
            
    }
}

struct SettigsView_Previews: PreviewProvider {
    static var previews: some View {
        SettigsView()
    }
}
