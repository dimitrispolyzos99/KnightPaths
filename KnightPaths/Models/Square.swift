//
//  Square.swift
//  KnightPaths
//
//  Created by Dimitris Poluzos on 9/6/26.
//

struct Square: Equatable, Hashable {
    let row: Int
    let col: Int
    
    func moved(byRow rowOffset: Int, byCol colOffset: Int) -> Square {
        Square(row: row + rowOffset, col: col + colOffset)
    }
}

extension Square: CustomStringConvertible {
    var description: String {
        "(\(row + 1),\(col + 1))"
    }
}
