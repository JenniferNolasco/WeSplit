

import SwiftUI

struct ContentView: View {
    @State private var billAmount: String = ""
    @State private var tipIndex: Int = 2
    @State private var peopleAmount: Int = 0
    let tipAmount = [10, 15, 20, 25, 0]
    
    var checkTotal: Double {
        let tipPercentage = Double(tipAmount[tipIndex]) / 100
        let billPrice = Double(billAmount) ?? 0
        let addTip = Double(billPrice * tipPercentage)
        
        return billPrice + addTip
    }
    
    var checkAmount: Double {
        let peopleCount = Double(peopleAmount + 2)
        let tipPercentage = Double(tipAmount[tipIndex]) / 100
        let billPrice = Double(billAmount) ?? 0
        let addTip = Double((billPrice / peopleCount) * tipPercentage)
        
        return (billPrice / peopleCount) + addTip
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField ("Bill Amount", text: $billAmount)
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
                Section(header: Text("Total Check with tip")) {
                    Text("$\(checkTotal, specifier: "%.2f")")
                }
                Section(header: Text("Amount per person")) {
                    Text("$\(checkAmount, specifier: "%.2f")")
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
