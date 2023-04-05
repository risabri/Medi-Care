import SwiftUI

struct HomePageView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to Mediconnect!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(8)
                }
                .padding()

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
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}

