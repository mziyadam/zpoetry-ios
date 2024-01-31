//
//  Api.swift
//  zpoetry
//
//  Created by ziyad on 31/01/24.
//

import Foundation

class Api : ObservableObject{
    
    func getAuthors(completion:@escaping (AuthorResponse) -> ()) {
        guard let url = URL(string: "https://poetrydb.org/author") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let authorResponse = try! JSONDecoder().decode(AuthorResponse.self, from: data!)
            print(authorResponse)
            DispatchQueue.main.async {
                completion(authorResponse)
            }
        }.resume()
        
    }
    
    func getPoetries(author: String,completion:@escaping ([PoetryResponse]) -> ()) {
        let mAuthor=author.replacingOccurrences(of: " ", with: "%20")
        guard
            let url = URL(string: "https://poetrydb.org/author/\(mAuthor)")
        else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let poetryResponse = try! JSONDecoder().decode([PoetryResponse].self, from: data!)
            print(poetryResponse)
            DispatchQueue.main.async {
                completion(poetryResponse)
            }
        }.resume()
        
    }
}
