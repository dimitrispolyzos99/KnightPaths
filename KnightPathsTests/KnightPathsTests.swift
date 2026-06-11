//
//  KnightPathsTests.swift
//  KnightPathsTests
//
//  Created by Dimitris Poluzos on 9/6/26.
//

@testable import KnightPaths

import Testing

struct KnightPathsTests {
    
    let solver = KnightSolver(board: Board(size: 8))

    
    @Test func noPathsBetweenSameColorSquares() {
        let start = Square(row: 0, col: 0)
        for row in 0..<8 {
            for col in 0..<8 {
                let end = Square(row: row, col: col)
                if (row + col) % 2 == 0 {
                #expect(solver.paths(from: start, to: end).isEmpty)
                }
            }
        }
    }
    
    @Test func returnsAllExpectedPathsForSolvableCase() {
            let paths = solver.paths(from: Square(row: 0, col: 0),
                                     to: Square(row: 0, col: 1))
            #expect(paths.count == 2)
        }
    
    @Test func everyPathIsAValidKnightRoute() {
        let start = Square(row: 0, col: 0)
        let end = Square(row: 0, col: 1)
        let paths = solver.paths(from: start, to: end)

        for path in paths {
            #expect(path.count == 4)
            #expect(path.first == start)
            #expect(path.last == end)

            for (from, to) in zip(path, path.dropFirst()) {
                let dRow = abs(from.row - to.row)
                let dCol = abs(from.col - to.col)
                #expect((dRow == 2 && dCol == 1) || (dRow == 1 && dCol == 2))
            }
        }
    }

}
