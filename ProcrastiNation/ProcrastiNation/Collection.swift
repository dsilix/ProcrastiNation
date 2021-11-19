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
        monster1.appear()}
    if punteggio>=200{
        monster2.appear()}
    if punteggio>=300{
        monster3.appear()}
    if punteggio>=400{
        monster4.appear()}
    if punteggio>=500{
        monster5.appear()}
    if punteggio>=600{
        monster6.appear()}
    if punteggio>=700{
        monster7.appear()}
    if punteggio>=800{
        monster8.appear()}
    if punteggio>=900{
        monster9.appear()}
    }
}


//CLASSE MOSTRO, ABBIAMO TRE VALORI: NOME IMMAGINE, OPACITA' E DIMENSIONE DELL'IMMAGINE
class monster {
    var imageMonster : String
    var opac : Double
    var dim : Double
    init(imageMonster: String, opac: Double, dim: Double){
        self.imageMonster = imageMonster
        self.opac = opac
        self.dim = dim
    }
    //FUNZIONE APPARI CHE USIAMO NELLA CLASSE PUNTEGGIO
    func appear(){
        opac = 1.0;
    }
}

//VENGONO CREATI I 9 OGGETTI MOSTRO
var monster1 = monster(imageMonster: "1", opac: 0, dim:0.2)
var monster2 = monster(imageMonster: "2", opac: 0, dim:0.2)
var monster3 = monster(imageMonster: "3", opac: 0, dim:0.2)
var monster4 = monster(imageMonster: "4", opac: 0, dim:0.2)
var monster5 = monster(imageMonster: "5", opac: 0, dim:0.2)
var monster6 = monster(imageMonster: "6", opac: 0, dim:0.2)
var monster7 = monster(imageMonster: "7", opac: 0, dim:0.2)
var monster8 = monster(imageMonster: "8", opac: 0, dim:0.2)
var monster9 = monster(imageMonster: "9", opac: 0, dim:0.2)

//INIZIALIZZO LA VARIABILE PUNTEGGIO
var points = punti(punteggio: 1000)

struct Collection: View {
    
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
       
//
//        VStack{
//
//
//
//
//        } //:VStack
        
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
            }
            
            //COLORE SFONDO
            Color.white.ignoresSafeArea()
            
            //GRIGLIA MOSTRI
            ScrollView {
            LazyVGrid(columns: columns, spacing: 0){
                ForEach((0..<9)) { index in
                    Image(mostri[index].imageMonster)
                        .scaleEffect(mostri[index].dim)
                        .opacity(mostri[index].opac)
                        .padding(-120)
                }
                
            }
        }.zIndex(1)

            //GRIGLIA QUADRATINI
            ScrollView {
            LazyVGrid(columns: columns, spacing: 0){
                ForEach(0..<9) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.white).frame(width: 90, height: 90)
                        .shadow(radius: 10)
                       .padding(75)
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
