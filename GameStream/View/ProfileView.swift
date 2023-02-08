//
//  ProfileView.swift
//  GameStream
//
//  Created by Martin Ballester on 06/02/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State var userName = "Martin"
    @State var imageProfile:UIImage = UIImage(named: "profileImage")!
    
    
    var body: some View {
        ZStack{
            Color("marine-blue").ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
            VStack{
                
                Image(uiImage: imageProfile)
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
                
                if returnUiImage(name: "profileImage") != nil {
                    imageProfile = returnUiImage(name: "profileImage")!
                }else{
                    print("no se encontro la imagen de perfil")
                }
                
                if UserDefaults.standard.object(forKey: "userData") != nil {
                    userName = UserDefaults.standard.stringArray(forKey: "userData")![2]
                }else{
                    print("No se encontro la informacion del usuario")
                }
            }
            
        )
    }
    
    func returnUiImage(name:String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false){
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(name).path)
        }
        
        return nil
            
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
                        .font(.body)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right").foregroundColor(.white)
                }.padding()
            }).background(Color("blue-gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            Button(action: {}, label: {
                HStack{
                    Text("Notificaciones")
                        .foregroundColor(.white)
                        .font(.body)
                    
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
                        .font(.body)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right").foregroundColor(.white)
                }.padding()
            }).background(Color("blue-gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            Button(action: {}, label: {
                HStack{
                    Text("Califica esta aplicacion")
                        .foregroundColor(.white)
                        .font(.body)
                    
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
