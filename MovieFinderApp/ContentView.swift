//
//  ContentView.swift
//  MovieFinderApp
//
//  Created by William Wong on 11/16/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = MovieViewModel()
   
    var body: some View {
        NavigationView {
            ZStack {
                if let movies = viewModel.movies {
                    List {
                        ForEach(movies) { movie in
                            Text(movie.title)
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                    }
                    .listStyle(PlainListStyle())
                } else {
                    Text("Loading info")
                }
            }
            .navigationTitle("Popular Movies")
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
