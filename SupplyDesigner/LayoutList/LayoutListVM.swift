
import SwiftUI

class LayoutListVM: ObservableObject {
  @Published var state: State = .init()
  
  struct State {
    var layoutToDelete: rowModel?
    var layouts: [rowModel] = (0...10).map { rowModel(name: "Item \($0)") }
  }
  func remooveItem(layout: rowModel?){
    guard let layout else { return }
    state.layouts = state.layouts.filter { $0 != layout }
    state.layoutToDelete = nil
  }
}

struct rowModel: Hashable{
  var name: String
  var image: UIImage? = nil
  
}
