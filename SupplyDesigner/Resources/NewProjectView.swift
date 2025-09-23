//
//  NewProjectView.swift
//  SupplyDesigner
//
//  Created by Ivan on 13.09.2025.
//

import SwiftUI

public struct NewProjectView: View {
  @Environment(\.dismiss) private var dismiss
  @StateObject private var model = LayoutVM()
  public var body: some View {
    VStack(alignment: .center){
      TextField("Имя проекта", text: $model.state.name)
      if let image = model.state.image {
        Image(uiImage: image)
      } else {
        Button(action: {model.state.showUploadImage = true},
               label: {Text("Загрузить изображение")})
      }
      Spacer()
    }
    .alert(isPresented: $model.state.showUploadImage) {
      Alert(title: Text("Загрузить изображеие"), dismissButton:  Alert.Button.cancel() )
    }
    
    .navigationTitle(Text("Редактирование"))
    .toolbar(content: {
      ToolbarItem(placement: .primaryAction) {
        Button( action: { model.saveNewProject() }, label: {
            Text("Сохранить")
          })
        }
      })
    .padding()
  }
}

class LayoutVM: ObservableObject {
  @Published var state: State = .init()
  struct State {
    var showUploadImage: Bool = false
    var name: String = ""
    var image: UIImage?
  }
  func saveNewProject(){
    
  }
  
}
#Preview {
  NewProjectView()
}
