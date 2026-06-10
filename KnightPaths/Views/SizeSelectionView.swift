//
//  SizeSelectionView.swift
//  KnightPaths
//
//  Created by Dimitris Poluzos on 10/6/26.
//

import SwiftUI

struct SizeSelectionView: View {
    @State private var size = 8

    var body: some View {
        NavigationStack {
            ZStack {
                Color.appBackground
                    .ignoresSafeArea()
                VStack(spacing: 24) {
                    Text("Knight Paths")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundStyle(.white)
                    Text("♞")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    Text("Select board size")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    
                    Picker("Size", selection: $size) {
                        ForEach(6...16, id: \.self) { n in
                            Text("\(n) × \(n)").tag(n)
                                .foregroundColor(.white)
                        }
                    }
                    .pickerStyle(.wheel)
                    
                    NavigationLink("Start") {
                        BoardView(size: size)
                    }
                    .buttonStyle(ButtonsStyle())
                }
                .padding()
            }
        }
    }
}

#Preview {
    SizeSelectionView()
}
