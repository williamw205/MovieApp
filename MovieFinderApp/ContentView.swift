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
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                            Text("Popular Movies")
                                    .foregroundStyle(.white)
                                    .font(Font.custom("Axiforma-Bold", size: 23))
                                    .font(.system(size: 23))
                                    .offset(x: 10)
                        
                            if let movies = viewModel.movies {
                                ScrollView(.horizontal, showsIndicators: false) {
                                        LazyHStack(spacing: 16) {
                                            ForEach(movies) { movie in
                                                NavigationLink(destination: MovieInfoView(movie: movie)) {
                                                        WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath)"))
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            .frame(width: 160)
                                                            .cornerRadius(16)
                                                            .offset(x: 10)
                                                    }
                                                }
                                        }
                                    }
                                } else {
                                    Text("Fetching data...")
                            }
                        }
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
                .background(.black)
            }
        }
    
}

#Preview {
    ContentView()
}
