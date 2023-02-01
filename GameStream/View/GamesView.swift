//
//  GamesView.swift
//  GameStream
//
//  Created by Martin Ballester on 31/01/2023.
//

import SwiftUI

struct GamesView: View {
    
    @ObservedObject var allVideoGames = ViewModel()
    @State var gameViewIsActive : Bool = false
    @State var url:String = ""
    @State var title : String = ""
    @State var studio : String = ""
    @State var calification : String = ""
    @State var publicationYear : String = ""
    @State var tags : [String] = [""]
    @State var imgsUrl : [String] = [""]
    
    let shapeGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack{
            
            Color("blue-gray").ignoresSafeArea()
            
            VStack{
                Text("JUEGOS")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                
                ScrollView{
                    
                }
            }.padding(.horizontal, 6.0)
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
                perform: {
                    print("primer elemento del json : \(allVideoGames.gamesInfo[0])")
                    print("Titulo del primer videojuego del json \(allVideoGames.gamesInfo[0].title)")
                }
            )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
