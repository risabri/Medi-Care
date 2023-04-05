//
//  MessageView.swift
//  mediConnect_
//
//  Created by Rita Sabri on 4/4/23.
//
import SwiftUI

struct MessageView: View {
    let user: User
    
    @State private var messages: [Message] = [
        Message(id: 0, text: "Please be respectiful and not share personal information", sender: .other)
    ]
    @State private var inputText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(messages) { message in
                        MessageBubble(message: message)
                            .padding(.horizontal)
                    }
                }
            }
            
            HStack {
                TextField("Type your message...", text: $inputText)
                    .padding(8)
                    .background(Color(white: 0.9))
                    .cornerRadius(8)
                
                Button(action: {
                    sendMessage()
                }) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.blue)
                }
                .padding(.leading, 4)
            }
            .padding()
        }
        .navigationBarTitle("Messages with \(user.name)", displayMode: .inline)
    }
    
    func sendMessage() {
        if !inputText.trimmingCharacters(in: .whitespaces).isEmpty {
            let message = Message(id: messages.count, text: inputText, sender: .me)
            messages.append(message)
            inputText = ""
        }
    }
}

enum MessageSender {
    case me
    case other
}

struct Message: Identifiable {
    let id: Int
    let text: String
    let sender: MessageSender
}

struct MessageBubble: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.sender == .me {
                Spacer()
            }
            
            Text(message.text)
                .padding(10)
                .background(message.sender == .me ? Color.blue : Color.gray.opacity(0.3))
                .foregroundColor(message.sender == .me ? .white : .black)
                .cornerRadius(10)
            
            if message.sender == .other {
                Spacer()
            }
        }
    }
}
