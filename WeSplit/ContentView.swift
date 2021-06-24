

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: String = ""
    @State private var tipIndex: Int = 2
    @State private var peopleAmount: Int = 2
    let tipAmount = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField ("Bill Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker ("Number of People", selection: $peopleAmount) {
                        ForEach (2..<101) { people in
                            Text("\(people) people")
                        }
                    }
                }
                Section(header: Text("Tip Amount")) {
                    Picker("Tip percentage", selection: $tipIndex) {
                        ForEach (0..<tipAmount.count) {value in
                            Text("\(tipAmount[value])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("Check Amount: $\(checkAmount)")
                }
            }
            .navigationBarTitle("We Split")
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
