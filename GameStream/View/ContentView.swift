//
//  ContentView.swift
//  GameStream
//
//  Created by Martin Ballester on 26/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Spacer()
                
                Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0).ignoresSafeArea()
                
                VStack{
                    Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom ,42)
                    
                    initAndRegisterView()
                }
                
            }.navigationBarHidden(true)
        }
    }
}

struct initAndRegisterView:View {
    
    @State var initSessionType = true
    
    var body: some View{
        VStack{
            HStack{
                Spacer()
                
                Button("INICIA SESION", action: {
                    initSessionType = true
                    print("PANTALLA INICIO SESION")
                }).foregroundColor(initSessionType ? .white : .gray)
                
                Spacer()
                
                Button("REGISTRATE", action: {
                    initSessionType = false
                    print("PANTALLA REGISTRATE")
                }).foregroundColor(!initSessionType ? .white : .gray)
                
                Spacer()
            }
            
            Spacer(minLength: 42)
            
            if(initSessionType){
                signInView()
            }else{
                signUpView()
            }
            
            
        }
    }
}

struct signInView:View{
    @State var email = ""
    @State var password = ""
    @State var isHomeViewActive = false
    
    var body:some View {
        
        ScrollView{
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
                
                Text("¿Olvidaste tu contraseña?").font(.footnote).frame(width: 300, alignment: .trailing)
                    .foregroundColor(Color("dark-cian"))
                    .padding(.bottom)
                
                Button(action: login, label: {
                    Text("INICIAR SESION")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"), lineWidth: 1.0).shadow(color: .white, radius: 6))
                })
                
                VStack{
                    
                    
                    Text("Inicia sesion con redes sociales")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.top, 70)
                        .padding(.bottom, 25)
                    
                    HStack{
                        
                        Spacer()
                        
                        Button(action: login, label: {
                            Text("Facebook")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: 125, alignment: .center)
                                .padding(EdgeInsets(top: 9, leading: 9, bottom: 9, trailing: 15))
                                .background(RoundedRectangle(cornerRadius: 6.0).foregroundColor(Color("blue-gray")))
                        })
                        
                        Spacer()
                        
                        Button(action: login, label: {
                            Text("Twitter")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: 125, alignment: .center)
                                .padding(EdgeInsets(top: 9, leading: 9, bottom: 9, trailing: 15))
                                .background(RoundedRectangle(cornerRadius: 6.0).foregroundColor(Color("blue-gray")))
                        })
                        
                        Spacer()
                        
                    }
                }
            }
            
            NavigationLink(destination: Home(), isActive: $isHomeViewActive, label: {
                    EmptyView()
            })
        }.padding(.horizontal, 77.0)
        
        Text("VISTA DE INICIO DE SESION")
    }
    
    func login(){
        print("estoy iniciando sesion")
        
        isHomeViewActive = true
    }
}

struct signUpView:View{
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    var body:some View {
        
        ScrollView{
            
            //Photograph
            VStack(alignment: .center){
                
                Text("Elije una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Puedes cambiar o elegirla mas adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                Button(action: takePhoto, label: {
                    ZStack{
                        Image("perfilEjemplo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                        
                    }
                }).padding(.bottom)
            }
            
            VStack(alignment: .leading){
                
                VStack(alignment: .leading){
                    Text("Correo electronico*")
                        .foregroundColor(Color("dark-cian"))
                        .frame(width: 300, alignment: .leading)
                    
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
                    
                    Text("Contraseña*")
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
                    
                    
                    Text("Confirmar contraseña*")
                        .foregroundColor(.white)
                    
                    ZStack(alignment: .leading){
                        
                        if confirmPassword.isEmpty {
                            Text("Escribe nuevamente tu contraseña").font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        SecureField("", text: $confirmPassword)
                            .foregroundColor(.white)
                    }
                    
                    Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)

                    
                }
                
                
                Button(action: signUp, label: {
                    Text("REGISTRATE")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"), lineWidth: 1.0).shadow(color: .white, radius: 6))
                })
                
                VStack{
                    
                    
                    Text("Registrate con redes sociales")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.top, 40)
                        .padding(.bottom, 25)
                    
                    HStack{
                        
                        Spacer()
                        
                        Button(action: signUp, label: {
                            Text("Facebook")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: 125, alignment: .center)
                                .padding(EdgeInsets(top: 9, leading: 9, bottom: 9, trailing: 15))
                                .background(RoundedRectangle(cornerRadius: 6.0).foregroundColor(Color("blue-gray")))
                        })
                        
                        Spacer()
                        
                        Button(action: signUp, label: {
                            Text("Twitter")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: 125, alignment: .center)
                                .padding(EdgeInsets(top: 9, leading: 9, bottom: 9, trailing: 15))
                                .background(RoundedRectangle(cornerRadius: 6.0).foregroundColor(Color("blue-gray")))
                        })
                        
                        Spacer()
                        
                    }
                }
            }.padding(.horizontal, 77.0)
            
            Text("VISTA DE REGISTRO")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Image("pantalla-2").resizable()
        
        ContentView()
    }
}

func takePhoto(){
    print("Voy a tomar fotografia de perfil")
}

func signUp(){
    print("Registrandose")
}
