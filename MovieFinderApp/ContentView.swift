//
//  ContentView.swift
//  MovieFinderApp
//
//  Created by William Wong on 11/16/23.
//

import SwiftUI
import SDWebImageSwiftUI


struct ContentView: View {
    @ObservedObject var viewModel = MovieViewModel()
   
    var body: some View {
        
        
        NavigationView {
            VStack {
                Text("Popular Movies")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
                ZStack {
                    if let movies = viewModel.movies {
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 15) {
                                ForEach(movies) { movie in
                                    NavigationLink(destination: MovieInfoView()) {
                                        WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)"))
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 130, height: 200)
                                            .cornerRadius(8)
                                            .offset(y: -250)
                                    }
                                }
                            }
                            .padding(16)
                        }
                    } else {
                        Text("Loading info")
                    }
                }
            }
            .background(.black.opacity(0.95))
            .onAppear {
                viewModel.fetchData()
        }
        }
        
    }
}

#Preview {
    ContentView()
}
