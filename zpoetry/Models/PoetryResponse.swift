//
//  PoetryResponse.swift
//  zpoetry
//
//  Created by ziyad on 04/02/24.
//

import Foundation

struct PoetryResponse: Codable {
    var title: String
    var author: String
    var lines: [String]=[]
    var linecount: String
}
