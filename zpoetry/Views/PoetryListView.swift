//
//  PoetryListView.swift
//  zpoetry
//
//  Created by ziyad on 04/02/24.
//

import SwiftUI

struct PoetryListView: View {
    let author: String
    @State var poetryResponse = [PoetryResponse]()
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(poetryResponse, id: \.title) { result in
                    NavigationLink(destination: PoetryDetailView(data: result)) {
                        Text(result.title)
                    }
                }
                if(poetryResponse.isEmpty){
                    HStack{
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle(author)
            .onAppear() {
                Api().getPoetries(author:author) { (poetryResponse) in
                    self.poetryResponse = poetryResponse
                }
            }
        }
    }
}

#Preview {
    PoetryListView(author:"Adam Lindsay Gordon")
}
