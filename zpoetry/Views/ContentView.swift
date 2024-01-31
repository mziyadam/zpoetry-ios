//
//  ContentView.swift
//  zpoetry
//
//  Created by ziyad on 31/01/24.
//

import SwiftUI

struct ContentView: View {
    @State var authorResponse = AuthorResponse()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(authorResponse.authors, id: \.self) { result in
                    NavigationLink(destination: PoetryListView(author: result)) {
                        Text(result)
                    }
                }
                if(authorResponse.authors.isEmpty){
                    HStack{
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle("Authors")
            .onAppear() {
                Api().getAuthors { (authorResponse) in
                    self.authorResponse = authorResponse
                }
            }
        }
    }
}

#Preview {
    ContentView()
    
}
