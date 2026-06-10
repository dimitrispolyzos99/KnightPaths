//
//  ButtonView.swift
//  KnightPaths
//
//  Created by Dimitris Poluzos on 10/6/26.
//

import SwiftUI

struct ButtonsStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundStyle(.white)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(Color.accent)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}
