//
//  CloseButton.swift
//  CineApp
//
//  Created by Carlos on 14/2/23.
//

import SwiftUI

public struct CloseButtonView: View {
    // MARK: - Properties
    let tintColor: Color?
    let action: () -> ()
    
    init(action: @escaping () -> Void, tintColor: Color?) {
        self.action = action
        self.tintColor = tintColor ?? TVThemeColor.TVBlack.Color
    }
    
    // MARK: - View
    public var body: some View {
        Button(action: {
            self.action()
        }) {
            Image(systemName: "xmark.circle.fill")
                .renderingMode(.template)
                .foregroundColor(tintColor)
                .font(.largeTitle)
        }
        .disabled(false)
        .opacity(1.0)
    }
}
