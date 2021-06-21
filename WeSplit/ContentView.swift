

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: String = ""
    @State private var tipIndex: Int = 2
    @State private var peopleAmount: Int = 2
    let tipAmount = [10, 15, 20, 25, 0]
    
    var body: some View {
      
        Form {
            Section {
                TextField ("Enter the cost of food", text: $checkAmount)
                    .keyboardType(.decimalPad)
            }
            Section {
                Text("Check Amount: $\(checkAmount)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        
        ContentView()
            .preferredColorScheme(.dark)
    }
}
