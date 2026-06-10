//
//  BoardViewModel.swift
//  KnightPaths
//
//  Created by Dimitris Poluzos on 10/6/26.
//

import SwiftUI
import Combine

final class BoardViewModel: ObservableObject {
    var size: Int
    @Published var start: Square?
    @Published var end: Square?
    @Published var paths: [[Square]] = []
    @Published var selectedPathIndex: Int?

    init(size: Int = 8) {
        self.size = size
    }
    
    func select(_ square: Square) {
        if start == nil {
            start = square
        } else if end == nil {
            end = square
            guard let start, let end else { return }
            let solver = KnightSolver(board: Board(size: size))
            paths = solver.paths(from: start, to: end)
        }
    }
    
    func selectPath(_ index: Int) {
        selectedPathIndex = index
    }
    
    func reset() {
        start = nil
        end = nil
        paths = []
        selectedPathIndex = nil
    }
    var hasNoSolution: Bool {
        end != nil && paths.isEmpty
    }
}
