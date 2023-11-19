//
//  ContentView.swift
//  Bookworm
//
//  Created by Ramill Ibragimov on 19.11.2023.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            Text("Count: \(books.count)")
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Book", systemImage: "plus") {
                            showingAddScreen.toggle()
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
        }
    }
}

#Preview {
    ContentView()
}
