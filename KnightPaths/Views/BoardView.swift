//
//  BoardView.swift
//  KnightPaths
//
//  Created by Dimitris Poluzos on 10/6/26.
//

import SwiftUI

struct BoardView: View {
    @StateObject private var viewModel: BoardViewModel
    
    init(size: Int) {
        _viewModel = StateObject(wrappedValue: BoardViewModel(size: size))
    }
    
    var body: some View {
        ZStack {
            Color.appBackground
                .ignoresSafeArea()
            VStack {
                VStack(spacing: 0) {
                    Button("Reset") {
                        viewModel.reset()
                    }
                    .buttonStyle(ButtonsStyle())
                    .padding()
                }
                GeometryReader { geometry in
                    
                    let labelSize: CGFloat = 20
                    let squareSize = (geometry.size.width - labelSize) / CGFloat(viewModel.size)

                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Color.clear
                                .frame(width: labelSize, height: labelSize)

                            ForEach(0..<viewModel.size, id: \.self) { col in
                                Text("\(col + 1)")
                                    .font(.caption2)
                                    .foregroundStyle(.white.opacity(0.6))
                                    .frame(width: squareSize, height: labelSize)
                            }
                        }
                        ForEach(0..<viewModel.size, id: \.self) { row in
                            HStack(spacing: 0) {
                                Text("\(row + 1)")
                                    .font(.caption2)
                                    .foregroundStyle(.white.opacity(0.6))
                                    .frame(width: labelSize, height: squareSize)

                                ForEach(0..<viewModel.size, id: \.self) { col in
                                    ZStack {
                                        Rectangle()
                                            .fill(color(for: Square(row: row, col: col)))

                                        Text(symbol(for: Square(row: row, col: col)))
                                            .font(.system(size: squareSize * 0.8))
                                    }
                                    .frame(width: squareSize, height: squareSize)
                                    .onTapGesture {
                                        viewModel.select(Square(row: row, col: col))
                                    }
                                }
                            }
                        }
                    }
                }
                .aspectRatio(1, contentMode: .fit)
                
                ScrollView {
                    if !viewModel.paths.isEmpty {
                        Text("Solutions (\(viewModel.paths.count))")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                    VStack(alignment: .leading, spacing: 8) {
                        if viewModel.hasNoSolution {
                            Text("No solution found")
                        } else {
                            ForEach(viewModel.paths.indices, id: \.self) { index in
                                Text(describe(viewModel.paths[index]))
                                    .font(.system(.body, design: .monospaced))
                                    .foregroundStyle(.white)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.6)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .onTapGesture {
                                        viewModel.selectPath(index)
                                    }

                                if index < viewModel.paths.count - 1 {
                                    Divider()
                                        .overlay(.white.opacity(0.2))
                                }
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.cardBackground)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal)
                }
            }
            .padding()
        }
    }
    
    private func color(for square: Square) -> Color {
        if square == viewModel.start {
            return .green
        } else if square == viewModel.end {
            return .red
        } else if let index = viewModel.selectedPathIndex,
                  viewModel.paths[index].contains(square) {
            return .yellow
        } else {
            return ((square.row + square.col) % 2 == 0) ? .black : .white
        }
    }
    
    private func symbol(for square: Square) -> String {
        if square == viewModel.start {
            return "♞"
        } else if square == viewModel.end {
            return "◎"
        } else {
            return ""
        }
    }


    private func describe(_ path: [Square]) -> String {
        path.map { $0.description }.joined(separator: " → ")
    }
}
#Preview {
    BoardView(size: 8)
}
