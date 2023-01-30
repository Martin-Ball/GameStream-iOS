//
//  Home.swift
//  GameStream
//
//  Created by Martin Ballester on 29/01/2023.
//

import SwiftUI

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
            
            Text("Pantalla Juegos")
                .font(.system(size: 30, weight: .bold, design: .rounded))
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
    
            }.padding(.horizontal, 18)
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
    
    func search(){
        print("El usuario esta buscando: \(searchText)")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
