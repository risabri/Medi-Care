import SwiftUI

struct ConnectHubView: View {
    
    // Group the users by shared medicine
    var groupedUsers: [Int: [User]] {
        Dictionary(grouping: sampleMatches, by: { $0.sharedMedicine })
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(groupedUsers.keys.sorted(), id: \.self) { key in
                    Section(header: Text("You share with them medicine number \(key)")
                                .padding()
                                .background(Color.blue.opacity(0.3))
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))) {
                        ForEach(groupedUsers[key]!) { user in
                            NavigationLink(destination: MessageView(user: user)) {
                                HStack {
                                    Image(user.profileImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 60, height: 60)
                                        .clipped()
                                    Text(user.name)
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
        }
        .navigationBarTitle("Connect Hub")
                .navigationBarItems(trailing: NavigationLink(destination: GroupView(groupedUsers: groupedUsers)) {
                    Image(systemName: "person.2.fill")
                })
            }
        }

