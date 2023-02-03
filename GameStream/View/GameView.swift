//
//  GameView.swift
//  GameStream
//
//  Created by Martin Ballester on 02/02/2023.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    
    var url:String
    var title : String
    var studio : String
    var calification : String
    var publicationYear : String
    var description : String
    var tags : [String]
    var imgsUrl : [String]
    
    var body: some View {
        ZStack{
            Color("marine-blue").ignoresSafeArea()
            
            VStack{
                VideoView(url: url).frame(height:300)
                
                ScrollView{
                    
                    //Info at video
                    VideoInfo(title: title, studio: studio, calification: calification, publicationYear: publicationYear, description: description, tags: tags).padding(.bottom)
                    
                    Gallery(imgsUrl: imgsUrl)
                    
                    Comments()
                    
                }.frame(maxWidth: .infinity)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(url: "ejemplo",title:"Sonic The Hedgehog"
            ,studio:"Sega"
            ,calification:"E+"
            ,publicationYear:"1991"
            ,description:"Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente"
            ,tags:["plataformas","mascota"], imgsUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])
    }
}

struct VideoView : View {
    
    var url:String
    
    var body : some View {
        VideoPlayer(player: AVPlayer(url: URL(string: url)!)).ignoresSafeArea()
    }
}

struct VideoInfo : View {
    
    var title : String
    var studio : String
    var calification : String
    var publicationYear : String
    var description : String
    var tags : [String]
    
    var body : some View{
        VStack(alignment: .leading){
            
            Text("\(title)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .bold()
                .padding(.leading)
            
            HStack{
                
                Text("\(studio)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                
                Text("\(calification)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                
                Text("\(publicationYear)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
            }
            
            Text("\(description)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top, 5)
                .padding(.leading)
            
            HStack{
                
                ForEach(tags, id: \.self){
                    tag in
                    
                    Text("#\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top, 5)
                        .padding(.leading)
                }
            }
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct Gallery : View {
    
    var imgsUrl:[String]
    
    let shapeGrid = [
        GridItem(.flexible())
    ]
    
    var body: some View{
        
        VStack(alignment: .leading){
            
            Text("GALERIA")
                .foregroundColor(.white)
                .font(.title)
                .bold()
                .padding(.leading)
            
            ScrollView(.horizontal){
                LazyHGrid(rows: shapeGrid, spacing: 8){
                    
                    ForEach(imgsUrl, id: \.self){
                        
                        imgUrl in
                        
                        //Deploy images of server with url
                        KFImage(URL(string: imgUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                    }
                    
                }
            }.frame(height: 180)
            
        }.frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct Comments: View{
    
    var body: some View{
        VStack(alignment: .leading){
            Text("COMENTARIOS")
                .foregroundColor(.white)
                .font(.title2)
                .padding(.leading)
                .padding(.bottom)
                .padding(.top)
            
            
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("Comments"))
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .padding()
                VStack(alignment: .leading){
                    HStack{
                        Image("profile")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60, alignment: .center
                            )
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading){
                            Text("Mr Bean")
                                .font(.title3)
                                .foregroundColor(.white)
                            Text("Hace 12 días")
                                .foregroundColor(.white)
                        }
                    }
                    
                    Text("He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.")
                        .foregroundColor(.white)
                    
                    Spacer()
                }.padding(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30))
            }
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}
