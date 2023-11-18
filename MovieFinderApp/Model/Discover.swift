//
//  Discover.swift
//  MovieFinderApp
//
//  Created by William Wong on 11/16/23.
//

import SwiftUI

struct Discover: Codable {
    let results: [Movie]
}

struct Movie: Identifiable, Codable {
    let id: Int
    let title: String
    let overview: String?
    let posterPath: String
    let voteAverage: Float
    
}

enum MovieError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
