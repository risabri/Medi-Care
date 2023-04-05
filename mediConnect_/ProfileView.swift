
import SwiftUI

struct ProfileView: View {
    var firstName: String
    var lastName: String
    var dateOfBirth: Date
    var alias: String
    var image: UIImage?

    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .padding()
            } else {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding()
            }

            VStack(alignment: .leading) {
                Text("Name: \(firstName) \(lastName)")
                Text("Alias: \(alias)")
                Text("Date of Birth: \(formattedDateOfBirth())")
            }
            .padding()

            Spacer()
        }
        .navigationBarTitle("Profile", displayMode: .inline)
    }

    private func formattedDateOfBirth() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: dateOfBirth)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(firstName: "John", lastName: "Doe", dateOfBirth: Date(), alias: "johndoe", image: nil)
    }
}
