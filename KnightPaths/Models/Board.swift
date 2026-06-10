//
//  Board.swift
//  KnightPaths
//
//  Created by Dimitris Poluzos on 9/6/26.
//

import Foundation

struct Board {
    
    let size: Int   //The size of a board is calculated by size * size
    
    func contains(_ square: Square) -> Bool {
        square.row >= 0 && square.row < size && square.col >= 0 && square.col < size
    }
}
