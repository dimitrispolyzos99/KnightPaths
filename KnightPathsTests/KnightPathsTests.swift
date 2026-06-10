//
//  KnightPathsTests.swift
//  KnightPathsTests
//
//  Created by Dimitris Poluzos on 9/6/26.
//

@testable import KnightPaths

import Testing

struct KnightPathsTests {

    @Test func samColorReturnsNoPaths() {
        let solver = KnightSolver(board: Board(size: 8))
        let result = solver.paths(from: Square(row: 0, col: 0), to: Square(row: 2, col: 2))
        #expect(result.isEmpty)
    }
    
    @Test func noPathsBetweenSameColorSquares() {
        let solver = KnightSolver(board: Board(size: 8))
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

}
