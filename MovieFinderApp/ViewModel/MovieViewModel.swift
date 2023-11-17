//
//  MovieViewModel.swift
//  MovieFinderApp
//
//  Created by William Wong on 11/16/23.
//

import SwiftUI

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie]?
    func fetchData() {
        let url = URL(string:
        "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&api_key=cd2f880bd0a6cb102fb4d863c5be630e")
        
        URLSession.shared.dataTask(with: url!) { data, response , error in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                do {
                    let discover = try JSONDecoder().decode(Discover.self, from: data)
                    self.movies = discover.results
                } catch (let error) {
                    print(error)
                    return
                }
            } else {
                print("error")
                return
            }
        }.resume()
    }
}
