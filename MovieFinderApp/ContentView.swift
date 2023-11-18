//
//  ContentView.swift
//  MovieFinderApp
//
//  Created by William Wong on 11/16/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = MovieViewModel() //look more into this
    @State private var movie: Movie?
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Popular Movies")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .offset(x: 10)
                
                if let movies = viewModel.movies {
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 15) {
                                ForEach(movies) { movie in
                                NavigationLink(destination: MovieInfoView(movie: movie)) {
                                    WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath)"))
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 120, height: 180)
                                            .cornerRadius(8)
                                    }
                                }
                            }
                            .offset(x: 10, y: -250)
                        }
                        Spacer()
                    } else {
                        Text("Fetching data...")
                }
            }
            .background(.black)
            .task {
                do {
                    try await viewModel.fetchData()
                } catch MovieError.invalidURL {
                    print("Invalid URL")
                } catch MovieError.invalidResponse {
                    print("invalid response")
                } catch MovieError.invalidData {
                    print("invalid data")
                } catch {
                    print("unexpected error")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
