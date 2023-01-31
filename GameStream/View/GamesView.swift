//
//  GamesView.swift
//  GameStream
//
//  Created by Martin Ballester on 31/01/2023.
//

import SwiftUI

struct GamesView: View {
    
    @ObservedObject var allVideoGames = ViewModel()
    
    var body: some View {
        Text("Pantalla gamesView")
            .navigationBarHidden(true)
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
