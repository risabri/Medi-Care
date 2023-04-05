import SwiftUI

struct MediInfoOneView: View {
    @State private var numberOfMedicines = 0

    var body: some View {
        VStack {
            Text("How many medicines are you taking?")
                .font(.title)
                .padding(.bottom, 20)

            Picker("Number of Medicines", selection: $numberOfMedicines) {
                ForEach(0..<10) { i in
                    Text("\(i)")
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(maxWidth: .infinity, maxHeight: 150)
            .padding(.bottom, 40)

            NavigationLink(destination: MediInfoTwoView(numberOfMedicines: numberOfMedicines)) {
                Text("Continue")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .background(Color.blue)
                    .cornerRadius(8)
            }

            Spacer()
        }
        .navigationBarTitle("Medicine Info", displayMode: .inline)
    }
}

struct MediInfoOneView_Previews: PreviewProvider {
    static var previews: some View {
        MediInfoOneView()
    }
}

