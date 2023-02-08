//
//  SaveData.swift
//  GameStream
//
//  Created by Martin Ballester on 08/02/2023.
//

import Foundation

class SaveData {
    var email:String = ""
    var password:String = ""
    var name:String = ""
    
    func saveData(email:String, password:String, name:String) -> Bool {
        print("Funcion save data \(email) + \(password) + \(name)")
        
        UserDefaults.standard.set([email, password, name], forKey: "userData")
        return true
    }
    
    func getData() -> [String] {
        let userData:[String] = UserDefaults.standard.stringArray(forKey: "userData")!
        
        return userData
    }
    
    func validate(email:String, password:String) -> Bool {
        var emailSaved = ""
        var passSaved = ""
        
        if UserDefaults.standard.object(forKey: "userData") != nil {
            emailSaved = UserDefaults.standard.stringArray(forKey: "userData")![0]
            passSaved = UserDefaults.standard.stringArray(forKey: "userData")![1]
            
            if (email == emailSaved && password == passSaved){
                return true
            }else{
                return false
            }
        }else{
            print("no existen datos")
            return false
        }
    }
}
