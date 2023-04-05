import SwiftUI

struct ContentView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var dateOfBirth = Date()
    @State private var alias = ""
    @State private var image: UIImage?

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Personal Information")) {
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lastName)
                        DatePicker("Date of Birth", selection: $dateOfBirth, displayedComponents: .date)
                        TextField("Alias", text: $alias)

                        Button(action: {
                            // Implement your image picker here
                        }) {
                            Text("Upload a picture")
                        }
                    }
                }

                HStack {
                    Spacer()

                    NavigationLink(destination: ProfileView(firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth, alias: alias, image: image)) {
                        Text("View Profile")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }

                    Spacer()

                    NavigationLink(destination: MediInfoOneView()) {
                        Text("Next")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(8)
                    }

                    Spacer()
                }
                .padding(.top)
            }
            .navigationBarTitle("Sign Up", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

