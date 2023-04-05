import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var phoneNumber = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                VStack(alignment: .leading) {
                    TextField("Email", text: $email)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    SecureField("Password", text: $password)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    TextField("Phone Number", text: $phoneNumber)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    NavigationLink(destination: ContentView()) {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding()
                }
                .padding()
            }
            .padding()
            .navigationBarTitle("Sign Up", displayMode: .inline)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

