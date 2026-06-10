//
//  Knight.swift
//  KnightPaths
//
//  Created by Dimitris Poluzos on 9/6/26.
//

    
struct Knight {
    static let moves: [(rowOffset: Int, colOffset: Int)] = [
        (-2,  1), (-2, -1),
        ( 2,  1), ( 2, -1),
        (-1,  2), ( 1,  2),
        (-1, -2), ( 1, -2)
    ]
}
