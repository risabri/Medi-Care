//
//  GroupView.swift
//  mediConnect_
//
//  Created by Rita Sabri on 4/4/23.
//

// GroupView.swift

import SwiftUI

struct GroupView: View {
    let groupedUsers: [Int: [User]]
    
    var body: some View {
        VStack {
            Text("message")
                .font(.title)
                .padding()
            
            List {
                ForEach(groupedUsers.keys.sorted(), id: \.self) { key in
                                    NavigationLink(destination: SelectUsersView(users: groupedUsers[key]!)) {
                                        Text("Create a group with people with medicine number \(key)")
                                    }
                                }
                            }
                        }
                        .navigationBarTitle("Create Group", displayMode: .inline)
                    }
                }
