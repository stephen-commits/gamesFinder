//
//  ContentView.swift
//  gamesFinder
//
//  Created by Stephen TELLO on 21/06/2020.
//  Copyright © 2020 Stephen TELLO. All rights reserved.
//

import SwiftUI

let maxId = 1

struct ContentView: View {
    @State private var games = [Game]()
    
    var body: some View {
        NavigationView {
            MasterView(games: $games)
                .navigationBarTitle(Text("Vos jeux"))
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(
                        action: {
                            withAnimation { self.games.insert(Game(name: "New Game",released_year: 2020), at: 0) }
                        }
                    ) {
                        Image(systemName: "plus")
                    }
                )
            DetailView()
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct MasterView: View {
    @Binding var games: [Game]

    var body: some View {
        List {
            ForEach(games, id: \.id) { game in
                NavigationLink(
                    destination: DetailView(selectedGame: game)
                ) {
                    Text(game.description)
                }
            }.onDelete { indices in
                indices.forEach { self.games.remove(at: $0) }
            }
        }
    }
}

struct DetailView: View {
    var selectedGame: Game?

    var body: some View {
        Group {
            Text(selectedGame?.description ?? "An error as occured")
        }.navigationBarTitle(Text("Votre jeux"))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
