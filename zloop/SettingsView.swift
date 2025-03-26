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
                    //Image(systemName: "laurel.leading")
                    //    .font(.system(size: 60, weight: .black))
                    DuermeLogo().frame(width: 100, height: 100)
                    VStack (spacing: -6) {
                        Text("Zloop")
                            .font(.system(size: 40, weight: .black))
                        Text("Sonidos para dormir")
                            .fontWeight(.medium)
                    }
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(colors: [.pink, .purple], startPoint: .top, endPoint: .bottom)
                )
                .padding(.top, 8)
                
                VStack (spacing: 8) {
                    Text("Sobre los sonidos")
                        .font(.title2)
                        .fontWeight(.heavy)
                    Text("Los sonidos disponibles (por ahora solo uno) en la aplicación son sonidos que he grabado con mi iPhone. No es la mejor calidad, es casi ruido blanco (si pones atención se escuchan algunas gotas grandes), pero me han ayudado a conciliar el sueño.")
                    //Text("For now, there is only one sound I recorded with my iPhone, is not the best quality, but it has helped me into sleep, you are free to use it as you want.")
                        .font(.footnote)
                         .italic()
                    
                    Text("Ten dulces sueños!")
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
                
                Text("Esta aplicación será gratuita, no pretendo conseguir dinero con ella, la hice porque la que utilizaba comenzó a cobrar por reproducir los sonidos, y me resultaba más sencillo hacer una que hiciera solo eso.\n\nPara dudas, quejas o sugerencias, síganme en mis redes sociales!")
                .font(.footnote)
                
                CustomListRowView(
                    rowContent: "twitter.com/pojomx",
                    rowLabel: "Twitter/X",
                    rowIcon: "bird",
                    rowTintColor: .pink,
                    rowURL: "https://x.com/pojomx")
                
                CustomListRowView(
                    rowContent: "twitch.tv/pojomx",
                    rowLabel: "Twitch",
                    rowIcon: "gamecontroller",
                    rowTintColor: .purple,
                    rowURL: "https://twitch.tv/pojomx")
                
                
            } header: {
                Text("Sobre la aplicación")
            } footer: {
                HStack{
                    Spacer()
                    Text("Versión 1.0 | Diseño basado en un tutorial.")
                    Spacer()
                }.padding(.vertical, 8)
            }
        }
    }
}

struct SettigsView_Previews: PreviewProvider {
    static var previews: some View {
        SettigsView()
    }
}
