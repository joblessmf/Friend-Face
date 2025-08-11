//
//  FriendsView.swift
//  Friend Face
//
//  Created by Nikolay Simeonov on 10.08.25.
//

import SwiftUI

struct FriendsView: View {
    let friends: [Friends]
    
    var body: some View {
        List {
            ForEach(friends) { f in
                HStack(spacing: 12) {
                    // Profile pic
                    ZStack {
                        Circle()
                            .fill(Color.accentColor.opacity(0.2))
                            .frame(width: 44, height: 44)
                        Text(String(f.name.prefix(1)))
                            .font(.headline)
                            .foregroundColor(.accentColor)
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(f.name)
                            .font(.headline)
                        Text("Friend")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 6)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Friends")
    }
}

#Preview {
    FriendsView(friends: [
        Friends(id: "3", name: "John"),
        Friends(id: "4", name: "Emily"),
        Friends(id: "5", name: "Chris")
    ])
}
