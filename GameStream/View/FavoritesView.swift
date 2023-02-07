//
//  FavoritesView.swift
//  GameStream
//
//  Created by Martin Ballester on 06/02/2023.
//

import SwiftUI

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
                    
                }
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
