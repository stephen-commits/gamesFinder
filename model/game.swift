//
//  game.swift
//  gamesFinder
//
//  Created by Stephen TELLO on 22/06/2020.
//  Copyright © 2020 Stephen TELLO. All rights reserved.
//

import Foundation

class Game : Hashable{
    
    public var id: String
    public var name: String
    public var released_year: Int
    
    init(id : String, name : String, released_year: Int){
        self.id = id
        self.name = name
        self.released_year = released_year
    }
    
    init(name : String, released_year: Int){
        self.id = NSUUID().uuidString
        self.name = name
        self.released_year = released_year
    }
    
    public var description: String { return "\(name) - \(released_year)" }
        
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Game, rhs: Game) -> Bool {
        lhs.id == rhs.id
    }
}
