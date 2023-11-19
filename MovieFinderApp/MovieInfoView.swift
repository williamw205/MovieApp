//
//  MovieInfoView.swift
//  MovieFinderApp
//
//  Created by William Wong on 11/17/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieInfoView: View {
    
    var movie: Movie
    @ObservedObject var viewModel = MovieViewModel()
    //@Environment(\.presentationMode) var presentation

    var body: some View {
        
        
        VStack {
            ZStack {
                WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath)"))
                    .resizable()
                    .interpolation(.high)
                    .aspectRatio(contentMode: .fit)
                    //.cornerRadius(8)
                    .frame(height: 400)
                    .offset(x: 0, y: -170)
                
               /* Rectangle()
                    .fill(Color("bkColor").opacity(0.4))
                    .offset(y: -300)*/
                
                
                Rectangle()
                    .fill(Color("bkColor"))
                    .aspectRatio(contentMode: .fit)
                    //.frame(width: 500, height: 560)
                    .offset(y: 190)
                    .blur(radius: 10)
                
        
                    
            }
            
            Text(movie.title)
                .foregroundStyle(.white)
                .font(.custom("Axiforma-Bold", size: 20))
                .offset(y: -350)
        }
        
        
    }
}

#Preview {
    MovieInfoView(movie: Movie(id: 76600, title: "Avatar: The Way of Water", overview: "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.", posterPath: "/hZkgoQYus5vegHoetLkCJzb17zJ.jpg", voteAverage: 7.7), viewModel: MovieViewModel())
       
}

