//
//  NewDogView.swift
//  TodoList_Firebase
//
//  Created by HyeonHo on 2023/01/19.
//

import SwiftUI

struct NewDogView: View {
    @EnvironmentObject var dataManager : DataManager
    @State private var newDog = ""
    
    var body: some View {
        VStack{
            TextField("Dog",text: $newDog)
            Button(action: {
                dataManager.addDog(dogBread: newDog)
            }){
                Text("저장")
            }
        }//Vstack
        .padding()
        
    }
}

struct NewDogView_Previews: PreviewProvider {
    static var previews: some View {
        NewDogView()
    }
}
