//
//  KnightSolver.swift
//  KnightPaths
//
//  Created by Dimitris Poluzos on 9/6/26.
//

import Foundation

struct KnightSolver {
    let board: Board
    
    func nextSquares(from square: Square) -> [Square] {
        var result: [Square] = []
        for move in Knight.moves {
            let candidate = square.moved(byRow: move.rowOffset, byCol: move.colOffset)
            if board.contains(candidate) {
                result.append(candidate)
            }
        }
        return result
    }
    
    func paths(from start: Square, to end: Square) -> [[Square]] {
        var paths: [[Square]] = [[start]]
        for _ in 1...3 {
            var nextPaths: [[Square]] = []
            for path in paths {
                let last = path.last!
                for next in nextSquares(from: last) {
                    nextPaths.append(path + [next])
                }
            }
            paths = nextPaths
        }
        return paths.filter { $0.last == end }
    }
}
