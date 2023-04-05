//
//  SelectUsersView.swift
//  mediConnect_
//
//  Created by Rita Sabri on 4/4/23.
//

// SelectUsersView.swift

import SwiftUI

struct SelectUsersView: View {
    let users: [User]
    @State private var selectedUsers: Set<User> = []
    
    var body: some View {
        VStack {
            List(users) { user in
                Button(action: {
                    if selectedUsers.contains(user) {
                        selectedUsers.remove(user)
                    } else {
                        selectedUsers.insert(user)
                    }
                }) {
                    HStack {
                        Image(user.profileImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipped()
                        Text(user.name)
                        Spacer()
                        if selectedUsers.contains(user) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            
            Button(action: {
                print("Invitations sent to:")
                for user in selectedUsers {
                    print(user.name)
                }
            }) {
                Text("Send Invitations")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationBarTitle("Select Users", displayMode: .inline)
    }
}

