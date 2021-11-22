//
//  CategoryCards.swift
//  ProcrastiNation
//
//  Created by Silvio Saturno on 19/11/21.
//

import SwiftUI

struct CategoryCards: View {
    var category: String
    var color: Color
    var numberOfTasks: Int
    var tasksDone: Int
    
    let maxProgress = 280.0
    
    var progress: Double {
        maxProgress*(Double(tasksDone)/Double(numberOfTasks))
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text("\(numberOfTasks) tasks")
                .font(.caption)
                .foregroundColor(Color("customWhite"))
                .multilineTextAlignment(.leading)
                .padding(.bottom)
            Text(category)
                .padding(.bottom)
                .font(.title)
                .foregroundColor(Color("customWhite"))
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(maxWidth: maxProgress)
                    .frame(height: 5)
                    .foregroundColor(Color("customWhite").opacity(0.5))
                
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .frame(maxWidth: maxProgress)
                    .frame(width: numberOfTasks > 0 ? progress : 0, height: 5)
                    .foregroundColor(Color("customOrange").opacity(0.9))
            }
            
            
            
        }
        .padding(10)
        .frame(width: 300, height: 150, alignment: .leading)
        
        .background(
            ZStack {
                Color("customGrey")
                
                
            
            VStack {
                // empty VStack for the blur
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                
//            .background(.thinMaterial)
            
        },
            alignment: .leading
        )
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//        .shadow(color: .black.opacity(0.1), radius: 20, x: 5, y: 10)
//        .shadow(color: .black.opacity(0.1), radius: 1, x: 1, y: 1)
//        .shadow(color: .white.opacity(1), radius: 5, x: -1, y: -1)
        .shadow(color: Color(uiColor: .gray), radius: 0, x: 2, y: 2)
    }
}

struct CategoryCards_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCards(category: "Alta",
                      color: Color.blue,
                      numberOfTasks: 400,
                      tasksDone: 200)
    }
}
