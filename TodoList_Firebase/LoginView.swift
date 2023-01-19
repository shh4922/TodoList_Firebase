//
//  LoginView.swift
//  TodoList_Firebase
//
//  Created by HyeonHo on 2023/01/18.
//

import SwiftUI
import Firebase
struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLogin = false
    var body: some View {
        if userIsLogin {
            ListView()
        }else{
            content
        }
    }
    var content : some View{
        VStack(spacing: 15){
            Text("로그인")
                .font(.largeTitle)
                .fontWeight(.black)
                .frame(height: 50)
                .cornerRadius(12)
            TextField("Email",text: $email)
                .frame(width: 350,height: 40)
                .padding(10)
                .background(.black.opacity(0.05))
                .textFieldStyle(.plain)
                .cornerRadius(12)
            SecureField("Password", text: $password)
                .frame(width: 350,height: 40)
                .padding(10)
                .background(.black.opacity(0.05))
                .textFieldStyle(.plain)
                .cornerRadius(12)
                
            
            Button(action: {Login()}){
                Text("확인")
                    .fontWeight(.medium)
                    .frame(width: 200,height: 50)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
            }
            
            Button(action: {register()}){
                Text("가입하기")
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .onAppear{
            Auth.auth().addStateDidChangeListener{ auth, user in
                if user != nil{
                    userIsLogin.toggle()
                }
            }
        }
    }
    
    func Login(){
        Auth.auth().signIn(withEmail: email, password: password){ result , error in
            if error != nil {
                print(error!.localizedDescription)
            }
            
        }
    }
    func register(){
        Auth.auth().createUser(withEmail: email, password: password){ result , error in
            if error != nil {
                print(error!.localizedDescription)
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
