//
//  UserDetailView.swift
//  Friend Face
//
//  Created by Nikolay Simeonov on 10.08.25.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                // Profile Card
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text(user.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text(user.isActive ? "Active" : "Inactive")
                            .font(.caption)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(user.isActive ? Color.green.opacity(0.2) : Color.red.opacity(0.2))
                            .foregroundColor(user.isActive ? .green : .red)
                            .clipShape(Capsule())
                    }
                    
                    Text(user.company)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("\(user.age) years old")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                // About Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("About")
                        .font(.headline)
                    Text(user.about)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                // Contact Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Contact")
                        .font(.headline)
                    Label(user.email, systemImage: "envelope")
                    Label(user.address, systemImage: "house")
                    Label("Registered: \(user.registered.formatted(date: .abbreviated, time: .omitted))", systemImage: "calendar")
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                // Friends Navigation
                NavigationLink {
                    FriendsView(friends: user.friends)
                } label: {
                    Text("View Friends")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                .padding(.top)
            }
            .padding()
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let fakeUser = User(
        id: "1",
        isActive: true,
        name: "Nick",
        age: 24,
        company: "Apple",
        email: "nick@apple.com",
        address: "The Polygon",
        about: "A promising developer with a passion for building intuitive and beautiful SwiftUI apps.",
        registered: Date.distantPast,
        friends: [
            Friends(id: "1", name: "Teodor"),
            Friends(id: "2", name: "Neli")
        ]
    )
    
    NavigationStack {
        UserDetailView(user: fakeUser)
    }
}
