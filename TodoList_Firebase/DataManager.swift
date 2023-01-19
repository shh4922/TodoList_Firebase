
import SwiftUI
import Firebase

// ObservableObject는 뭘까.? 대충 다른 View나 다른 class에서 가져다 쓸수있는 느낌인데
class DataManager : ObservableObject{
    
    // Published 가 뭘까
    @Published var dogs : [Dog] = []
    
    init(){
        fetchDogs()
    }
    
    
    func fetchDogs(){
        dogs.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Dogs")
        
        ref.getDocuments{ snapshot, error in
            // 일단 여기가 이해가안돼
            // nil else는 뭐야?
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            
            //snapshot이 값이 있다면 -> 정상적으로 받아왔다면
            if let snapshot = snapshot {
                for document in snapshot.documents{
                    let data = document.data()
                    
                    //이런 문법은 또 뭐야 as? String ?? "" 이게 뭐지?  
                    let id = data["id"] as? String ?? ""
                    let bread = data["bread"] as? String ?? ""
                    
                    let dog = Dog(id: id, bread: bread)
                    self.dogs.append(dog)
                }
            }
            
        }
    }
    
    func addDog(dogBread : String){
        // db 생성
        let db = Firestore.firestore()
        //db에서 Dogs라는DB접근,
        let ref = db.collection("Dogs").document(dogBread)
        ref.setData(["bread": dogBread, "id" : 10]){ error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
