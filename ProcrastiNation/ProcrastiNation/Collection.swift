//
//  Collection.swift
//  ProcrastiNation
//
//  Created by Silvio Saturno on 17/11/21.
//

import SwiftUI


//CLASSE CHE GESTISCE IL PUNTEGGIO.
class punti {
    var punteggio : Int
    init(punteggio: Int){
        self.punteggio = punteggio
    }
    //FUNZIONE PER IL CHECK DEI PUNTI.SE IL PUNTEGGIO è >= X IL MOSTRO Y APPARE
    func checkPunteggio(){
        
    if punteggio>=100 {
        monster1.appear()
        
        monster2.uovo()
        monster3.uovo()
        monster4.uovo()
        monster5.uovo()
        monster6.uovo()
        monster7.uovo()
        monster8.uovo()
        monster9.uovo()
    }
        
    if punteggio>=200{
        monster2.appear()
        monster2.imageMonster = "2"
        
       
    }
    if punteggio>=300{
        monster3.appear()
        monster3.imageMonster = "3"
      }
    if punteggio>=400{
        monster4.appear()
        monster4.imageMonster = "4"
     
    }
    if punteggio>=500{
        monster5.imageMonster = "5"
        monster5.appear()
        
    }
    if punteggio>=600{
        monster6.imageMonster = "6"
        monster6.appear()
       
    }
    if punteggio>=700{
        monster7.imageMonster = "7"
        monster7.appear()
       
    }
    if punteggio>=800{
        monster8.imageMonster = "8"
        monster8.appear()
       
    }
    if punteggio>=900{
        monster9.imageMonster = "9"
        monster9.appear()}
    }
    
    func aumentaPunteggio(){
        self.punteggio+=1000
    }
}


//CLASSE MOSTRO, ABBIAMO TRE VALORI: NOME IMMAGINE, OPACITA' E DIMENSIONE DELL'IMMAGINE
class monster {
    var imageMonster : String
    var opac : Double
    var dim : Double
    var on1: Bool
    init(imageMonster: String, opac: Double, dim: Double, on1: Bool){
        self.imageMonster = imageMonster
        self.opac = opac
        self.dim = dim
        self.on1 = on1
    }
    //FUNZIONE APPARI CHE USIAMO NELLA CLASSE PUNTEGGIO
    func appear(){
        opac = 1.0
        on1 = true
        
    }
    func uovo(){
        if self.on1 == false {
            self.imageMonster = "10"
            self.opac=1.0
            self.dim=0.25
            
        }
        else{
            return
        }
    }
}

//VENGONO CREATI I 9 OGGETTI MOSTRO
var monster1 = monster(imageMonster: "1", opac: 0, dim:0.2, on1: false)
var monster2 = monster(imageMonster: "2", opac: 0, dim:0.2, on1: false)
var monster3 = monster(imageMonster: "3", opac: 0, dim:0.2, on1: false)
var monster4 = monster(imageMonster: "4", opac: 0, dim:0.2, on1: false)
var monster5 = monster(imageMonster: "5", opac: 0, dim:0.2, on1: false)
var monster6 = monster(imageMonster: "6", opac: 0, dim:0.2, on1: false)
var monster7 = monster(imageMonster: "7", opac: 0, dim:0.2, on1: false)
var monster8 = monster(imageMonster: "8", opac: 0, dim:0.2, on1: false)
var monster9 = monster(imageMonster: "9", opac: 0, dim:0.2, on1: false)
var monster10 = monster(imageMonster: "10", opac: 0, dim:0.2, on1: false)




struct Collection: View {

    @State var verticaloffsetmonster = 2.0
    var points = punti(punteggio: 200)
    //CREO TRE COLONNE PER LA LAZYGRID
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
  //FACCIO IL CONTROLLO DEL PUNTEGGIO PER SBLOCCARE I MOSTRI DELLA COLLEZIONE
    init(){
        
        points.checkPunteggio()
        
    }

    var body: some View {
        
        //ARRAY OGGETTI MOSTRO
        let mostri = [monster1,
                      monster2,
                      monster3,
                      monster4,
                      monster5,
                      monster6,
                      monster7,
                      monster8,
                      monster9]
        ZStack{
            VStack{
            
            Text("Collection").bold()
            .font(.largeTitle)
            .foregroundColor(Color.gray)
            .font(.system(size: 33.0))
           // .padding(.leading)
            }.onAppear(perform: {
                verticaloffsetmonster = -2.0
            })
            
            //COLORE SFONDO
            Color.white.ignoresSafeArea()
            
            //GRIGLIA MOSTRI
            ScrollView {
            LazyVGrid(columns: columns, spacing: 0){
                ForEach((0..<9)) { index in
                    Image(mostri[index].imageMonster)
                        .scaleEffect(mostri[index].dim)
                        .opacity(mostri[index].opac)
                        .padding(-115)
                        .offset(y: verticaloffsetmonster)
                        .animation(Animation.linear.repeatForever())
                }
                
            }
        }.zIndex(1)

            //GRIGLIA QUADRATINI
            ScrollView {
            LazyVGrid(columns: columns, spacing: 0){
                ForEach(0..<9) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.white).opacity(0.6).frame(width: 110, height: 100)
                        .shadow(radius: 5)
                       .padding(76)
                }
            }
        }.zIndex(0)
    } //: ZStack
        
       
}
    
struct Collection_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            Collection()
            Collection()
        }
    }
}

}
