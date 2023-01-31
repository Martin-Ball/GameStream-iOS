//
//  Home.swift
//  GameStream
//
//  Created by Martin Ballester on 29/01/2023.
//

import SwiftUI
import AVKit

struct Home: View {
    
    @State var tabSelected : Int = 2
    
    var body: some View {
        
        TabView(selection: $tabSelected){
            
            Text("Pantalla Perfil")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem{
                    
                    Image(systemName: "person")
                    Text("Perfil")
                    
                }.tag(0)
            
            GamesView()
                .tabItem{
                    
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                    
                }.tag(1)
            
            homeView()
                .tabItem{
                    
                    Image(systemName: "house")
                    Text("Inicio")
                    
                }.tag(2)
            
            Text("Pantalla Favoritos")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem{
                    
                    Image(systemName: "heart")
                    Text("Favoritos")
                    
                }.tag(3)
        }
        .accentColor(.white)
        
        
    }
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("navBarColour"))
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        
        print("init views home")
    }
}

struct homeView:View{
    @State var searchText = ""
    
    var body: some View {
        ZStack{
            
            Color("marine-blue").ignoresSafeArea()
            
            VStack{
                Image("appLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.horizontal, 11.0)
                
                HStack{
                    
                    Button(action: {
                        search()
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(searchText.isEmpty ? Color(.yellow) : Color("dark-cian"))
                    })
                    
                    ZStack(alignment: .leading){
                        if searchText.isEmpty {
                            Text("Buscar un video")
                                .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                        }
                        
                        TextField("", text: $searchText).foregroundColor(.white)
                    }
                    
                }.padding([.top, .leading, .bottom], 11.0)
                    .background(Color("blue-gray"))
                    .clipShape(Capsule())
                
                ScrollView(showsIndicators:false){
                    SubModuleHome()
                }
    
            }.padding(.horizontal, 18)
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
    
    func search(){
        print("El usuario esta buscando: \(searchText)")
    }
}

struct SubModuleHome:View{
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    
    @State var isPlayerActive = false
        let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View{
        VStack {
            Text("LOS MAS POPULARES")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top, 25)
            
            ZStack{
                
                Button(action: {
                    url = urlVideos[0]
                    print("URL: \(url)")
                    isPlayerActive = true
                }, label: {
                    VStack(spacing: 0){
                        Image("13-swiftuiapps-2105-thewitcher")
                            .resizable()
                            .scaledToFill()
                        
                        Text("The Witcher 3")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .background(Color("blue-gray"))
                    }
                })
                
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)
                
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .padding(.vertical)
            
            Text("CATEGORIAS SURGERIDAS PARA TI")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top, 25)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Button(action: {
                        print("BUTON fps")
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blue-gray"))
                                .frame(width: 160, height: 90)
                            
                            Image("fps")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                        }
                    })
                    
                    Button(action: {
                        print("BUTON rpg")
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blue-gray"))
                                .frame(width: 160, height: 90)
                            
                            Image("rpg-icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                        }
                    })
                    
                    Button(action: {
                        print("BUTON open world")
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blue-gray"))
                                .frame(width: 160, height: 90)
                            
                            Image("open-world-icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                        }
                    })
                }
            }
            
            Text("RECOMENDADOS PARA TI")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top, 25)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Button(action: {
                        url = urlVideos[1]
                        print("URL: \(url)")
                        isPlayerActive = true
                    }, label: {
                        Image("Abzu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                    
                    Button(action: {
                        url = urlVideos[2]
                        print("URL: \(url)")
                        isPlayerActive = true
                    }, label: {
                        Image("Crash Bandicoot")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                    
                    Button(action: {
                        url = urlVideos[3]
                        print("URL: \(url)")
                        isPlayerActive = true
                    }, label: {
                        Image("DEATH STRANDING")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                }
            }
            
            Text("VIDEOS QUE PODRÍAN GUSTARTE")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top, 25)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack
                {
                    Button(action: {
                        url = urlVideos[4]
                        print("URL: \(url)")
                        isPlayerActive = true
                        
                    }, label: {
                        Image("13-swiftuiapps-2105-lastofus").resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                    
                    Button(action: {
                        url = urlVideos[5]
                        print("URL: \(url)")
                        isPlayerActive = true
                        
                    }, label: {
                        Image("13-swiftuiapps-2105-destiny_complete").resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                    
                    Button(action: {
                        url = urlVideos[6]
                        print("URL: \(url)")
                        isPlayerActive = true
                        
                    }, label: {
                        Image("13-swiftuiapps-2105-spiderman").resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                        
                    })
                }
            }
            
        }
        
        NavigationLink( "", destination: VideoPlayer(player: AVPlayer(url: URL(string: url)!))
            .frame(width: 400, height: 300),
                       isActive: $isPlayerActive)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
