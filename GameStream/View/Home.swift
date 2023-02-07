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
            
            FavoritesView()
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
    
    
    var body: some View {
        ZStack{
            
            Color("marine-blue").ignoresSafeArea()
            
            VStack{
                Image("appLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.horizontal, 11.0)
                
                
                
                ScrollView(showsIndicators:false){
                    SubModuleHome()
                }
    
            }.padding(.horizontal, 18)
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct SubModuleHome:View{
    
    @State var searchText = ""
    @State var isGameInfoEmpty = false
    
    @ObservedObject var gameFound = SearchGame()
    @State var isGameViewActive = false
    
    @State var url:String = ""
    @State var title : String = ""
    @State var studio : String = ""
    @State var calification : String = ""
    @State var publicationYear : String = ""
    @State var description : String = ""
    @State var tags : [String] = [""]
    @State var imgsUrl : [String] = [""]
    
    
    
    var body: some View{
        
        VStack {
            
            HStack{
                
                Button(action: {
                    watchGame(searchText: searchText)
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(searchText.isEmpty ? Color(.yellow) : Color("dark-cian"))
                }).alert(isPresented: $isGameInfoEmpty){
                    Alert(title: Text("Error"), message: Text("No se encontro el juego"), dismissButton: .default(Text("Entendido")))
                }
                
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
            
            Text("LOS MAS POPULARES")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top, 25)
            
            ZStack{
                
                Button(action: {
                    watchGame(searchText: "The Witcher")
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
                        watchGame(searchText: "Abzu")
                    }, label: {
                        Image("Abzu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                    
                    Button(action: {
                        watchGame(searchText: "Crash Bandicoot")
                    }, label: {
                        Image("Crash Bandicoot")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                    
                    Button(action: {
                        watchGame(searchText: "DEATH STRANDING")
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
                        watchGame(searchText: "Cuphead")
                        
                    }, label: {
                        Image("13-swiftuiapps-2105-lastofus").resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                    
                    Button(action: {
                        watchGame(searchText: "Hades")
                        
                    }, label: {
                        Image("13-swiftuiapps-2105-destiny_complete").resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                    
                    Button(action: {
                        watchGame(searchText: "Grand Theft Auto V")
                        
                    }, label: {
                        Image("13-swiftuiapps-2105-spiderman").resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                        
                    })
                }
            }
            
        }
        
        NavigationLink( "", destination: GameView(url: url, title: title, studio: studio, calification: calification, publicationYear: publicationYear, description: description, tags: tags, imgsUrl: imgsUrl),
                       isActive: $isGameViewActive)
    }
    
    func watchGame(searchText:String) {
        gameFound.search(gameName: searchText)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3, execute: {
            print("CANTIDAD ENCONTRADA: \(gameFound.gameInfo.count)")
            
            if gameFound.gameInfo.count == 0 {
                isGameInfoEmpty = true
            }else{
                url = gameFound.gameInfo[0].videosUrls.mobile!
                title = gameFound.gameInfo[0].title!
                studio = gameFound.gameInfo[0].studio!
                calification = gameFound.gameInfo[0].contentRaiting!
                publicationYear = gameFound.gameInfo[0].publicationYear!
                description = gameFound.gameInfo[0].description!
                tags = gameFound.gameInfo[0].tags!
                imgsUrl = gameFound.gameInfo[0].galleryImages!
                
                isGameViewActive = true
            }
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
