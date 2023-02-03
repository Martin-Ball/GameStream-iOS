//
//  GamesView.swift
//  GameStream
//
//  Created by Martin Ballester on 31/01/2023.
//

import SwiftUI
import Kingfisher

struct GamesView: View {
    
    @ObservedObject var allVideoGames = ViewModel()
    @State var gameViewIsActive : Bool = false
    @State var url:String = ""
    @State var title : String = ""
    @State var studio : String = ""
    @State var calification : String = ""
    @State var publicationYear : String = ""
    @State var description : String = ""
    @State var tags : [String] = [""]
    @State var imgsUrl : [String] = [""]
    
    let shapeGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack{
            
            Color("marine-blue").ignoresSafeArea()
            
            VStack{
                Text("JUEGOS")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                
                ScrollView{
                    LazyVGrid(columns: shapeGrid, spacing: 8){
                        ForEach(allVideoGames.gamesInfo, id: \.self ){
                            game in
                            
                            NavigationLink(destination: GameView(url: game.videosUrls.mobile!, title: game.title!, studio: game.studio!, calification: game.contentRaiting!, publicationYear: game.publicationYear!, description: game.description!, tags: game.tags!, imgsUrl: game.galleryImages!), label: {
                                VStack
                                {
                                    AsyncImage( url: URL( string: game.galleryImages![0])!)
                                    { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .clipShape(RoundedRectangle(cornerRadius: 11))
                                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                        
                                    } placeholder: {
                                        EmptyView()
                                    }
                                    
                                }})
                       }
                    }
                    
                    
                }
            }.padding(.horizontal, 6.0)
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
                perform: {
//                    print("primer elemento del json : \(allVideoGames.gamesInfo[0])")
//                    print("Titulo del primer videojuego del json \(String(describing: allVideoGames.gamesInfo[0].title))")
                })
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
