//
//  MovieViewModel.swift
//  MovieFinderApp
//
//  Created by William Wong on 11/16/23.
//

import SwiftUI

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie]?
    
    func fetchData() async throws {
        
        let endpoint =  "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&api_key=cd2f880bd0a6cb102fb4d863c5be630e"
        
        //Creating url object from endpoint string
        
        guard let url = URL(string: endpoint) else {throw MovieError.invalidURL }
        
        //Response here refers to the http response codes on the internet
        //Such as error 404 or 500 server error
       
        //For data we need to convert the JSON into our
        //movie object
        
        //This URLSession is getting the data from the url (get request)
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw MovieError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            
            //Convert from snake case allows us to read in
            //a name such as node_id as nodeID (camel case)
            
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let discover = try decoder.decode(Discover.self, from: data)
            
            //Updating the movies property with the decoded results
            
            self.movies = discover.results
        } catch {
            throw MovieError.invalidData
        }
    }
}

