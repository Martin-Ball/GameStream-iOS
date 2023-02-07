//
//  FavoritesView.swift
//  GameStream
//
//  Created by Martin Ballester on 06/02/2023.
//

import SwiftUI
import AVKit

struct FavoritesView: View {
    @ObservedObject var allGames = ViewModel()
    
    var body: some View {
        
        ZStack{
            Color("marine-blue").ignoresSafeArea()
            
            VStack{
                Text("FAVORITOS")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 9.0)
                
                ScrollView{
                    
                    ForEach(allGames.gamesInfo, id: \.self) {
                        game in
                        
                        VStack(spacing: 0) {
                            VideoPlayer(player: AVPlayer(url: URL(string: game.videosUrls.mobile!)!))
                                .frame(height: 300)
                            
                            Text("\(game.title!)")
                                .foregroundColor(Color.white)
                                .font(.title2)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color("blue-gray"))
                                .clipShape(RoundedRectangle(cornerRadius: 3.0))
                        }
                        
                    }
                    
                }.padding(.bottom, 8)
            }.padding(.horizontal, 6)
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
