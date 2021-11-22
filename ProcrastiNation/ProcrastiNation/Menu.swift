//
//  Menu.swift
//  ProcrastiNation
//
//  Created by Silvio Saturno on 19/11/21.
//

import SwiftUI

struct Menu: View {
    @State private var menuOpen = false
    
    var body: some View {
        ZStack {
            
            if menuOpen {
                ZStack {
                  
                    
                    VStack {
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.ultraThinMaterial)
                    .onTapGesture(count: 1, perform: { withAnimation {
                        menuOpen = false
                    }})
                    
                    HStack {
                        VStack {
                            
                        }
                        Spacer()
                    }
                    .padding(10)
                }
            }
            
            MainScreen(menuOpen: $menuOpen)
                .scaleEffect(menuOpen ? 0.5 : 1)
                .offset(x: menuOpen ? 160 : 0)
            
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
