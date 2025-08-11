//
//  ContentView.swift
//  Friend Face
//
//  Created by Nikolay Simeonov on 6.08.25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = Model()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(model.user) { info in
                    NavigationLink {
                        UserDetailView(user: info)
                    } label: {
                        HStack(spacing: 12) {
                            // Profile pic
                            ZStack {
                                Circle()
                                    .fill(Color.accentColor.opacity(0.2))
                                    .frame(width: 50, height: 50)
                                Text(String(info.name.prefix(1)))
                                    .font(.headline)
                                    .foregroundColor(.accentColor)
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Text(info.name)
                                        .font(.headline)
                                    Spacer()
                                    Text(info.isActive ? "Active" : "Inactive")
                                        .font(.caption)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 2)
                                        .background(info.isActive ? Color.green.opacity(0.2) : Color.red.opacity(0.2))
                                        .foregroundColor(info.isActive ? .green : .red)
                                        .clipShape(Capsule())
                                }
                                
                                Text(info.company)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                                Text("\(info.age) years old")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Friend Face")
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
