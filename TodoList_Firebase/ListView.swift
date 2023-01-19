
import SwiftUI


struct ListView : View{
    
    // EnviromentObject는 뭘까
    // 느낌은 ObservableObject로 지정한 클래스를 다른곳에서 선언해서 쓸때 사용하는것 같긴해
    @EnvironmentObject var dataManager : DataManager
    @State private var showPopUp = false
    
    var body: some View{
        NavigationView{
            List(dataManager.dogs, id : \.id ){ dog in
                Text(dog.bread)
            }
            .navigationTitle("Dogs")
            .navigationBarItems(
                trailing: Button(
                    action: {
                        showPopUp.toggle()
                    } ,
                    label: {
                        Image(systemName: "plus")
                    }
                )
            )// NavBarItem
            .sheet(isPresented: $showPopUp) { // .sheet 이건 아래서 위로 올라오는 팝업 인것같음 그래서 버튼을누르면 팝업을 보여주는것을 true로 하여 보여주고 그럼 내리면 자동 false되나?
                NewDogView()
            }
        }
    }
}

struct ListView_PreView : PreviewProvider{
    static var previews: some View{
        ListView()
    }
}
