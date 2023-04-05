import SwiftUI

struct MediInfoTwoView: View {
    let numberOfMedicines: Int
    @State private var frequencies: [Int] = []

    var body: some View {
        VStack {
            Text("Medicine Frequency")
                .font(.title)
                .padding(.bottom, 20)

            ForEach(0..<numberOfMedicines, id: \.self) { index in
                HStack {
                    Text("How frequently do you take medicine \(index + 1)?")
                        .font(.callout)
                        .padding(.bottom, 10)

                    Picker("Frequency", selection: Binding<Int>(
                        get: { self.frequencies.indices.contains(index) ? self.frequencies[index] : 0 },
                        set: { newValue in
                            if self.frequencies.indices.contains(index) {
                                self.frequencies[index] = newValue
                            } else {
                                self.frequencies.append(newValue)
                            }
                        }
                    )) {
                        ForEach(1..<8) { i in
                            Text("\(i) times a day")
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
            }
            
            NavigationLink(destination: MediInfoThreeView(numberOfMedicines: numberOfMedicines, frequencies: frequencies)) {
                Text("Continue")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .background(Color.blue)
                    .cornerRadius(8)
            }

            
            
            

            Spacer()
        }
        .padding()
        .navigationBarTitle("Medicine Info", displayMode: .inline)
    }
}

struct MediInfoTwoView_Previews: PreviewProvider {
    static var previews: some View {
        MediInfoTwoView(numberOfMedicines: 2)
    }
}

