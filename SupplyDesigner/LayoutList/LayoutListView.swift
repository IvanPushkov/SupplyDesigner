//
//  ContentView.swift
//  SupplyDesigner
//
//  Created by Ivan on 07.09.2025.
//

import SwiftUI

struct LayoutListView: View {
  @StateObject var model = LayoutListVM()
  @State private var createNewProject: Bool = false
  
    var body: some View {
        NavigationStack{
          List{
            ForEach(model.state.layouts, id: \.self) { layout in
              Text(layout.name)
                .onLongPressGesture {
                  model.state.layoutToDelete = layout
                }
            }
          }
          .actionSheet(isPresented: .constant(model.state.layoutToDelete != nil), content: {
            ActionSheet(title: Text("Удалить проект"), message: nil, buttons: [
              Alert.Button.destructive(Text("Удалить"), action: {model.remooveItem(layout: model.state.layoutToDelete)})
              
              ,
              Alert.Button
                .cancel(Text("Отмена"), action: {model.state.layoutToDelete = nil})
            ])
          })
          .navigationTitle(Text("Мои проекты"))
          .navigationBarTitleDisplayMode(.large)
        .toolbar(content: {
          ToolbarItem(placement: .primaryAction) {
            Button( action: { createNewProject.toggle() }, label: {
              NavigationLink(destination: NewProjectView()) {
                Image(systemName: "plus")
                  .font(.headline)
              }

            })
          }
        })
        }
    }
}


#Preview {
  LayoutListView()
}
