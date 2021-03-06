//
//  LandingView.swift
//  ProcrastiNation
//
//  Created by Fabrizio Petrellese on 23/11/21.
//

import SwiftUI

struct LandingView: View {
    @State var verticaloffset = 2.0
    @State var imagerotation = 5.0
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            VStack{
                HStack{
                Text("Procrasti").font(.largeTitle).fontWeight(.bold).foregroundColor(Color("customOrange")).bold()
                        .padding(-10)
                    Text("Nation").font(.largeTitle).fontWeight(.bold).foregroundColor(Color("customBlack")).bold()
                    
                }
                Image("icon").resizable()
                    .frame(width: 200, height: 200)
                    .padding(30)
                    .rotationEffect(Angle(degrees: imagerotation))
                    .offset(y:verticaloffset).animation(Animation.linear.repeatForever())
            }.onAppear(perform: {
                verticaloffset = -2.0
                imagerotation = -5.0
            })
        }
    }
}
struct Landing_Previews: PreviewProvider {
    
    static var previews: some View {
        LandingView()
    }
}
