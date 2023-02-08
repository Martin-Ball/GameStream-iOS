//
//  ProfileView.swift
//  GameStream
//
//  Created by Martin Ballester on 06/02/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State var userName = "Martin"
    
    
    var body: some View {
        ZStack{
            Color("marine-blue").ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
            VStack{
                
                Text("Perfil")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,
                           alignment: .center)
                    .padding()
                
                VStack{
                    Image("perfilEjemplo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118, height: 118)
                        .clipShape(Circle())
                }.padding(EdgeInsets(top:16, leading:0, bottom: 32, trailing: 0))
                
                Text("AJUSTES")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,
                           alignment: .leading)
                    .padding(.leading, 18)
                
                SettingsModule()
                    
            }
        }.onAppear(
        
            perform: {
                print("Revisando informacion del usuario")
            }
            
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct SettingsModule : View {
    
    @State var isToggleOn : Bool = true
    @State var isEditProfileViewActive = false
    
    var body : some View {
        VStack{
            
            Button(action: {}, label: {
                HStack{
                    Text("Cuenta")
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right").foregroundColor(.white)
                }.padding()
            }).background(Color("blue-gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            Button(action: {}, label: {
                HStack{
                    Text("Notificaciones")
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Toggle("", isOn: $isToggleOn)
                }.padding()
            }).background(Color("blue-gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            Button(action: {
                isEditProfileViewActive = true
            }, label: {
                HStack{
                    Text("Editar perfil")
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right").foregroundColor(.white)
                }.padding()
            }).background(Color("blue-gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            Button(action: {}, label: {
                HStack{
                    Text("Califica esta aplicacion")
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right").foregroundColor(.white)
                }.padding()
            }).background(Color("blue-gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            NavigationLink(destination: EditProfileView(), isActive: $isEditProfileViewActive, label: {
                EmptyView()
            })
            
        }
    }
}
