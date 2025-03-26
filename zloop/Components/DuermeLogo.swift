//
//  DuermeLogo.swift
//  duerme
//
//  Created by Alan Milke on 25/03/25.
//

import SwiftUI

struct DuermeLogo: View {
    var body: some View {
        ZStack {
            Circle()
                .mask {
                    ZStack{
                        Circle()
                            .frame(width: 100, height: 100, alignment: .topLeading)
                        Circle()
                            .blendMode(.destinationOut)
                            .frame(width: 60, height: 60, alignment: .topLeading)
                            .padding(.top, -30)
                            .padding(.leading, -30)
                    }
                    
                }
            Text("Z")
                .font(.system(size: 55))
                .fontWeight(.semibold)
                .rotationEffect(Angle(degrees: -36))
                .padding(.top, -35)
                .padding(.trailing, 35)
            
        }
    }
}

#Preview {
    DuermeLogo()
}
