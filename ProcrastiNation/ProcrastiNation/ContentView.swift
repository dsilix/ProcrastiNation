//
//  ContentView.swift
//  ProcrastiNation
//
//  Created by Silvio Saturno on 15/11/21.
//

import SwiftUI




var user = "utente"
struct ContentView: View {
    struct Task: Identifiable, Hashable {
        let name: String
        let id = UUID()
    }
    private var oceans = [
        Task(name: "Studying 2 law chapters"),
        Task(name: "Read the 13/11 search"),
        Task(name: "Start Latin"),
        Task(name: "Studying the 9/11 workshop"),
        Task(name: "Complete Algebra"),
        Task(name: "Learn to code")
    ]
    @State private var multiSelection = Set<UUID>()

    var body: some View {
        
        
        
        ZStack{
            
            Color.white.ignoresSafeArea()
            VStack{
            Text("Hi " + user + ", \n welcome in")
                    .font(.largeTitle)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.salmon)
                .font(.system(size: 33.0))
                
                
            Text("ProcrastiNation").bold()
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.salmon)
                .font(.system(size: 33.0))
                
                Text("Daily Tasks").italic()
                    .font(.system(size: 23.0))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.salmon)
                    .padding()
                
                
//                List {
//                    Text("Studying 2 law chapters")
//                    Text("Read the 13/11 search")
//                    Text("Start Latin")
//                    Text("Studying the 9/11 workshop")
//                    Text("Complete Algebra")
//                    Text("Learn to code")
//                }
               
               
                    NavigationView {
                        List(oceans, selection: $multiSelection) {
                            Text($0.name)
                        }
                        .navigationTitle("Tasks")
                        .toolbar { EditButton() }
                    }//:
                    Text("\(multiSelection.count) selections")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    static let oldPrimaryColor = Color(UIColor.systemIndigo)
    static let salmon = Color("salmon")
}


