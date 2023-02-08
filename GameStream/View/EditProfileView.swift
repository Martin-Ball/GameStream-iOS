//
//  EditProfileView.swift
//  GameStream
//
//  Created by Martin Ballester on 06/02/2023.
//

import SwiftUI

struct EditProfileView: View {
    
    @State var profileImage:Image? = Image("perfilEjemplo")
    @State var isCameraActive:Bool = false
    var body: some View {
        ZStack{
            Color("marine-blue").ignoresSafeArea()
            
            ScrollView{
                
                VStack{
                    
                    Button(action: {isCameraActive = true}, label: {
                        
                        ZStack{
                            profileImage!
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 118, height: 118)
                                .clipShape(Circle())
                                .sheet(isPresented: $isCameraActive, content: { SUImagePickerView(sourceType: .photoLibrary, image: self.$profileImage, isPresented: self.$isCameraActive)
                                })
                            
                            
                            Image(systemName: "camera").foregroundColor(.white)
                        }
                    })
                }.padding(.bottom, 18)
                
                EditModule()
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}

struct EditModule : View {
    @State var email:String = ""
    @State var password:String = ""
    @State var userName:String = ""
    
    var body : some View {
        VStack(alignment: .leading){
            Text("Correo electronico").foregroundColor(Color("dark-cian"))
            
            ZStack(alignment: .leading){
                
                if email.isEmpty {
                    Text(verbatim: "ejemplo@gmail.com")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                TextField("", text: $email)
                    .foregroundColor(.white)
            }
            
            Divider().frame(height: 1)
                .background(Color("dark-cian"))
                .padding(.bottom)
            
            Text("Contraseña")
                .foregroundColor(.white)
            
            ZStack(alignment: .leading){
                
                if password.isEmpty {
                    Text("Escribe tu contraseña").font(.caption)
                        .foregroundColor(.gray)
                }
                
                TextField("", text: $password)
                    .foregroundColor(.white)
            }
            
            Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
            
            Text("Nombre")
                .foregroundColor(.white)
            
            ZStack(alignment: .leading){
                
                if userName.isEmpty {
                    Text("Introduce tu nombre de usuario").font(.caption)
                        .foregroundColor(.gray)
                }
                
                TextField("", text: $userName)
                    .foregroundColor(.white)
            }
            
            Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom, 32)
            
            Button(action: {updateData()}, label: {
                Text("ACTUALIZAR DATOS")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                    .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"), lineWidth: 1.0).shadow(color: .white, radius: 6))
            })
            
        }.padding(.horizontal, 42)
    }
    
    func updateData(){
        let objectUpdateData = SaveData()
        let result = objectUpdateData.saveData(email: email, password: password, name: userName)
        
        
    }
}
