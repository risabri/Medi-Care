import SwiftUI

struct MediInfoThreeView: View {
    let numberOfMedicines: Int
    let frequencies: [Int]
    @State private var medicineSchedules: [[(day: Int, time: Date)]] = []
    
    private let daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    init(numberOfMedicines: Int, frequencies: [Int]) {
        self.numberOfMedicines = numberOfMedicines
        self.frequencies = frequencies
        _medicineSchedules = State(initialValue: Array(repeating: [], count: numberOfMedicines))
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                Text("Medicine Schedule")
                    .font(.title)
                    .padding(.bottom, 20)
                
                ForEach(0..<numberOfMedicines, id: \.self) { medicineIndex in
                    medicineView(medicineIndex: medicineIndex)
                }
                
                Spacer()
                
                    .padding()
                    .navigationBarTitle("Medicine Info", displayMode: .inline)
                
                
                NavigationLink(destination: DashboardView()) {
                    Text("Dashboard")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
            }
        
    }
   }
    
    func medicineView(medicineIndex: Int) -> some View {
        VStack {
            Text("Medicine \(medicineIndex + 1)")
                .font(.headline)
                .padding(.bottom, 20)

            ForEach(0...frequencies[medicineIndex], id: \.self) { _ in
                scheduleView(medicineIndex: medicineIndex)
            }
        }
    }
    
    func scheduleView(medicineIndex: Int) -> some View {
        HStack {
            Picker("Day", selection: Binding<Int>(
                get: { self.medicineSchedules[medicineIndex].last?.day ?? 0 },
                set: { newValue in
                    if let lastIndex = self.medicineSchedules[medicineIndex].indices.last {
                        self.medicineSchedules[medicineIndex][lastIndex].day = newValue
                    } else {
                        self.medicineSchedules[medicineIndex].append((day: newValue, time: Date()))
                    }
                }
            )) {
                ForEach(0..<7) { i in
                    Text("\(daysOfWeek[i])")
                }
            }
            .pickerStyle(MenuPickerStyle())

            DatePicker("Time", selection: Binding<Date>(
                get: { self.medicineSchedules[medicineIndex].last?.time ?? Date() },
                set: { newValue in
                    if let lastIndex = self.medicineSchedules[medicineIndex].indices.last {
                        self.medicineSchedules[medicineIndex][lastIndex].time = newValue
                    } else {
                        self.medicineSchedules[medicineIndex].append((day: 0, time: newValue))
                    }
                }
            ), displayedComponents: .hourAndMinute)
        }
    }
}

struct MediInfoThreeView_Previews: PreviewProvider {
    static var previews: some View {
        MediInfoThreeView(numberOfMedicines: 2, frequencies: [2, 1])
    }
}

