//
//  MovieInfoView.swift
//  MovieFinderApp
//
//  Created by William Wong on 11/17/23.
//

import SwiftUI

struct MovieInfoView: View {
    
    let movie: Movie

    var body: some View {
        Text(movie.title)
    }
}

#Preview {
    MovieInfoView(movie: Movie.example)
}

